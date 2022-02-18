module Searchable

  class MySearch
    def initialize(query)
      @query = query
    end

    def search_property
      Elasticsearch::Model.search({
          size: 45,
          query: {
            bool: {
              must: {
                multi_match: {
                  query: @query,
                  fields: ["title", "description"]
                }
              },

              should: {
                match: {
                  title: {
                    query: @query,
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
