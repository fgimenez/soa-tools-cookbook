require 'spec_helper'

describe "WSO2 Registry Service" do

  it "is listening on port 9443" do
    expect(port(9443)).to be_listening
  end

end
