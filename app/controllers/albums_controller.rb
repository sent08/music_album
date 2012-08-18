class AlbumsController < ApplicationController
  before_filter :require_user

  def index
    @albums = if params[:search].present?
      current_user.albums.find(:all, :conditions => ["title like ?", "#{params[:search]}%"])
    else
      current_user.albums
    end
  end

  def new
    @album = Album.new
  end

  def create
    @album = current_user.albums.new(params[:album])
    if @album.save
      redirect_to home_path
    else
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
    flash[:notice] = "Music deleted successfully"
    redirect_to home_path
  end
end
