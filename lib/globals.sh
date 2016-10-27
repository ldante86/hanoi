#!/bin/echo This file is a part of hanoi

PROGRAM="${0##*/}"
PROG_VERSION=1.0
DETAILS="Copyright (C) 2015 Luciano D. Cecere <Ldante86@aol.com>"
LEGAL="GNU General Public License Version 2"

export PATH=/bin:/usr/bin
unalias -a

BO=$(tput smso)
LD=$(tput rmso)
BOLD=$(tput bold)
UNBOLD=$(tput sgr0)

HELPFLAG="-[Hh]"

WIN3=7
WIN4=15
WIN5=31
WIN6=63
WIN7=127
WIN8=255
