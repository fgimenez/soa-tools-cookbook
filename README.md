[![Build Status](https://travis-ci.org/fgimenez/orientdb-cookbook.png)](https://travis-ci.org/fgimenez/soa-tools-cookbook)

SOA Governance Tools Cookbook
=================
This cookbook has recipes to install the following SOA Governance Tools:

* WSO2 Registry (http://docs.wso2.org/display/Governance460)
* TODO: WSO2 User Engagement Server (http://docs.wso2.org/display/UES100)
* TODO: Bamos Server (https://code.google.com/p/ossoagov/)

Requirements
------------

It has been tested on Ubuntu 12.04, but should work on any platform where Java 1.6 works. 

Recipes
-------
* default: Installs all the SOA tools
* wso2_registry: Installs WSO2 registry
* TODO: wso2_gadget_server: Installs WSO2 gadget server
* TODO: bamos_server: Installs BAMOS server

Attributes
----------
* node['soa_tools']['wso2_registry_install_dir']: insstallation directory for WSO2 Registry
* node['soa_tools']['wso2_registry_version']: Version of WSO2 Registry to install
* node['soa_tools']['wso2_registry_tarball_url']: URL to get the WSO2 Registry binaries


Running the tests
-----------------

This is done thanks to berkshelf and strainer:

    $ bundle
    $ bundle exec berks install
    $ bundle exec strainer test

Vagrant usage
-------------

For testing the cookbook with Vagrant 1.2+ you just have to execute bootstrap.sh:

    $ bootstrap.sh

It installs the required Vagrant plugins and launchs the machine. After the process you have a orientdb instance running in ```soa-tools.local``` host, ip 33.33.33.33 (you may need to provide root privileges to allow vagrant-hostmanager do its duty). You may, for example, access the WSO2 Governance Registry Console from https://soa-tools.local:9443/carbon

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

License and Authors
-------------------
MIT License

Authors: Federico Gimenez Nieto <fgimenez@coit.es>


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/fgimenez/soa-tools-cookbook/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

