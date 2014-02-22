class NotesController < ApplicationController

	def create
		@note = Note.new(note_params)
		@note.track_id = params[:track_id]
		@note.user_id = current_user.id
		if @note.save
			redirect_to track_url(@note.track)
		else
			flash.now[:error] = @note.errors.full_messages
			render :new
		end
	end

	def destroy
		@track = current_track
		@note.destroy
		redirect_to track_url(@track)
	end

	def edit
		get_note
		render :edit
	end

	# def index
	# 	@notes = Note.all
	# 	render :index
	# end

	def new
		@note = Note.new(:track_id => params[:track_id], :user_id => params[:user_id])
		render :new
	end

	def show
		@track = current_track
		get_note
		render :show
	end

	def update
		get_note
		if @note.update_attributes(note_params)
			redirect_to note_url(@note)
    else
    	render :edit
    end
	end


	private
	def note_params
		params.require(:note).permit(:description, :user_id, :track_id)
	end

	def get_note
		@note = Note.find(params[:id])
	end

	def current_track
		get_note.track
	end

end
