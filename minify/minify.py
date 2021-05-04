#!/usr/bin/env python3

import io
import pathlib
import re
from datetime import datetime
from os.path import basename

COMMENT_RE = re.compile(r'^\s*#.*$')
SOURCE_RE = re.compile(r'^source\s+(.*)$')
FILE_HEADER = '''#
# UNIBASH PROJECT
#
# The unibash project aims to create a cross-platform extensible framework for
# making the terminal experience more pleasurable and efficient.
#
# Created by: Tiago C. T.
# Created on: %s
#
'''

def flatten(cwd, file_name, output_file):
    with open(cwd / file_name, 'r', encoding='utf-8') as f:
        for line in f:
            if re.match(COMMENT_RE, line):
                continue
            match = re.match(SOURCE_RE, line)
            if match:
                source_file_name = match.group(1)
                source_file_name = source_file_name.strip('"')
                source_file_name = source_file_name.strip("'")
                source_file_name = basename(source_file_name)
                flatten(cwd, source_file_name, output_file)
                continue

            output_file.write(line)

def main(entry_point):
    cwd = pathlib.Path(__file__).resolve().parents[0]

    now = datetime.now()
    date_string = now.strftime('%B %d, %Y')

    output = io.StringIO()
    output.write(FILE_HEADER % (date_string))
    flatten(cwd.parents[0], entry_point, output)

    contents = output.getvalue()
    contents = re.sub(r'\n{3,}', '\n\n', contents)
    with open(cwd / 'unibash.min.bashrc', 'w', encoding='utf-8') as f:
        f.write(contents)

if __name__ == '__main__':
    entry_point = 'unibash.bashrc'
    main(entry_point)
