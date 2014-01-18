name             'soa_tools'
maintainer       'Federico Gimenez Nieto'
maintainer_email 'fgimenez@coit.es'
license          'Apache-2.0'
description      'Installs/Configures SOA related Tools'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

recipe 'default', 'Installs all the SOA related tools'
recipe 'wso2_registry', 'Installs WSO2 Registry'
#recipe 'wso2_ues', 'Installs WSO2 User Engagement Server'
#recipe 'bamos_server', 'Installs BAMOS server'

%w[ubuntu debian].each do |os|
  supports os
end

%w[apt java].each do |dp|
  depends dp
end
