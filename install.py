#!/usr/bin/env python
import os,sys
from stat import ST_MODE, S_ISDIR
from os.path import expanduser

def getPath(fileName):
    return os.path.realpath(fileName)

def isDir(fileName):
    mode = os.stat(fileName)[ST_MODE]
    return S_ISDIR(mode)

def isDotFile(fileName):
    return not isDir(fileName) and fileName.startswith('.')

def symLinkHome(fileName):
    homeDir = expanduser("~")
    os.symlink(getPath(fileName), os.path.join(homeDir, fileName))

def createSymLinks():
    for fileName in os.listdir(os.getcwd()):
        if isDotFile(fileName):
            try:
                symLinkHome(fileName)
                print "Created symlink for {}.".format(fileName)
            except OSError:
                print "Couldn't symlink file: {}. File exists.".format(fileName)

createSymLinks()

# TODO: copy even some dirs
# auto install ansible?
# TODO: maybe create ansible playbook, call that to install... those...
# TODO: Install some sys dependencies if they don't exist (like ruby, clojure, boot, nodejs), oh-my-zsh, tmux
# TODO: The repo installs here should be idempotent
