
-- credentials(email_address, username, password)
insert into credentials values('admin123@gmail.com', 'admin', 'Admin_123');
insert into credentials values('Sarah_Brown2003@gmail.com', 'Sarah_Brown', 'SarahB$2003');
insert into credentials values('John_Smith2001@gmail.com', 'John_Smith', 'JohnSmith@1111');
insert into credentials values('Lily_Chen20@gmail.com', 'Lily_Chen', 'Chen@lil1');
insert into credentials values('Alex_Kim1999@gmail.com', 'Alex_Kim', 'AKim1234');
insert into credentials values('Anna_Johnson1999@gmail.com', 'Anna_Johnson', 'Anna_54322');

insert into credentials values('David_Lee1990@gmail.com', 'David_Lee', 'Davidxxx23@');
insert into credentials values('Emma_Davis1990@gmail.com', 'Emma_Davis', 'ED123@');
insert into credentials values('Lucas_Martin1234@gmail.com', 'Lucas_Martin', 'LMartin_1234');
insert into credentials values('Olivia_Taylor5678@gmail.com', 'Olivia_Taylor', 'Olivia_Taylor121');
insert into credentials values('Ethan_Clark1212@gmail.com', 'Ethan_Clark', 'Ethan_C@12');

insert into credentials values('Grace_Wilson2004@gmail.com', 'Grace_Wilson', 'G@1_Wilson');
insert into credentials values('Michael_Baker2004@gmail.com', 'Michael_Baker', 'MBaker!12');
insert into credentials values('Emily_Jones2003@gmail.com', 'Emily_Jones', 'Emily2003#');
insert into credentials values('Daniel_Garcia2001@gmail.com', 'Daniel_Garcia', '2001@Garcia');
insert into credentials values('Sophia_Nguyen2000@gmail.com', 'Sophia_Nguyen', 'Sophia@12@Nguyen');

insert into credentials values('William_Wright2000@gmail.com', 'William_Wright', 'WilliamWright@2000');
insert into credentials values('Isabella_Martinez2000@gmail.com', 'Isabella_Martinez', 'IsabellaM2222');
insert into credentials values('Matthew_Rodriguez1998@gmail.com', 'Matthew_Rodriguez', '@1239Rodriguez');
insert into credentials values('Ava_Thompson2@gmail.com', 'Ava_Thompson', 'Ava_432');
insert into credentials values('James_Davis11@gmail.com', 'James_Davis', 'James_Davis98#98');


-- agent(A_ID, name,address, email_address)						email_address references credentials
insert into agent values(101,'Sarah_Brown','IN,Udupi','Sarah_Brown2003@gmail.com');
insert into agent values(102,'John_Smith','UK,London','John_Smith2001@gmail.com');
insert into agent values(103,'Lily_Chen','IN,Mumbai','Lily_Chen20@gmail.com');
insert into agent values(104,'Alex_Kim','US,Los Angeles','Alex_Kim1999@gmail.com');
insert into agent values(105,'Anna_Johnson','IN,Manipal','Anna_Johnson1999@gmail.com');

insert into agent values(106,'David_Lee','IN,Gurugram','David_Lee1990@gmail.com');
insert into agent values(107,'Emma_Davis','AF,Egypt','Emma_Davis1990@gmail.com');


-- customer(C_ID, name, address, email_address)				email_address references credentials
insert into customer values(201,'Lucas_Martin','IN,Udupi','Lucas_Martin1234@gmail.com');
insert into customer values(202,'Olivia_Taylor','UK,London','Olivia_Taylor5678@gmail.com');
insert into customer values(203,'Ethan_Clark','IN,Mumbai','Ethan_Clark1212@gmail.com');
insert into customer values(204,'Grace_Wilson','US,Los Angeles','Grace_Wilson2004@gmail.com');
insert into customer values(205, 'Michael_Baker','IN,Manipal','Michael_Baker2004@gmail.com');

insert into customer values(206,'Emily_Jones','GE,Berlin','Emily_Jones2003@gmail.com');
insert into customer values(207,'Daniel_Garcia','UK,Brussels','Daniel_Garcia2001@gmail.com');
insert into customer values(208,'Sophia_Nguyen','IN,Delhi','Sophia_Nguyen2000@gmail.com');
insert into customer values(209,'William_Wright','IN,Hyderabad','William_Wright2000@gmail.com');
insert into customer values(210,'Isabella_Martinez','IN,Hyderabad','Isabella_Martinez2000@gmail.com');

insert into customer values(211,'Matthew_Rodriguez','GE,Frankfurt','Matthew_Rodriguez1998@gmail.com');
insert into customer values(212,'Ava_Thompson','IN,Delhi','Ava_Thompson2@gmail.com');
insert into customer values(213,'James_Davis','GE,Berlin','James_Davis11@gmail.com');


-- conversation(CON_ID, status, c_id, a_id)					c_id references customer, a_id references agent
insert into conversation values(1000, 'Ongoing', 201, 101);
insert into conversation values(1001, 'Resolved', 202, 102);
insert into conversation values(1002, 'Ongoing', 203, 103);
insert into conversation values(1003, 'Ongoing', 204, 104);
insert into conversation values(1004, 'Resolved', 205, 105);

insert into conversation values(1005, 'Resolved', 206, 106);
insert into conversation values(1006, 'Ongoing', 207, 107);
insert into conversation values(1007, 'Ongoing', 208, 101);
insert into conversation values(1008, 'Resolved', 209, 102);
insert into conversation values(1009, 'Resolved', 210, 103);

insert into conversation values(1010, 'Resolved', 211, 104);
insert into conversation values(1011, 'Resolved', 212, 105);
insert into conversation values(1012, 'Ongoing', 213, 106);

-- message(M_ID, sub, body, timestamp, sender_type, con_id, pm_id)	        con_id ref conversation, pm_id ref message
insert into message values(10001, '12/MAY/2023 10.30.45 am', 'C', 1000, NULL, 'Payment being declined', 'Hi, I just tried to make a purchase on your website but my payment was declined. Can you help me with this?');
insert into message values(10002, '12/MAY/2023 10.40.55 am', 'A', 1000, 10001, 'Payment', 'I am sorry to hear that. Can you please provide me with more information about the error message you received?');
insert into message values(10003, '12/MAY/2023 10.50.12 am', 'C', 1000, 10002, 'Payment', 'It says "transaction declined, please contact your bank"');
insert into message values(10004, '12/MAY/2023 10.42.55 am', 'A', 1000, 10003, 'Payment', 'Okay, it sounds like there might be an issue with your bank or credit card company. Have you checked with them to make sure there are no holds or issues with your account?');

insert into message values(10011, '18/JUL/2021 12.45.15 pm', 'C', 1001, null, 'Inquiry about order status', 'Hi, I placed an order last week and was wondering when it will be shipped. Can you provide me with an update? order number 123454321');
insert into message values(10012, '18/JUL/2021 01.00.15 pm', 'A', 1001, 10011, 'Order Status', 'Sure, let me look up your order information... It looks like your order is scheduled to ship tomorrow and should arrive by the end of the week.');

insert into message values(10021, '11/MAY/2023 11.00.15 am', 'C', 1002, null, 'Trouble with account creation', 'I am trying to create an account on your website but I''m having trouble. Can you help me with this?');
insert into message values(10022, '11/MAY/2023 11.50.15 am', 'A', 1002, 10021, 'Account Creation', 'Absolutely! Can you please provide me with some more information about the issue you''re facing?');
insert into message values(10023, '12/MAY/2023 01.00.45 pm', 'C', 1002, 10022, 'Account Creation', 'Well, I am not receiving the account activation email after I submit my information.');
insert into message values(10024, '12/MAY/2023 01.10.00 am', 'A', 1002, 10023, 'Account Creation', 'I see. Can you please check your spam or junk folder to see if the email ended up there? If it''s not there, I can manually activate your account for you');

insert into message values(10031, '12/MAY/2023 09.00.00 am', 'C', 1003, null, 'Unavailability of product', 'Hi, I am interested in purchasing a product PXYZ but it''s showing as out of stock on your website. Can you provide me with an update on when it will be available again?');
insert into message values(10032, '12/MAY/2023 09.30.44 am', 'A', 1003, 10031, 'Product Unavailability', 'Thank you for your inquiry. Let me check the availability of this product for you... It looks like we will be restocking it in approximately two weeks. Would you like me to notify you when it becomes available?');
insert into message values(10033, '12/MAY/2023 10.00.15 am', 'C', 1003, 10032, 'Product Unavailability', 'Yes, please do. Thank you!');
insert into message values(10034, '12/MAY/2023 10.10.11 am', 'A', 1003, 10033, 'Product Unavailability', 'Not a problem. I''ll add you to our waiting list and you''ll receive an email notification as soon as the product is back in stock. Let me know if you have any other questions or concerns.');


insert into message values(10041, '07/OCT/2021 02.20.30 pm', 'C', 1004, null, 'Request for return or exchange of product', 'I would like to return this product as it doesn''t meet my needs. How can I do that?');
insert into message values(10042, '07/OCT/2021 03.34.30 pm', 'A', 1004, 10041, 'Return/Exchange', 'I am sorry to hear that the product didn''t meet your expectations. Navigate to your account->my orders->return product');

insert into message values(10051, '28/DEC/2021 04.15.00 pm', 'C', 1005, null, 'Trouble in installing a product', 'Hi, I recently purchased a product from your website but I''m having trouble installing it. Can you help me with this?');
insert into message values(10052, '28/DEC/2021 04.30.00 pm', 'A', 1005, 10051, 'Product Installation', 'Absolutely! Can you please provide me with more information about the issue you''re facing?');
insert into message values(10053, '28/DEC/2021 05.22.20 pm', 'C', 1005, 10052, 'Product Installation', 'I''m trying to install the product on my computer but I keep getting an error message.');
insert into message values(10054, '28/DEC/2021 05.40.00 pm', 'A', 1005, 10053, 'Product Installation', 'Okay, let''s start by checking the system requirements for the product. Can you please confirm that your computer meets the minimum system requirements?');
insert into message values(10055, '29/DEC/2021 05.45.11 pm', 'C', 1005, 10054, 'Product Installation', 'Oh, I didn''t realize there were system requirements. Let me check... Okay, it looks like my computer doesn''t meet the minimum requirements.');
insert into message values(10056, '29/DEC/2021 05.55.00 pm', 'A', 1005, 10055, 'Product Installation', 'That might be the issue. I recommend upgrading your computer''s hardware or purchasing a different product that meets your computer''s requirements. Let me know if you need assistance with either of those options.');

insert into message values(10061, '11/MAY/2023 05.30.15 pm', 'C', 1006, null, 'Payment not going through', 'I''m trying to complete a purchase on your website but my payment is not going through. Can you help me with this?');
insert into message values(10062, '11/MAY/2023 05.41.22 pm', 'A', 1006, 10061, 'Payment', 'Of course! Can you please provide me with more information about the issue you''re facing?');

insert into message values(10071, '10/MAY/2023 05.59.00 pm', 'C', 1007, null, 'Trouble finding a specific product', 'Hi, I''m having trouble finding a specific product on your website. Can you help me navigate to it?');
insert into message values(10072, '11/MAY/2023 09.00.00 am', 'A', 1007, 10071, 'Website Navigation', 'Of course! What is the name of the product you''re looking for?');
insert into message values(10073, '11/MAY/2023 09.30.00 am', 'C', 1007, 10072, 'Website Navigation', 'It''s called the ABC widget.');
insert into message values(10074, '11/MAY/2023 10.00.13 am', 'A', 1007, 10073, 'Website Navigation', 'Alright, let me take a look... It looks like the ABC widget is located in our "Widgets" category. You can access this category by clicking on "Products" in the top navigation bar, then selecting "Widgets" from the dropdown menu.');

insert into message values(10081, '06/JAN/2022 05.00.45 pm', 'C', 1008, null, 'Questions about shipping', 'I''m wondering when my order will arrive. Can you provide me with an estimated delivery date? Order Id: 7665544636');
insert into message values(10082, '06/JAN/2022 05.10.45 pm', 'A', 1008, 10081, 'Order Status', 'Sure! Your order is estimated to arrive by tomorrow 5p.m');

insert into message values(10091, '05/JUN/2022 12.30.00 pm', 'C', 1009, null, 'Complaint about shipping time', 'Hi, I ordered a product from your website two weeks ago and it still hasn''t arrived. Can you please help me with this?');
insert into message values(10092, '05/JUN/2022 12.45.10 pm', 'A', 1009, 10091, 'Complaint', 'I''m sorry to hear that. Can you please provide me with your order number so I can look into it?');
insert into message values(10093, '05/JUN/2022 01.40.10 pm', 'C', 1009, 10092, 'Complaint', 'Sure, my order number is 123456.');
insert into message values(10094, '05/JUN/2022 02.30.00 pm', 'A', 1009, 10093, 'Complaint', 'Okay, let me check our system... It looks like your package was delayed due to unforeseen circumstances. I apologize for the inconvenience. Would you like me to process a refund for the shipping cost or expedite the shipping for your order?');
insert into message values(10095, '06/JUN/2022 12.55.55 pm', 'C', 1009, 10094, 'Complaint', 'I''d like to expedite the shipping, please.');
insert into message values(10096, '06/JUN/2022 02.00.15 pm', 'A', 1009, 10095, 'Complaint', 'Not a problem. I''ll upgrade your shipping to express and make sure it''s shipped out as soon as possible. You should receive a tracking number in your email shortly.');
insert into message values(10097, '07/JUN/2022 01.00.11 pm', 'C', 1009, 10096, 'Complaint', 'Thank you for your help.');

insert into message values(10101, '26/DEC/2022 03.45.15 pm', 'C', 1010, null, 'Complaint about customer service experience', 'Hi, I recently reached out to your customer service team about an issue I was having with one of your products, and I was really disappointed with the service I received. I felt like my concerns weren''t being taken seriously and I wasn''t given any helpful solutions. Can you please help me with this?');
insert into message values(10102, '26/DEC/2022 03.54.15 pm', 'A', 1010, 10101, 'Complaint', 'I''m sorry to hear that you had a negative experience with our customer service team. Can you please provide me with more information about your issue so I can understand what went wrong?');
insert into message values(10103, '26/DEC/2022 04.15.15 pm', 'C', 1010, 10102, 'Complaint', 'Sure. I purchased one of your products and it wasn''t working properly. I contacted your customer service team through email and I didn''t get a response for several days. When I finally did get a response, the agent I spoke to didn''t seem to understand my issue and just gave me generic troubleshooting steps that didn''t solve the problem');
insert into message values(10104, '26/DEC/2022 05.00.00 pm', 'A', 1010, 10103, 'Complaint', 'I see. That''s definitely not the level of service we strive to provide. I apologize for the frustration this has caused you. Can you please provide me with your email address and the date you reached out to our customer service team so I can investigate this further?');
insert into message values(10105, '26/DEC/2022 05.59.00 pm', 'C', 1010, 10104, 'Complaint', 'Sure, my email address is Matthew_Rodriguez1998@gmail.com and I reached out to your team on May 1st.');
insert into message values(10106, '27/DEC/2022 09.00.00 am', 'A', 1010, 10105, 'Complaint', 'Thank you. Let me look into this... It looks like there was a delay in our response time due to a high volume of inquiries, but that''s no excuse for the poor quality of service you received. I want to make this right for you. Can I offer you a replacement product or a refund for your original purchase, and also an additional discount on your next order with us?');
insert into message values(10107, '27/DEC/2022 11.00.00 am', 'C', 1010, 10106, 'Complaint', 'I appreciate the offer, but I''m not sure I want to do business with your company again after this experience');
insert into message values(10108, '27/DEC/2022 11.03.00 am', 'A', 1010, 10107, 'Complaint', 'I understand. I want to assure you that we take our customer service seriously and we''ll be taking steps to improve our response times and quality of service. I''m sorry we weren''t able to meet your expectations, but I want to thank you for bringing this to our attention so we can do better in the future');
insert into message values(10109, '27/DEC/2022 02.00.22 pm', 'C', 1010, 10108, 'Complaint', 'Thank you for your apology. I appreciate your efforts to improve.');

insert into message values(10111, '11/FEB/2023 04.20.50 pm', 'C', 1011, null, 'Guidance with forgotten password', 'Hi, I can''t seem to remember my password and I need to access my account. Can you help me reset it?');
insert into message values(10112, '11/FEB/2023 04.33.00 pm', 'A', 1011, 10111, 'Forgotten Password', 'Of course! Let me send you a password reset link to your registered email address. Please click on the link and follow the instructions to create a new password.');
insert into message values(10113, '11/FEB/2023 05.11.11 pm', 'C', 1011, 10112, 'Forgotten Password', 'Thank you so much! I was able to reset my password and access my account');

insert into message values(10121, '11/MAY/2023 09.00.00 am', 'C', 1012, null, 'Assistance with product selection', 'Hi, I''m looking to purchase a new product but I''m not sure which one to choose. Can you provide me with some recommendations?');
insert into message values(10122, '11/MAY/2023 09.10.00 am', 'A', 1012, 10121, 'Guidance', 'Of course! Can you please provide me with some more information about what you''re looking for in a product? For example, what features are important to you, or what is your budget?');
insert into message values(10123, '12/MAY/2023 09.30.10 am', 'C', 1012, 10122, 'Assistance with product selection', 'Well, I''m looking for a new laptop for work and I need something that''s portable but also powerful enough to handle multiple programs at once. My budget is around $1000');
insert into message values(10124, '12/MAY/2023 09.40.10 am', 'A', 1012, 10123, 'Guidance', 'Based on those requirements, I would recommend our XYZ model. It has a lightweight design but also comes with a powerful processor and ample storage space. It also falls within your budget. Would you like more information on this product?');


commit;


