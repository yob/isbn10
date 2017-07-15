require 'isbn10'

describe ISBN10 do
  it "should identify a valid ISBN10" do
    expect(ISBN10.new("0140449043").valid?).to be_truthy
    expect(ISBN10.new("0-140-44904-3").valid?).to be_truthy
  end

  it "should identify a valid ISBN10" do
    expect(ISBN10.valid?("0140449043")).to be_truthy
    expect(ISBN10.valid?("0-140-44904-3")).to be_truthy
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
    isbn = ISBN10.new("0140449043")
    expect(isbn.valid?).to be_truthy
    expect(isbn.to_ean).to eql("9780140449044")
  end

end
