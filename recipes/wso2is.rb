include_recipe 'apt'
include_recipe 'java::default'

soa_tools_component 'wso2is' do
  tarball_url node['soa_tools']['wso2is_tarball_url']
  download_dir node['soa_tools']['download_dir']
  src_dir node['soa_tools']['wso2is_src_dir']
  install_dir node['soa_tools']['wso2is_install_dir']
  init_script node['soa_tools']['init_script']
end
