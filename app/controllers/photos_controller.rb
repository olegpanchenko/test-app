class PhotosController < ApplicationController
  before_filter :find_photo, only: [:destroy]
  respond_to :html, :json

  def index
    @photos = current_user.photos
    respond_with @photos
  end

  def create
    @photo = current_user.photos.new( photo_params )
    @photo.save
    @photos = [@photo]
    render :index
  end

  def destroy
    @photo.destroy
    @photos = current_user.photos
    render :index
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :file)
  end

  def find_photo
    @photo = Photo.find params[:id]
  end
end