class SearchController < ApplicationController

  def search
    unless params[:query].blank?
      @results = Elasticsearch::Model.search({
          size: 45,
          query: {
            bool: {
              must: {
                multi_match: {
                  query: params[:query],
                  fields: ["title", "description"]
                }
              },

              should: {
                match: {
                  title: {
                    query: params[:query],
                    boost: 2
                  }
                }
              }
            }
          },
          highlight: {
            pre_tags: ["<strong>"],
            post_tags: ["</strong>"],
            fields: {
              description: {}
            }
          }
        }, [Article, Document]).records.to_a.group_by {|result| result.class}
    else
      @results = []
    end
  end
end
