base_install_dir = File.dirname(node['soa_tools']['wso2_registry_install_dir'])
tarball_file_base = "wso2greg-#{node['soa_tools']['wso2_registry_version']}"
tarball_file = "#{tarball_file_base}.tar.gz"
tarball_file_path = "#{base_install_dir}/#{tarball_file}"

remote_file tarball_file_path do
  action :create_if_missing
  source node['soa_tools']['wso2_registry_tarball_url']
end

execute 'unzip wso2 registry source' do
  command "tar -zxvf #{tarball_file}"
  cwd base_install_dir
end

link node['soa_tools']['wso2_registry_install_dir'] do
  to "#{base_install_dir}/#{tarball_file_base}"
end

directory "#{node['soa_tools']['wso2_registry_install_dir']}/logs"

file tarball_file_path do
  action :delete
end

template "/etc/init.d/wso2_registry" do
  source "generic_init_script.erb"
  mode "0755"
  variables({install_dir: node['soa_tools']['wso2_registry_install_dir'],
             script_name: 'wso2_registry',
             init_script: node['soa_tools']['wso2_registry_init_script']})
end

service 'wso2_registry' do
  action [:start, :enable]
  supports :restart => true, :reload => true
end
