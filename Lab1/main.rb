require_relative 'parser'

START_PAGE = 8
END_PAGE   = 8

Parser.new(START_PAGE, END_PAGE)
      .parse
      .to_csv('items.csv')
