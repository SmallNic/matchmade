require 'nokogiri'
require 'open-uri'

class Scraper

  def initialize(url)
    @url = url
  end

  def scrape
    xml = open(@url)
    doc = Nokogiri::XML(xml)

    item_name_prefix = doc.xpath('//channel/title').text

    item_list = doc.xpath('//channel/item').map do |i|
      item = { category: 'Podcast' } # Only allowing NPR podcasts for proof of concept
      i.children.each do |child|
        if child.name === 'title'
          item[:title] = item_name_prefix + ' - ' + child.children[0].text
        elsif child.name === 'description'
          item[:description] = child.children[0].text
        elsif child.name === 'pubDate'
          item[:pub_date] = child.children[0].text
        elsif child.name === 'content' && child.attributes["type"].value === 'audio/mpeg'
          item[:media_url] = child.attributes["url"].value
        end
      end
      item
    end

    return item_list
  end

end