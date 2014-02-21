class BandsController < ApplicationController

	def create
		@band = Band.new(band_params)
		@band.name = @band.name.split(" ").map(&:capitalize).join(" ")
		if @band.save
			redirect_to band_url(@band)
		else
			flash.now[:error] = @band.errors.full_messages
			render :new
		end
	end

	def destroy
		get_band
		if @band
			@band.destroy
			flash.now[:error] = @band.errors.full_messages
		end
		redirect_to bands_url
	end

	def edit
		get_band
		render :edit
	end

	def index
		@bands = Band.all.order("name")
		render :index
	end

	def new
		@band = Band.new
		render :new
	end

	def show
		get_band
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
