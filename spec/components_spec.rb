require_relative 'spec_helper'

%w[wso2greg wso2is wso2bam wso2ues].each do |component|
  describe "soa_tools::#{component}" do
    let(:name) {component}
    let(:src_dir) {'src_dir'}
    let(:install_dir) {'install_dir'}
    let(:tarball_url) {'tarball_url'}
    let(:download_dir) {'download_dir'}
    let(:init_script) {'init_script'}
    
    let(:runner) do
      runner = ChefSpec::Runner.new do |node|
        node.set[described_cookbook]["#{component}_src_dir"] = src_dir
        node.set[described_cookbook]["#{component}_install_dir"] = install_dir
        node.set[described_cookbook]["#{component}_tarball_url"] = tarball_url
        node.set[described_cookbook]['download_dir'] = download_dir
        node.set[described_cookbook]['init_script'] = init_script
      end
      runner.converge(described_recipe)
    end
    
    it "includes the apt recipe" do
      expect(runner).to include_recipe('apt')
    end

    it "includes the java::default recipe" do
      expect(runner).to include_recipe('java::default')
    end

    it "uses the component resource for #{component}" do
      expect(runner).to install_soa_tools_component(name).with(
                         tarball_url: tarball_url,
                         src_dir: src_dir,
                         download_dir: download_dir,
                         src_dir: src_dir,
                         install_dir: install_dir,
                         init_script: init_script
                       )
    end
  end
end
