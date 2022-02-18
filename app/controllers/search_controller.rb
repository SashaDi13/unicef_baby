class SearchController < ApplicationController
  include Searchable

  def search
    if params[:query].blank?
      @results = {}
    else
      @results = MySearch.new(params[:query]).search_property.group_by {|result| result.class}
    end
  end
end
