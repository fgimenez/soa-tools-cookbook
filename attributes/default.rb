default['soa_tools']['download_dir'] = '/usr/local/src'
default['soa_tools']['tarball_extension'] = '.tar.gz'
default['soa_tools']['init_script'] = 'bin/wso2server.sh'

default['soa_tools']['wso2greg_version'] = '4.6.0'
default['soa_tools']['wso2is_version'] = '2.4.0'
default['soa_tools']['wso2bam_version'] = '2.4.0'
default['soa_tools']['wso2ues_version'] = '1.0.0'

%w(wso2greg wso2is wso2bam wso2ues).each do |component|
  default['soa_tools']["#{component}_tarball_url"] = "http://www.dolgia.com/public/system/#{component}-#{node['soa_tools'][component+'_version']}#{node['soa_tools']['tarball_extension']}"
  default['soa_tools']["#{component}_install_dir"] = "/usr/local/#{component}"
  default['soa_tools']["#{component}_src_dir"] = "#{node['soa_tools']['download_dir']}/#{component}-#{node['soa_tools'][component+'_version']}"
end

