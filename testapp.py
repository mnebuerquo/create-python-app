#!/usr/bin/env python
import scipy

def do_something(x):
    """
    Do something so we have something to test.
    >>> do_something(3)
    16
    >>> do_something(7)
    24
    """
    return (x+5)*2

def meaning_of_life():
    """
    Just a test to make sure we know what this is all about.
    >>> meaning_of_life()
    42
    """
    return 42

def abject_failure():
    """
    Just a test to see something fail.
    >>> abject_failure()
    True
    """
    return False

def main():
    print(do_something(8))
    print(meaning_of_life())

if __name__ == "__main__":
    main()
