Duckling UMT
============

UMT stands for User Management Tool.

All jars that can not be obtained from the public maven repository
have been put into *'localdep'* directory, so you need to install them
into your local repository manually (install-dep.sh) before building.

Some duckling dependencies such as falcon-cache, falcon-mstatic,
clb-api, etc. can be downloaded and built (mvn install) from the same
account 'duckling-falcon' at Github.

* frmwrk
* falcon/common,cache,mstatic
* clb/clb-api
* umt/umt-api
* vmt/vmt-api

NOTICE: vmt-api depends on umt-api so that umt-api must be installed first.

The 'umt.war' could be made by 'mvn package'.

Please check 'Install.txt' for how to deploy and config (in Chinese).

