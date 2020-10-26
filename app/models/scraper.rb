require 'nokogiri'
require 'open-uri'

# Scraper is responsible for mapping an XML document to a list of items, such as podcast episodes or movies,
# with desired attributes included

class Scraper

  def initialize(url, category)
    @url = url
    @category = category
  end

  def scrape
    xml = open(@url)
    doc = Nokogiri::XML(xml)
    scraped_items = []

    case @category
    when "NPR Podcast"
      scraped_items = map_doc_to_podcast_episodes(doc)
    else
      puts "Not currently handling this type of Feed"
    end

    return scraped_items
  end

  def map_doc_to_podcast_episodes(doc)
    channel_title = doc.xpath('//channel/title').text
    podcast_episodes = doc.xpath('//channel/item').map do |doc_item|
      podcast_episode = PodcastEpisode.new(channel_title, @category)
      podcast_episode.populate_details(doc_item)
      podcast_episode
    end

    return podcast_episodes
  end

end