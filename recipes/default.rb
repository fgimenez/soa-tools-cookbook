%w[apt java soa_tools::wso2_registry 
soa_tools::wso2_ues soa_tools::wso2_bam].each do |rcp|
  include_recipe rcp
end
