#!/bin/sh

mvn install:install-file -Dfile=./json-simple-1.1.2.jar \
    -DgroupId=org.json.simple -DartifactId=json-simple -Dversion=1.1.2 \
    -Dpackaging=jar

mvn install:install-file -Dfile=./mysql-connector-java-3.0.14-production-bin.jar \
    -DgroupId=com.mysql -DartifactId=mysql-connector-java -Dversion=3.0.14 \
    -Dpackaging=jar

mvn install:install-file -Dfile=./jcaptcha-api-1.0.jar \
    -DgroupId=com.octo -DartifactId=jcaptcha-api -Dversion=1.0 \
    -Dpackaging=jar

mvn install:install-file -Dfile=./jcaptcha-integration-2.0.jar \
    -DgroupId=com.octo -DartifactId=jcaptcha-integration -Dversion=2.0 \
    -Dpackaging=jar

mvn install:install-file -Dfile=./jcaptcha-alpha-2.0.jar \
    -DgroupId=com.octo -DartifactId=jcaptcha-alpha -Dversion=2.0 \
    -Dpackaging=jar

mvn install:install-file -Dfile=./quartz-all-1.6.5.jar \
    -DgroupId=org.quartz -DartifactId=quartz-all -Dversion=1.6.5 \
    -Dpackaging=jar

# mvn install:install-file -Dfile=./SDK4J-2.0.jar \
mvn install:install-file -Dfile=./qq-sdk4j-2.0.jar \
    -DgroupId=com.qq -DartifactId=SDK4j -Dversion=2.0 \
    -Dpackaging=jar

# 'tebie' seems about coremail integration
mvn install:install-file -Dfile=./apiclient-1.6.jar \
    -DgroupId=tebie.applib -DartifactId=apiclient -Dversion=1.6 \
    -Dpackaging=jar

mvn install:install-file -Dfile=./weibo4j-2.2.jar \
    -DgroupId=weibo4j -DartifactId=weibo4j -Dversion=2.2 \
    -Dpackaging=jar

mvn install:install-file -Dfile=./duckling-utils-1.1.5.jar \
    -DgroupId=net.duckling -DartifactId=cloudy-utils -Dversion=1.1.5 \
    -Dpackaging=jar

# WARNING: duckling-common-6.1 is incomplete due to bad source
mvn install:install-file -Dfile=./duckling-common-6.0.6.jar \
    -DgroupId=net.duckling -DartifactId=duckling-common -Dversion=6.0.6 \
    -Dpackaging=jar

mvn install:install-file -Dfile=./uaf-common-1.1.jar \
    -DgroupId=net.duckling -DartifactId=uaf-common -Dversion=1.1 \
    -Dpackaging=jar

mvn install:install-file -Dfile=./websso-1.0.jar \
    -DgroupId=net.duckling -DartifactId=websso -Dversion=1.0 \
    -Dpackaging=jar

mvn install:install-file -Dfile=./version-1.0.0.jar \
    -DgroupId=net.duckling -DartifactId=version -Dversion=1.0.0 \
    -Dpackaging=jar

 # net.sourceforge:pinyin4j:jar:2.5.0, 
 # net.spy:spymemcached:jar:2.8.0, 



