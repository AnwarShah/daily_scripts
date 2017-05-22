#!/bin/bash

find $HOME/.rvm -follow -iname '*.gem' -type f -exec cp -u -v {} /media/anwar/Data/Software/RubyGems/gems/ \;
