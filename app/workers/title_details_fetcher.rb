require 'open-uri'

class TitleDetailsFetcher
  include Sidekiq::Worker

  def perform(query_limit)
    titles_to_update = Title.where(last_sync: nil).order("RANDOM()").limit(query_limit)
    titles_to_update.each do |title|
      url = "http://cdn.animenewsnetwork.com/encyclopedia/api.xml?title=#{title.external_id}"
      xml = Nokogiri::XML(open(url))

      summary = xml.css('info[type="Plot Summary"]').text
      image = xml.css('img').last
      image_src = image.attributes['src'].value if image.present?

      title.update_attributes(summary: summary, image: image_src, last_sync: Time.zone.now)
    end

    TitleDetailsFetcher.perform_async(query_limit) if titles_to_update.size > 0
  end
end
