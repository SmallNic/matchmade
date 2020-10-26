class HomeController < ApplicationController

  def index
  end

  def fetch_feed
    feed_url = params[:q]
    feed_scraper = Scraper.new(feed_url)
    scraped_items = feed_scraper.scrape
    scraped_items.each do |item|
      if Item.find_by(title: item[:title]).nil?
        Item.create(item)
      end
    end
    redirect_to items_path
  end

  def matches
    matchmaker = Matchmaker.new
    @matches = matchmaker.find_matches
  end

end
