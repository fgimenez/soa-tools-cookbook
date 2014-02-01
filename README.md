[![Build Status](https://travis-ci.org/fgimenez/soa-tools-cookbook.png)](https://travis-ci.org/fgimenez/soa-tools-cookbook)

SOA Tools Cookbook
=================
This cookbook has recipes to install the following SOA Tools:

* WSO2 Registry (http://docs.wso2.org/display/Governance460)
* WSO2 User Engagement Server (http://docs.wso2.org/display/UES100)
* WSO2 Business Activity Monitor (http://docs.wso2.org/display/BAM240)
* WSO2 Identity Server (http://docs.wso2.org/display/IS460)

Requirements
------------

It has been tested on Ubuntu 12.04, but should work on any platform where Java 1.6 works. 

Recipes
-------
* wso2greg: Installs WSO2 Governance Registry
* wso2bam: Installs WSO2 Business Activity Monitor
* wso2ues: Installs WSO2 User Engagement Server
* wso2is: Installs WSO2 Identity Server

Attributes
----------
%w[wso2greg wso2bam wso2ues wso2is].each do |component|
* node['soa_tools']["#{component}_install_dir"]: installation directory for ```component```
* node['soa_tools']["#{component}_version"]: Version of ```component``` to install
* node['soa_tools']["#{component}_tarball_url"]: URL to get the ```component``` binaries
end

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

It installs the required Vagrant plugins and launchs the machine. After the process you have a carbon instance running in ```soa-tools.local``` host, ip 33.33.33.33 (you may need to provide root privileges to allow vagrant-hostmanager do its duty) with the default component given to the chef-solo provisioner in the ```Vagrantfile```. Then you can access the access the component's Console from https://soa-tools.local:9443/carbon

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

