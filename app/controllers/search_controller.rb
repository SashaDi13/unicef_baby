class SearchController < ApplicationController
  include Searchable

  def search
    @results = MySearch.new(params[:query]).search_property.group_by {|result| result.class}
  end
end
