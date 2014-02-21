class AlbumsController < ApplicationController

	def create
		@album = Album.new(album_params)
		@album.title = @album.title.split(" ").map(&:capitalize).join(" ")
		if @album.save
			redirect_to album_url(@album)
		else
			flash.now[:error] = @album.errors.full_messages
			render :new
		end
	end

	def destroy
		@band = current_band
		@album.destroy
		redirect_to band_albums_url(@band)
	end

	def edit
		get_album
		render :edit
	end

	def index
		@albums = Album.all
		render :index
	end

	def new
		@album = Album.new(:band_id => params[:band_id])
		render :new
	end

	def show
		get_album
		render :show
	end

	def update
		get_album
		if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
    	render :edit
    end
	end


	private
	def album_params
		params.require(:album).permit(:title, :image_url, :band_id, :year, :studio_album)
	end

	def get_album
		@album = Album.find(params[:id])
	end

	def current_band
		get_album.band
	end
end
