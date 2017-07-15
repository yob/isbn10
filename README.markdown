A small class for generating and validating 10's, the 10 digit codes that are found
on many book-ish products sold before 2005.

Yes there are man other ISBN gems out there. I wanted one that has a similar API to
my other identifier related gems (ean13, abn, san, upc, etc) to reduce the
number of APIs I have to remember.

# Installation

    gem install isbn10

# Usage

    ISBN10.new("0140449043").valid?
    => true

    ISBN10.valid?("0140449043")
    => true

    ISBN10.valid?("0140449042")
    => false

    ISBN10.complete("014044904")
    => "0140449043"

    ISBN10.new("0140449043").to_ean
    => "9780140449044"

# Further Reading

- http://en.wikipedia.org/wiki/International_Standard_Book_Number

# Contributing

Source code is publicly available @ http://github.com/yob/isbn10. Patches
welcome, preferably via a git repo I can pull from.
