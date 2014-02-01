require_relative 'spec_helper'

describe 'soa_tools::wso2greg' do
  let(:name) {'wso2greg'}
  let(:src_dir) {'src_dir'}
  let(:install_dir) {'install_dir'}
  let(:tarball_url) {'http://www.example.com/tarball_url.tar.gz'}
  let(:download_dir) {'download_dir'}
  let(:init_script) {'init_script'}
  let(:tarball_file) {"#{download_dir}/#{::File.basename(tarball_url)}"}
  
  let(:runner) do
    runner = ChefSpec::Runner.new(step_into: ['soa_tools_component']) do |node|
      node.set[described_cookbook]['wso2greg_src_dir'] = src_dir
      node.set[described_cookbook]['wso2greg_install_dir'] = install_dir
      node.set[described_cookbook]['wso2greg_tarball_url'] = tarball_url
      node.set[described_cookbook]['download_dir'] = download_dir
      node.set[described_cookbook]['init_script'] = init_script
    end
    runner.converge(described_recipe)
  end

  it 'should download the wso2 registry binary tarball' do
    expect(runner).to create_remote_file_if_missing(tarball_file).
                       with(source: tarball_url)
  end

  it 'should extract the tarball contents' do
    expect(runner).to run_execute("tar -zxvf #{tarball_file}").
                       with(cwd: download_dir)
  end
  
  it 'should symlink the sources directory' do
    expect(runner).to create_link(install_dir).
                       with(to: src_dir)
  end

  it 'should create the logs directory' do
    expect(runner).to create_directory("#{install_dir}/logs")
  end

  it 'should create the wso2 registry init script' do
    expect(runner).to create_template("/etc/init.d/wso2greg").
                       with(variables: {install_dir: install_dir,
                                        script_name: 'wso2greg',
                                        init_script: init_script},
                            source: "generic_init_script.erb",
                            mode: "0755")
  end

  it 'should enable and start the wso2greg service' do
    expect(runner).to enable_service('wso2greg')
    expect(runner).to start_service('wso2greg')
  end

end
