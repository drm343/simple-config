#!/usr/bin/env python3
import sys

def header(name):
    return name[0].upper() + name[1:]

def next(name, index):
    counter = a[index:].find("_")

    if counter == -1:
        return (name, counter)
    else:
        index += counter + 1
        return (name[0:index] + name[index].upper() + name[index + 1:], index)


if len(sys.argv) == 2:
    arg = sys.argv[1]
    a = header(arg)
    index = 1

    while index != -1:
        a, index = next(a, index)

    print(a)
else:
    print("need 1 argument")
