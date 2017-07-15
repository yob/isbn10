$LOAD_PATH << File.dirname(__FILE__) + "/../lib"

require 'spec'
require 'isbn10'

describe ISBN10 do
  it "should identify a valid ISBN10" do
    ISBN10.new("0140449043").valid?.should be_true
    ISBN10.new("0-140-44904-3").valid?.should be_true
    ISBN10.new("043429067X").valid?.should be_true
    ISBN10.new("043429067x").valid?.should be_true
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
    ISBN10.new("0140449043").to_ean.should eql("9780140449044")
    ISBN10.new("043429067X").to_ean.should eql("9780434290673")
    ISBN10.new("043429067x").to_ean.should eql("9780434290673")
  end

  it "should convert to a grouped ISBN10 correctly" do
    ISBN10.new("0809141875").grouped.should be_nil
    ISBN10.new("0140361278").grouped.should eql("0-14-036127-8")
    ISBN10.new("0321350316").grouped.should eql("0-321-35031-6")
    ISBN10.new("0809141876").grouped.should eql("0-8091-4187-6")
    ISBN10.new("0855615346").grouped.should eql("0-85561-534-6")
    ISBN10.new("094727748X").grouped.should eql("0-947277-48-X")
    ISBN10.new("0975601873").grouped.should eql("0-9756018-7-3")
    ISBN10.new("1430219483").grouped.should eql("1-4302-1948-3")
    ISBN10.new("1855548453").grouped.should eql("1-85554-845-3")
    ISBN10.new("1921640065").grouped.should eql("1-921640-06-5")
  end

end
