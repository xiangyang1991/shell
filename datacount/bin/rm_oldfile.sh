#!/bin/bash



find * -ctime +7


rm -rvf  $(echo "`ls | awk '{print $1}'`" | awk '{print $1"/20160721"}')
