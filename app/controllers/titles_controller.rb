class TitlesController < ApplicationController
  def index
    @titles = Title.where.not(last_sync: nil).order("RANDOM()").limit(20).decorate
  end
end
