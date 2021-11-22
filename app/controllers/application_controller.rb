class ApplicationController < ActionController::Base
  # helper_method :admin

  private
    def load_categories
      @categories = Category.all
    end
end
