class ApplicationController < ActionController::Base
  private
    def categories
      @categories = Category.all
    end
end
