#include <LPC17xx.h>

char lane1[14], lane2[14];
int lane = 1, gameOver = 0;

void delay(unsigned int r1) {
    unsigned int r;
    for(r=0;r<r1;r++);
    return;
}

void clear_ports(void) {
    /* Clearing the lines at power on */
    LPC_GPIO0->FIOCLR = 0xFF<<23; //Clearing data lines
    return;
}

void write(int value, int type) {
    clear_ports();
    // the value is actually in the 23-26 bits
    LPC_GPIO0->FIOPIN = value; // Assign the value to the data lines
    if (type == 0) {
        LPC_GPIO0->FIOCLR = 1<<27; // clear bit RS for Command
    } else {
        LPC_GPIO0->FIOSET = 1<<27; // set bit RS for Data
    }
    LPC_GPIO0->FIOSET = 1<<28; // EN=1
    delay(40);
    LPC_GPIO0->FIOCLR = 1<<28; // EN =0
    return;
}

void lcd_comdata(int value, int type) {
    // value is 8 bit
    // it is split into 2 4 bit values
    // the 4 bit values are shifted to the 23-26 bits
    int temp = value & 0xF0;
    temp = temp << 19;
    write(temp, type);
    temp = value & 0x0F;
    temp = temp << 23;
    write(temp, type);
    delay(1000);
    return;
}

void lcd_puts(unsigned char *st) {
    unsigned int i=0;
    unsigned int temp3;
    while(st[i]!='\0') {
        temp3 = st[i++];
        lcd_comdata(temp3, 1);
    }
    return;
}

void lcd_init() {
    /*Ports initialized as GPIO */
    LPC_PINCON->PINSEL1 &= 0xFC003FFF; //P0.23 to P0.28
    /*Setting the directions as output */
    LPC_GPIO0->FIODIR |= 0xFF<<23;
    /* Clearing the lines at power on */
    clear_ports();
    /* LCD initialization sequence */
    lcd_comdata(0x30, 0);
    delay(30000);
    lcd_comdata(0x30, 0);
    delay(30000);
    lcd_comdata(0x30, 0);
    delay(30000);
    lcd_comdata(0x20, 0);
    delay(30000);
    lcd_comdata(0x28, 0);
    delay(30000);
    lcd_comdata(0x0C, 0);
    delay(30000);
    lcd_comdata(0x06, 0);
    delay(30000);
    lcd_comdata(0x01, 0);
    delay(30000);
    return;
}

void laneChange() {
    // lane 1 is top row, lane 2 is bottom row
    if (lane == 1) {
        lane = 2;
        lane1[3] = ' ';
        lane2[3] = '>';
    }
    else {
        lane = 1;
        lane1[3] = '>';
        lane2[3] = ' ';
    }
}

void updateLanes(int clock1, int clock2) {
    int i;
    for (i = 0; i < 13; i++) {
        if (i < 4) {
            continue;
        }
        else {
            lane1[i] = lane1[i+1];
            lane2[i] = lane2[i+1];
        }
    }
    if (clock1 != 0) {
        lane1[13] = ' ';
    }
    else {
        lane1[13] = '-';
    }
    if (clock2 != 0) {
        lane2[13] = ' ';
    }
    else {
        lane2[13] = '-';
    }
}

void check() {
    if (lane == 1) {
        if (lane1[4] == '-') {
            gameOver = 1;
        }
    }
    else {
        if (lane2[4] == '-') {
            gameOver = 1;
        }
    }
}

int main(void) {
    int clock1 = 0, clock2 = 2, i;
    SystemInit();
    SystemCoreClockUpdate();

    // For SW2 (Connect to CNB)
    LPC_PINCON->PINSEL4 &= 0xF0FFFFFF; //Configure Port2 PIN P2.12 and P2.13 as GPIO function
	LPC_GPIO2->FIODIR &= ~(1 << 12); //Configure pin 12 for input

    lcd_init();

    // initialize lanes

    for (i = 0; i < 14; i++) {
        lane1[i] = ' ';
        lane2[i] = ' ';
    }

    lane1[3] = '>';

    while(gameOver != 1) {

        if (LPC_GPIO2->FIOPIN & (1 << 12)) {
            laneChange();
        }

        lcd_comdata(0x01, 0); // display clear
        delay_lcd(5000);

        updateLanes(clock1, clock2);

        lcd_comdata(0x80, 0); // 1st row
        delay(800);
        lcd_puts(&lane1[0]);
        lcd_comdata(0xC0, 0); // 2nd row
        delay(800);
        lcd_puts(&lane2[0]);
        delay(800);
        check();

        clock1 = (clock1 + 1) % 4;
        clock2 = (clock2 + 1) % 4;

        delay(20000);

    }

    lcd_comdata(0x01, 0); // display clear
    delay_lcd(5000);
    char *gameOverMessage = "Game Over!";
    lcd_comdata(0x80, 0); // 1st row
    delay(800);
    lcd_puts(gameOverMessage);
}
