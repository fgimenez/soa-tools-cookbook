%w[apt java soa_tools::wso2_registry 
soa_tools::wso2_ues soa_tools::bamos_server].each do |rcp|
  include_recipe rcp
end
