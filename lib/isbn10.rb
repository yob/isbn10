# coding: utf-8

require 'ean13'

class ISBN10

  class Version #:nodoc:
    Major = 1
    Minor = 2
    Tiny  = 0

    String = [Major, Minor, Tiny].join('.')
  end

  def initialize(str)
    @number = str.to_s.gsub("-","")
  end

  def valid?
    ISBN10.valid? @number
  end

  def self.valid?(isbn)
    isbn = isbn.to_s.gsub("-","")
    isbn.length == 10 && isbn.to_s.upcase == ISBN10.complete(isbn[0,9])
  end

  # Purely for generating new ean numbers
  def self.complete(nine)
    nine = nine.to_s
    return nil unless nine.length == 9 && nine.match(/\d{9}/)

    check = nine[0,1].to_i
    check = check + nine[1,1].to_i * 2
    check = check + nine[2,1].to_i * 3
    check = check + nine[3,1].to_i * 4
    check = check + nine[4,1].to_i * 5
    check = check + nine[5,1].to_i * 6
    check = check + nine[6,1].to_i * 7
    check = check + nine[7,1].to_i * 8
    check = check + nine[8,1].to_i * 9
    check = check % 11

    if check == 10
      "#{nine}X"
    else
      "#{nine}#{check}"
    end
  end

  def grouped
    return nil unless self.valid?

    if @number[0,1] == "0"
      grouped_zero
    elsif @number[0,1] == "1"
      grouped_one
    else
      nil
    end
  end

  def to_ean
    return nil unless self.valid?
    EAN13.complete("978#{@number[0,9]}")
  end

  private

  def grouped_zero
    groups = [0]
    buffer = @number[1,7].to_i

    if buffer < 2000000
      groups << @number[1,2]
      groups << @number[3,6]
    elsif buffer >= 2000000 && buffer < 7000000
      groups << @number[1,3]
      groups << @number[4,5]
    elsif buffer >= 7000000 && buffer < 8500000
      groups << @number[1,4]
      groups << @number[5,4]
    elsif buffer >= 8500000 && buffer < 9000000
      groups << @number[1,5]
      groups << @number[6,3]
    elsif buffer >= 9000000 && buffer < 9500000
      groups << @number[1,6]
      groups << @number[7,2]
    else
      groups << @number[1,7]
      groups << @number[8,1]
    end
    groups << @number[9,1]
    groups.join("-")
  end

  def grouped_one
    groups = [1]
    buffer = @number[1,7].to_i

    if buffer < 1000000
      groups << @number[1,2]
      groups << @number[3,6]
    elsif buffer >= 1000000 && buffer < 4000000
      groups << @number[1,3]
      groups << @number[4,5]
    elsif buffer >= 4000000 && buffer < 5500000
      groups << @number[1,4]
      groups << @number[5,4]
    elsif buffer >= 5500000 && buffer < 8698000
      groups << @number[1,5]
      groups << @number[6,3]
    elsif buffer >= 8698000 && buffer < 9990000
      groups << @number[1,6]
      groups << @number[7,2]
    else
      groups << @number[1,7]
      groups << @number[8,1]
    end
    groups << @number[9,1]
    groups.join("-")
  end

end
