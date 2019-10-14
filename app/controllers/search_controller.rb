class SearchController < ApplicationController
  def index
    @characters = SearchFacade.new(params[:house]).search_characters
  end
end
