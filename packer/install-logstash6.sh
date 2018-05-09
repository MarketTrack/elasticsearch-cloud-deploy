#!/bin/bash

# Get the PGP Key
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-6.x.list

apt-get update
if [ -z "$ES_VERSION" ]; then
    echo "Installing latest Logstash version"
    apt-get install logstash
else
    echo "Installing Logstash version $ES_VERSION"
    apt-get install logstash=$ES_VERSION
fi

mv logstash.conf /etc/logstash/conf.d/01-tcp-es.conf
