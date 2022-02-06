class DocumentsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @documents = collection.order(created_at: :desc)
  end

  def  new
    @document = collection.new
  end

  def create
    @document = collection.build(document_params)
    @document.file_preview = @document.preview
    if @document.save
      flash[:notice] = 'document create succesfully!'
      redirect_to documents_path
    else
      flash.now[:warning] = 'Wrong input data. document wasn`t created'
      render :new
    end
  end

  private

    def document_params
      params.require(:document).permit(:title, :description, :file, :file_preview)
    end

    def collection
      Document.all
    end

    def resource
      collection.find(params[:id])
    end
end
