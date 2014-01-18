require_relative 'spec_helper'

describe 'soa_tools::wso2_registry' do
  let(:install_dir) {'/usr/local/wso2-reg'}
  let(:base_install_dir) {File.dirname(install_dir)}
  let(:tarball_url) {'http://url'}
  let(:version) {'version'}
  let(:tarball_file_base) {"wso2greg-#{version}"}
  let(:tarball_file) {"#{tarball_file_base}.tar.gz"}
  let(:tarball_file_path) {"#{base_install_dir}/#{tarball_file}"}
  let(:init_script) {'init_script'}
  
  let(:runner) do
    runner = ChefSpec::Runner.new do |node|
      node.set[described_cookbook]['wso2_registry_install_dir'] = install_dir
      node.set[described_cookbook]['wso2_registry_tarball_url'] = tarball_url
      node.set[described_cookbook]['wso2_registry_version'] = version
      node.set[described_cookbook]['wso2_registry_init_script'] = init_script
    end
    runner.converge(described_recipe)
  end
  
  it 'should download the wso2 registry binary tarball' do
    expect(runner).to create_remote_file_if_missing(tarball_file_path).
                       with(source: tarball_url)
  end

  it 'should extract the tarball contents' do
    expect(runner).to run_execute("tar -zxvf #{tarball_file}").
                       with(cwd: base_install_dir)
  end

  it 'should symlink the sources directory' do
    expect(runner).to create_link(install_dir).
                       with(to: "#{base_install_dir}/#{tarball_file_base}")
  end

  it 'should remove the tarball' do
    expect(runner).to delete_file(tarball_file_path)
  end

  it 'should create the logs directory' do
    expect(runner).to create_directory("#{install_dir}/logs")
  end
    
  it 'should create the wso2 registry init script' do
    expect(runner).to create_template("/etc/init.d/wso2_registry").
                       with(variables: {install_dir: install_dir,
                                        script_name: 'wso2_registry',
                                        init_script: init_script},
                            source: "generic_init_script.erb",
                            mode: "0755")
  end

  it 'should enable and start the wso2_registry service' do
    expect(runner).to enable_service('wso2_registry')
    expect(runner).to start_service('wso2_registry')
  end
end
