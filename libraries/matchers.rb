if defined?(ChefSpec)

  def install_soa_tools_component(message)
    ChefSpec::Matchers::ResourceMatcher.new(:soa_tools_component, :install, message)
  end

end
