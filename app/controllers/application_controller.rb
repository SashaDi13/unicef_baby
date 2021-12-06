class ApplicationController < ActionController::Base

  private
    def load_categories
      @categories = Category.all
    end
end
