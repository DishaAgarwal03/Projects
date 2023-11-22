from platform import machine
from itertools import repeat
from collections import deque
from psutil import cpu_count, cpu_percent, cpu_freq, pids, Process, LINUX
from .cpuinfo import cpu as cpuinfo
from psutil import sensors_temperatures

class _Generic(object):
    def __init__(self):
        self.plot_data = deque(list(repeat(0, 60)), 60)
        self.brand = None
        self.arch = machine()
        self.cores = cpu_count(logical=False)
        self.logical = cpu_count()
        self.base_clk = None
        self.pkg_clk = None
        self.pkg_usage = None
        self.processes = None
        self.threads = None
        self.temperature = None

class _Linux(_Generic):
    def __init__(self):
        super(_Linux, self).__init__()
        self.brand = cpuinfo.info[0]["model name"]
        self.base_clk = round(float(cpuinfo.info[0]["cpu MHz"]))

    def update(self):
        self.pkg_clk = round(cpu_freq(percpu=False).current)
        self.pkg_usage = round(cpu_percent(percpu=False))
        self.threads = self.__thread_count()
        self.processes = len(pids())
        self.temperature = round(sensors_temperatures()["coretemp"][0].current) if len(
            sensors_temperatures().items()) > 0 else 0
        self.plot_data.appendleft(self.pkg_usage)

    @staticmethod
    def __thread_count():
        result = 0
        for pid in pids():
            try:
                p = Process(pid)
                with p.oneshot():
                    result += p.num_threads()
            except:
                continue
        return result

class CPU:
    def __new__(cls, os, *args, **kwargs):
        if os!="linux":
            raise NotImplementedError("Your operating system is not supported.")
        else:
            return _Linux()