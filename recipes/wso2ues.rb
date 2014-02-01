include_recipe 'java::default'

soa_tools_component 'wso2ues' do
  tarball_url node['soa_tools']['wso2ues_tarball_url']
  download_dir node['soa_tools']['download_dir']
  src_dir node['soa_tools']['wso2ues_src_dir']
  install_dir node['soa_tools']['wso2ues_install_dir']
  init_script node['soa_tools']['init_script']
end
