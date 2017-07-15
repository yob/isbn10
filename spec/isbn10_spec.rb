require 'isbn10'

describe ISBN10 do
  it "should identify a valid ISBN10" do
    expect(ISBN10.new("0140449043").valid?).to be_truthy
    expect(ISBN10.new("0-140-44904-3").valid?).to be_truthy
    expect(ISBN10.new("043429067X").valid?).to be_truthy
    expect(ISBN10.new("043429067x").valid?).to be_truthy
  end

  it "should identify an invalid ISBN10" do
    expect(ISBN10.valid?(nil)).to              be_falsey
    expect(ISBN10.valid?("0-1404-4904-2")).to   be_falsey
    expect(ISBN10.valid?("0140449042")).to   be_falsey
    expect(ISBN10.valid?("978184354916")).to   be_falsey
    expect(ISBN10.valid?(Array)).to            be_falsey
    expect(ISBN10.valid?(Array.new)).to        be_falsey
  end

  it "should calculate a ISBN10 check digit correctly" do
    expect(ISBN10.complete("014044904")).to eql("0140449043")
  end

  it "should convert to an EAN correctly" do
    expect(ISBN10.new("0140449042").to_ean).to be_nil
    expect(ISBN10.new("0140449043").to_ean).to eql("9780140449044")
    expect(ISBN10.new("043429067X").to_ean).to eql("9780434290673")
    expect(ISBN10.new("043429067x").to_ean).to eql("9780434290673")
  end

  it "should convert to a grouped ISBN10 correctly" do
    expect(ISBN10.new("0809141875").grouped).to be_nil
    expect(ISBN10.new("0140361278").grouped).to eql("0-14-036127-8")
    expect(ISBN10.new("0321350316").grouped).to eql("0-321-35031-6")
    expect(ISBN10.new("0809141876").grouped).to eql("0-8091-4187-6")
    expect(ISBN10.new("0855615346").grouped).to eql("0-85561-534-6")
    expect(ISBN10.new("094727748X").grouped).to eql("0-947277-48-X")
    expect(ISBN10.new("0975601873").grouped).to eql("0-9756018-7-3")
    expect(ISBN10.new("1430219483").grouped).to eql("1-4302-1948-3")
    expect(ISBN10.new("1855548453").grouped).to eql("1-85554-845-3")
    expect(ISBN10.new("1921640065").grouped).to eql("1-921640-06-5")
  end

end
