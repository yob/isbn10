# coding: utf-8

require 'ean13'

class ISBN10

  class Version #:nodoc:
    Major = 1
    Minor = 0
    Tiny  = 0

    String = [Major, Minor, Tiny].join('.')
  end

  def initialize(str)
    @number = str.to_s
  end

  def valid?
    ISBN10.valid? @number
  end

  def self.valid?(isbn)
    isbn = isbn.to_s
    isbn.length == 10 && isbn == ISBN10.complete(isbn[0,9])
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

  def to_ean
    return nil unless self.valid?
    EAN13.complete("978#{@number[0,9]}")
  end

end
