#!/bin/bash

httperf -v --server=test.csi.osuosl.org --port=80 --hog −−session−cookie --wsesslog=50,0,trisano-sequence-data --rate=0.5 --timeout=15 --think-timeout=15 > rate05.output
echo "completed 0.5"
sleep 20
httperf -v --server=test.csi.osuosl.org --port=80 --hog −−session−cookie --wsesslog=50,0,trisano-sequence-data --rate=1 --timeout=15 --think-timeout=15 > rate1.output
echo "completed 1"
sleep 20
httperf -v --server=test.csi.osuosl.org --port=80 --hog −−session−cookie --wsesslog=50,0,trisano-sequence-data --rate=2 --timeout=15 --think-timeout=15 > rate2.output
echo "completed 2"
sleep 20
httperf -v --server=test.csi.osuosl.org --port=80 --hog −−session−cookie --wsesslog=50,0,trisano-sequence-data --rate=4 --timeout=15 --think-timeout=15 > rate4.output
echo "completed 4"
sleep 20
httperf -v --server=test.csi.osuosl.org --port=80 --hog −−session−cookie --wsesslog=50,0,trisano-sequence-data --rate=6 --timeout=15 --think-timeout=15 > rate6.output
echo "completed 6"
sleep 20
httperf -v --server=test.csi.osuosl.org --port=80 --hog −−session−cookie --wsesslog=50,0,trisano-sequence-data --rate=8 --timeout=15 --think-timeout=15 > rate8.output
echo "completed 8"
sleep 20
httperf -v --server=test.csi.osuosl.org --port=80 --hog −−session−cookie --wsesslog=50,0,trisano-sequence-data --rate=10 --timeout=15 --think-timeout=15 > rate10.output
echo "completed 10"


# Doc details: http://www.hpl.hp.com/research/linux/httperf/httperf-man-0.9.pdf
#
# −−num−calls=N
# This option is meaningful for request−oriented workloads only. It specifies the total number of
# calls to issue on each connection before closing it. If N is greater than 1, the server must support
# persistent connections. The default value for this option is 1. If −−burst−length is set to R B ,
# then the N calls are issued in bursts of B pipelined calls each. Thus, the total number of such
# bursts will be N/B (per connection).
# −−rate=X
# Specifies the fixed rate at which connections or sessions are created. Connections are created by
# default, sessions if option −−wsess or −−wsesslog has been specified. In both cases a rate of 0
# results in connections or sessions being generated sequentially (a new session/connection is initiated
# as soon as the previous one completes). The default value for this option is 0
#
# Note that httperf has a “-v” option which is helpful in seeing progress. One can specify a very 
# large number of sessions in –wsesslog and then watch httperf print out its requests/sec 
# measurements every 5 #seconds and after one to two dozen measurements, hit ctrl-C to get the overall stats.
# 
