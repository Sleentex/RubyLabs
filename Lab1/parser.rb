require 'csv'
require 'mechanize'

require_relative 'car'

class Parser
  BASE_URL = "https://autopark.ua/buy?page=%d&options=1&currency=usd&"

  attr_accessor :max_pages, :start_page, :items

  def initialize(start_page, max_pages)
    @max_pages  = max_pages
    @start_page = start_page
    @agent      = Mechanize.new
    @items      = []
  end

  def parse_item(item)
    img_wrap = item.at('div.auto-card__img-wrap')

    id = img_wrap.at('img')['data-ad-id']
    img_url = img_wrap.at('a > img.auto-card__img')['src']


    content_wrap = item.at('div.auto-card__content-wrap')
    price = content_wrap.at('p.auto-card__sum').text


    title_wrap = content_wrap.at('div.auto-card__title')
    name = title_wrap.at('span.auto-card__name').text
    year = title_wrap.at('span.auto-card__year').text


    list_wrap = content_wrap.search('ul.auto-card__list-char > li > p:last-child').map { |item| item.text rescue error puts error }
    distance= list_wrap[0]
    fuel    = list_wrap[1]
    volume  = list_wrap[2]
    gearbox = list_wrap[3]

    Car.new(id, name, year, price, distance, fuel, volume, gearbox, img_url)
  end

  def parse_curr_page
    @items += @curr_page.search('li.auto-card__item--buy.animated').map { |item| parse_item(item) rescue error puts error }
    self
  end

  def next_page
    next_page_link = @curr_page.at("div#pagination > ul > li:last-child > a")
    @curr_page     = @agent.click(next_page_link)
  end

  def parse
    @curr_page     = @agent.get(BASE_URL % @start_page)
    @items         = []
    pages_to_parse = @max_pages - @start_page + 1
    pages_to_parse.times do |curr_page_number|
      puts "Parsing page #{curr_page_number + @start_page}"
      parse_curr_page()
      puts @curr_page.uri.to_s
      next_page()
    end
    @items.compact!
    self
  end


  def to_csv(file_path)
    csv_result = CSV.generate do |csv|
      csv << @items.first.instance_variables.map {|variable_name| variable_name[1..-1]}
      @items.each { |item| csv << item.values }
    end
    File.write(file_path, csv_result)
    self
  end

end


# def next_page(parsing_page)
#   a = "div#pagination > ul > li:last-child(#{parsing_page + 2}) > a"
#   next_page_link = @curr_page.at(a)['href']
#   puts a
#   puts next_page_link
#   #@curr_page     = @agent.click(next_page_link)
# end


# def parse
#   @items         = []
#   #parse_curr_page()
#   pages_to_parse = @max_pages - @start_page + 1
#
#   pages_to_parse.times do |curr_page_number|
#     parsing_page = curr_page_number + @start_page
#     @curr_page = @agent.get(BASE_URL % parsing_page)
#
#     puts "Parsing page #{parsing_page}"
#     parse_curr_page()
#     #next_page(parsing_page)
#     puts @curr_page.uri.to_s
#   end
#   @items.compact!
#   self
# end


# mechanize = Mechanize.new
# page = mechanize.get('https://autopark.ua/buy?options=1&currency=usd')
#
# items = []

# items = page.search('li.auto-card__item--buy.animated').map { |item| parse_item(item) rescue error puts error }
#
# puts items

