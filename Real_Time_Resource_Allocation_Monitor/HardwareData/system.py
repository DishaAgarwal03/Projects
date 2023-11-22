from platform import system, release, node
import distro
from re import match
from psutil import pids, Process, boot_time
import datetime

class _Generic(object):
    def __init__(self):
        self.boot_time = None
        self.release = None
        self.version = None
        self.os = system()
        self.hostname = node()
        self.process_list = dict()
        self.update()

    def update(self):
        self.boot_time = datetime.datetime.now() - datetime.datetime.fromtimestamp(boot_time())
        active = set(pids())
        add = active.difference(set(self.process_list.keys()))
        remove = set(self.process_list.keys()).difference(active)
        for pid in add:
            try:
                p = Process(pid)
                with p.oneshot():
                    name = p.name()
                    if name.strip() == "":
                        continue
                    self.process_list.update({pid: [name, pid, p.exe().strip()]})
            except:
                continue
        for pid in remove:
            del self.process_list[pid]


class _Linux(_Generic):
    def __init__(self):
        super(_Linux, self).__init__()
        self.release = distro.name(pretty=True)
        self.version = release()

class System:
    def __new__(cls, os, *args, **kwargs):
        if os != "linux":
            raise NotImplementedError("Your operating system is not supported.")
        else:
            return _Linux()