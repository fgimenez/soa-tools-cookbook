default['soa_tools']['wso2_registry_install_dir'] = '/usr/local/wso2_registry'
default['soa_tools']['wso2_registry_version'] = '4.6.0'
default['soa_tools']['wso2_registry_tarball_url'] = "http://www.dolgia.com/public/system/wso2greg-#{node['soa_tools']['wso2_registry_version']}.tar.gz"

default['soa_tools']['wso2_registry_init_script'] = 'source /etc/profile && ./bin/wso2server.sh'
