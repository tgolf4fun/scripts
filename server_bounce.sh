#!/bin/bash
#------------------------------------------------------------------------------
# Filename: emt_service_bounce.sh
# Author  : K. Wright
# Date    : 2014-08-04
# Purpose : Restart tomcat via AppDynamics agent / tc-server user.
# Ticket  : OPI-31424
#
#------------------------------------------------------------------------------
# Revision |    Date    |Prog | Description
#----------+------------+-----+------------------------------------------------
#  1.00.00 | 2014-08-04 | kjw | Initial release.
#------------------------------------------------------------------------------

sversion=1.0.00

echo -----------------------------------
echo Session Start: `date "+%Y/%m/%d %H:%M:%S"`
echo +

# Bounce the tomcat service
sudo /sbin/service tomcat stop
# Give tomcat a moment
sleep 5
sudo /sbin/service tomcat start

echo +
echo Session End: `date "+%Y/%m/%d %H:%M:%S"`
