#!/bin/sh

# Copyright (C) 2007, 2008, 2009 The Collaborative Software Foundation
#
# This file is part of TriSano.
#
# TriSano is free software: you can redistribute it and/or modify it under the 
# terms of the GNU Affero General Public License as published by the 
# Free Software Foundation, either version 3 of the License, 
# or (at your option) any later version.
#
# TriSano is distributed in the hope that it will be useful, but 
# WITHOUT ANY WARRANTY; without even the implied warranty of 
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License 
# along with TriSano. If not, see http://www.gnu.org/licenses/agpl-3.0.txt.

# Path on the file system where the BI server was installed
#export BI_SERVER_PATH=/usr/local/pentaho/server/biserver-ce
export BI_SERVER_PATH=/home/josh/pentaho/biserver-ce

# JDBC database driver class
export TRISANO_DB_DRIVER="org.postgresql.Driver"

# Credentials for warehouse database
export TRISANO_DB_USER="josh"
export TRISANO_DB_PASSWORD="josh"

# JDBC connection information
export TRISANO_DB_HOST='localhost'
export TRISANO_DB_PORT='5432'
export TRISANO_DB_NAME='trisano_warehouse'
export TRISANO_JDBC_URL="jdbc:postgresql://${TRISANO_DB_HOST}:${TRISANO_DB_PORT}/${TRISANO_DB_NAME}"

# URL that the BI server can is running on (needed to publish updates)
export BI_SERVER_URL="http://localhost:8080"
export BI_PUBLISH_URL="${BI_SERVER_URL}/pentaho/RepositoryFilePublisher"

# User credentials for an admin on the BI server. (also needed for
# publishing)
export BI_USER_NAME=joe
export BI_USER_PASSWORD=password

# move to the script's dir because we can't change where pentaho looks
# for some things.
cd $BI_SERVER_PATH/pentaho-solutions/TriSano

java -cp $BI_SERVER_PATH/tomcat/webapps/trisano/WEB-INF/lib/jruby-complete-1.2.0.jar org.jruby.Main \
    $BI_SERVER_PATH/pentaho-solutions/TriSano/build_metadata.rb