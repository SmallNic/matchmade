class HomeController < ApplicationController

  def index
  end

  def fetch_feed
    feed_url = params[:q]
    feed_scraper = Scraper.new(feed_url)
    scraped_items = feed_scraper.scrape
    binding.pry
    scraped_items.each do |item|
      if Item.find_by(title: item[:title]).nil?
        Item.create(item)
      end
    end
    flash.notice = "Feed has been loaded."
  end

end
