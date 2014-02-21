class BandsController < ApplicationController

	def create
		@band = Band.new(band_params)
		#@band.user_id = current_user.id
		if @band.save
			redirect_to band_url(@band)
		else
			flash.now[:error] = @band.errors.full_messages
			render :new
		end
	end

	def edit
		get_band
		render :edit
	end

	def index
		@bands = Band.all
		render :index
	end

	def new
		@band = Band.new
		render :new
	end

	def show
		@band = Band.find(params[:id])
		render :show
	end

	def update
		get_band
		if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    end
	end


	private
	def band_params
		params.require(:band).permit(:name, :image_url)
	end

	def get_band
		@band = Band.find(params[:id])
	end
end
