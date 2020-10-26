class HomeController < ApplicationController

  def index
  end

  def fetch_feed
    feed_url = params[:q]
    category = "NPR Podcast" # Only allowing NPR podcasts for proof of concept
    feed_scraper = Scraper.new(feed_url, category)
    scraped_elements = feed_scraper.scrape
    scraped_elements.each do |element|
      Item.create(element.to_item)
    end
    redirect_to items_path
  end

  def matches
    # FUTURE: Users can create "partnership" with any other user and see matches for those specific partners
    user_one = User.find_by(email: "user1@example.com")
    user_two = User.find_by(email: "user2@example.com")
    matchmaker = Matchmaker.new(user_one, user_two)
    @matches = matchmaker.find_matches
  end

end
