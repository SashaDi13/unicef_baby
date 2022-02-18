module Searchable

  # extend ActiveSupport::Concern

  class MySearch
    def initialize(query)
      @search = query
    end

    def search_property
      Elasticsearch::Model.search({
          size: 45,
          query: {
            bool: {
              must: {
                multi_match: {
                  query: @search,
                  fields: ["title", "description"]
                }
              },

              should: {
                match: {
                  title: {
                    query: @search,
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
        }, [Article, Document]).records.to_a
    end
  end
end
