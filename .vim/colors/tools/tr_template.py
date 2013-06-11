#!/usr/bin/env python3

import os
import re
import sys
from copy import copy
from subprocess import Popen
from subprocess import PIPE


class Color:
    def __init__(self, name, hex, xterm_code):
        self.name = name
        self.hex_code = hex
        self.xterm_code = xterm_code


def build_color_dict(file_in):
    color_dict = dict()
    for line in file_in:
        line_split = line.split()
        name = line_split[0]
        hex_code = line_split[1]
        #cmd = ['echo', hex_code, '|', './conv-rgb2xterm']
        cmd = ['sh', '-c', 'echo %s | ./conv-rgb2xterm' % hex_code]
        jibberish = str(Popen(cmd, stdout=PIPE).communicate()[0])
        xterm_code = re.match('.*?(\d+)m.*', jibberish).groups()[0]
        color_dict[name] = Color(name, hex_code, xterm_code)
    return color_dict


def translate_template(template_file, file_out, color_dict):
    color_name_list = list(color_dict.keys())

    def regexp(s):
        """ pre: s == 'fg' or s == 'bg' of s == 'sp' """
        if s == 'fg' or s == 'bg':
            head = '(%s=' % s
            glue = ')|(%s=' % s
            tail = ')'
            pattern = head + glue.join(color_name_list) + tail
        elif s == 'sp':
            pattern = 'sp=\w+'
        return re.compile(pattern)
    def replacer(s):
        """ pre: s == 'fg' or s == 'bg' or s == 'sp' """
        def f(match):
            name = match.group(0)[3:]
            if s == 'fg' or s == 'bg':
                color = color_dict[name]
                return 'gui%s=#%s cterm%s=%s' % (s, color.hex_code, s, color.xterm_code)
            elif s == 'sp':
                return 'gui=%s cterm=%s' % (name, name)
        return f

    fg_regexp = regexp('fg')
    bg_regexp = regexp('bg')
    sp_regexp = regexp('sp')
    fg_replacer = replacer('fg')
    bg_replacer = replacer('bg')
    sp_replacer = replacer('sp')

    for line in template_file:
        line_out1 = re.sub(fg_regexp, fg_replacer, line)
        line_out2 = re.sub(bg_regexp, bg_replacer, line_out1)
        line_out3 = re.sub(sp_regexp, sp_replacer, line_out2)
        file_out.write(line_out3)


if __name__ == '__main__':
    color_map_file = open(sys.argv[1], 'r')
    color_dict = build_color_dict(color_map_file)
    for key in color_dict:
        c = color_dict[key]
        s = '%s %s %s %s' % (key, c.name, c.hex_code, c.xterm_code)
    template_file = open(sys.argv[2], 'r')
    translate_template(template_file, sys.stdout, color_dict)

