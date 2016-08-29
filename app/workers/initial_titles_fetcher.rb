require 'open-uri'

class InitialTitlesFetcher
  include Sidekiq::Worker

  def perform
    url = 'http://www.animenewsnetwork.com/encyclopedia/reports.xml?id=155&nlist=all'
    xml = Nokogiri::XML(open(url))
    items = xml.css("item")

    items.each do |item|
      Title.find_or_create_by!(external_id: item.css('id').text) do |title|
        title.name = item.css('name').text
        title_type_name = item.css('type').text
        title_type = TitleType.find_or_create_by!(name: title_type_name)
        title.title_type = title_type
      end
    end
  end
end
