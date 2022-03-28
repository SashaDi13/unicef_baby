class UsersController < ApplicationController
  include Importable

  def index
    @users = collection
  end

  def import
    begin
      file = params[:import][:file] if !params[:import][:file].nil?
      ImportExel.new(file).import
    rescue NoMethodError => e
      flash[:notice] = "Can't find file. Please choose file"
    rescue TypeError => e
      flash[:notice] = "Wrong file type. Please choose exel file"
    end
    redirect_to users_path
  end

  private
    def collection
      User.all
    end
end
