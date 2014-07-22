class CharactersController < ApplicationController

	def index
		@characters = Character.all
		if cookies[:character_id]
			@character = Character.find(cookies[:character_id])
		else
			@character= @characters.first
			cookies.permanent[:character_id] = @characters.first.id
		end
	end

	def new
		@character = Character.new
		respond_to do |format|
			format.js{}
		end

	end

	def create
		@character = Character.new(character_params)
		if @character.save
			flash[:notice] = "Character added"
			respond_to do |format|
				format.js{}
				format.html {redirect_to root_url}
			end
		else
			flash[:notice] = "Character could not be added"
			respond_to do |format|
				format.js{}
				format.html {redirect_to root_url}
			end
		end
	end

	def show
		@character = Character.find(params[:id])
		cookies.permanent[:character_id] = @character.id
		respond_to do |format|
			format.js{}
			format.json {render json: @character}
		end
	end

	def edit
		@character = Character.find(params[:id])
	end

	def update
		@character = Character.find(params[:id])
		if @character.update(character_params)
			flash[:notice] = "Character updated"
			respond_to do |format|
				format.js{}
				format.html {redirect_to request.referer}
			end
		else
			flash[:notice] = "Character could not be updated"
			respond_to do |format|
				format.js{}
				format.html {redirect_to request.referer}
			end
		end
	end

	def destroy
		Character.destroy(params[:id])
		respond_to do |format|
			format.js{}
			format.html{redirect_to request.referer}
		end
	end

	private

	def character_params
		params.require(:character).permit(:bio, :name)
	end

end
