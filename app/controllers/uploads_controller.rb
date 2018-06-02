class UploadsController < ApplicationController
  before_action :set_user
  
  def show
    @upload = current_user.uploads.find(params[:id])
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    @upload.user_id = current_user.id
    if @upload.save
      redirect_to upload_path(@upload)
    else
      render :new
    end
  end

  private
    def upload_params
      params.require(:upload).permit(:movie)
    end

    def set_user
      @user = current_user
    end
end
