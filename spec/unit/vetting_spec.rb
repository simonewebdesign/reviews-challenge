require "spec_helper"
require "vetting"

describe "#contains_price?" do

  it "should work" do
    expect(Vetting.contains_price?("only £ 12.04 today")).to_not be_nil
    expect(Vetting.contains_price?("£ 13")).to_not be_nil
    expect(Vetting.contains_price?("£12.04")).to_not be_nil
    expect(Vetting.contains_price?("price: £12")).to_not be_nil
    expect(Vetting.contains_price?("foobar")).to be_nil    
  end
end
