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
* clb/clb-api
* falcon/common,cache,mstatic
* umt/umt-api
* vmt/vmt-api

NOTICE: vmt-api depends on umt-api so that umt-api must be installed first.

The 'umt.war' could be made by 'mvn package'.

With umt.war, 1) Setup tomcat and unpack umt.war. Edit
server.xml/ROOT.xml for "<Host>", "appBase", "xmlBase", and
"docBase". UMT need to be deployed as the ROOT app.  

2) In WEB-INF/conf, copy umt-TEMPLATE.properties to umt.properties,
and edit umt.properties with right info regarding mysql databases and
the email account.

3) Create databases in mysql. Tables will be created automatically.

4) Start tomcat and enjoy!
