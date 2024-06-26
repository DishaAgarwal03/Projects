from collections import deque
from itertools import repeat
from psutil import virtual_memory, swap_memory

class _Generic(object):
    def __init__(self):
        self.plot_data = deque(list(repeat(0, 60)), 60)
        self.comp_data = dict()
        info = virtual_memory()
        self.installed = round(info.total * 9.537 * 1e-7)
        self.total = round(info.total * 9.31 * 1e-7)
        self.used = None
        self.usage = None
        self.available = None
        self.free = None
        self.standby = None
        self.modified = None

class _Linux(_Generic):
    def __init__(self):
        super(_Linux, self).__init__()

    def update(self):
        info = virtual_memory()
        swap = swap_memory()
        self.usage = round(info.percent)
        self.used = round(info.used * 9.31 * 1e-7)
        self.available = round(info.available * 9.537 * 1e-7)
        self.standby = round(info.cached * 9.537 * 1e-7) + round(info.buffers * 9.537 * 1e-7)
        self.free = self.available - self.standby
        self.modified = round(swap.used * 9.537 * 1e-7)
        self.plot_data.appendleft(self.usage)
        self.comp_data = {
            "In use": self.used,
            "Modified": self.modified,
            "Standby": self.standby,
            "Free": self.free
        }

class RAM:
    def __new__(cls, os, *args, **kwargs):
        if os != "linux":
            raise NotImplementedError("Your operating system is not supported.")
        else:
            return _Linux()