#!/bin/sh
# ---------------------------------------------------------------------------
# Copyright 2017, BuzzingPixel, LLC
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the Apache License 2.0.
# http://www.apache.org/licenses/LICENSE-2.0
# ---------------------------------------------------------------------------

# Make sure the backups directory exists
mkdir -p /vagrant/localStorage/;
touch /vagrant/localStorage/.gitkeep;
mkdir -p /vagrant/localStorage/dbBackups/;
touch /vagrant/localStorage/dbBackups/.gitkeep;

# Dump the database
mysqldump -uroot -proot site > /vagrant/localStorage/dbBackups/site_latest_new.sql;

# Delete previous DB dump
if [ -e "/vagrant/localStorage/dbBackups/site_previous.sql" ]; then
	rm /vagrant/localStorage/dbBackups/site_previous.sql;
fi

# Rename latest DB dump to previous DB dump
if [ -e "/vagrant/localStorage/dbBackups/site_latest.sql" ]; then
	mv /vagrant/localStorage/dbBackups/site_latest.sql /vagrant/localStorage/dbBackups/site_previous.sql
fi

# Rename the new DB dump to the latest DB dump
mv /vagrant/localStorage/dbBackups/site_latest_new.sql /vagrant/localStorage/dbBackups/site_latest.sql
