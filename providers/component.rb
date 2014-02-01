action :install do
  tarball_file = "#{new_resource.download_dir}/#{::File.basename(new_resource.tarball_url)}"

  remote_file tarball_file do
    action :create_if_missing
    source new_resource.tarball_url
  end

  execute "unzip #{new_resource.name} source" do
    command "tar -zxvf #{tarball_file}"
    cwd new_resource.download_dir
  end

  link new_resource.install_dir do
    to new_resource.src_dir
  end

  directory "#{new_resource.install_dir}/logs"

  template "/etc/init.d/#{new_resource.name}" do
    source "generic_init_script.erb"
    mode "0755"
    variables({install_dir: new_resource.install_dir,
               script_name: new_resource.name,
               init_script: new_resource.init_script})
  end
  
  service new_resource.name do
    action [:start, :enable]
    supports :restart => true, :reload => true
  end

  new_resource.updated_by_last_action(true)
end
