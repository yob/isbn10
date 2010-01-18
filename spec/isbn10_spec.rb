$LOAD_PATH << File.dirname(__FILE__) + "/../lib"

require 'spec'
require 'isbn10'

describe ISBN10 do
  it "should identify a valid ISBN10" do
    ISBN10.new("0140449043").valid?.should be_true
    ISBN10.new("0-140-44904-3").valid?.should be_true
  end

  it "should identify a valid ISBN10" do
    ISBN10.valid?("0140449043").should be_true
    ISBN10.valid?("0-140-44904-3").should be_true
  end
  
  it "should identify an invalid ISBN10" do
    ISBN10.valid?(nil).should              be_false
    ISBN10.valid?("0-1404-4904-2").should   be_false
    ISBN10.valid?("0140449042").should   be_false
    ISBN10.valid?("978184354916").should   be_false
    ISBN10.valid?(Array).should            be_false
    ISBN10.valid?(Array.new).should        be_false
  end

  it "should calculate a ISBN10 check digit correctly" do
    ISBN10.complete("014044904").should eql("0140449043")
  end

  it "should convert to an EAN correctly" do
    ISBN10.new("0140449042").to_ean.should be_nil
    isbn = ISBN10.new("0140449043")
    isbn.valid?.should be_true
    isbn.to_ean.should eql("9780140449044")
  end

end
