name             'soa_tools'
maintainer       'Federico Gimenez Nieto'
maintainer_email 'fgimenez@coit.es'
license          'Apache-2.0'
description      'Installs/Configures SOA related Tools'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.1'

recipe 'default', 'Installs all the SOA related tools'
recipe 'wso2greg', 'Installs WSO2 Registry'
recipe 'wso2ues', 'Installs WSO2 User Engagement Server'
recipe 'wso2bam', 'Installs WSO2 Business Activity Monitor'
recipe 'wso2is', 'Installs WSO2 Identity Server'

%w[ubuntu debian].each do |os|
  supports os
end

%w[apt java].each do |dp|
  depends dp
end
