class TracksController < ApplicationController

	def create
		@track = Track.new(track_params)
		@track.title = @track.title.split(" ").map(&:capitalize).join(" ")
		if @track.save
			redirect_to track_url(@track)
		else
			flash.now[:error] = @track.errors.full_messages
			render :new
		end
	end

	def destroy
		@album = current_album
		@track.destroy
		redirect_to album_url(@album)
	end

	def edit
		get_track
		render :edit
	end

	# def index
	# 	@tracks = Track.all
	# 	render :index
	# end

	def new
		@track = Track.new(:album_id => params[:album_id])
		render :new
	end

	def show
		@album = current_album
		get_track
		render :show
	end

	def update
		get_track
		if @track.update_attributes(track_params)
			redirect_to track_url(@track)
    else
    	render :edit
    end
	end


	private
	def track_params
		params.require(:track).permit(:title, :track_number, :album_id, :bonus_track, :lyrics)
	end

	def get_track
		@track = Track.find(params[:id])
	end

	def current_album
		get_track.album
	end

end
