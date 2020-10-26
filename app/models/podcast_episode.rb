# PodcastEpisode is responsible for iterating through scraped podcast data and
# pulling the desired information to create individual podcast episodes.

class PodcastEpisode

  def initialize(podcast_title, category)
    @podcast_title = podcast_title
    @category = category
    @title = ""
    @description = ""
    @pub_date =  ""
    @media_url = ""
  end

  def populate_details(episode_attributes)
    episode_attributes.children.each do |attr|
      attr_key = attr.name

      if attr_key === 'title'
        @title = "#{@podcast_title} - #{attr.children[0].text}"
      elsif attr_key === 'description'
        @description = attr.children[0].text
      elsif attr_key === 'pubDate'
        @pub_date = attr.children[0].text
      elsif attr_key === 'content' && attr.attributes["type"].value === 'audio/mpeg'
        @media_url = attr.attributes["url"].value
      end
    end
  end

  def to_item
    {
      category: @category,
      title: @title,
      description: @description,
      pub_date: @pub_date,
      media_url: @media_url,
    }
  end

end