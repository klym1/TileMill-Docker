```
CREATE DATABASE bag;
CREATE SCHEMA tilemill;
CREATE EXTENSION postgis; # per db/user context

python3 ./bagextract.py -jc # set up tables
python3 ./bagextract.py -e 9999STA01052011.zip # populate db with data from *.zip file

```