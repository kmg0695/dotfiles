#!/bin/bash

cd ~/Library/Preferences/aacs/ || exit
wget http://fvonline-db.bplaced.net/export/keydb_eng.zip
unzip -o keydb_eng.zip
rm keydb_eng.zip wget-log*
exit 0
