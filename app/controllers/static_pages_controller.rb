class StaticPagesController < ApplicationController
  before_action :load_categories, only: [:main]

  def main
  end

  def about
  end

  def contact
  end
end
