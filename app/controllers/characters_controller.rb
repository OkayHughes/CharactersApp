class CharactersController < ApplicationController
	include CharactersHelper
	def index
		@characters = Character.all
		edit = nil
		current_user_cookie = cookies[:character_id].to_i
		if Character.ids.include?(current_user_cookie)
			@character = Character.find(cookies[:character_id])
		elsif @characters.first
			@character= @characters.first
			cookies.permanent[:character_id] = @characters.first.id
		end
		respond_to do |format|
			format.html{}
			format.json{
				if params[:from]
					@characters = Character.where(updated_at: params[:from].to_datetime..DateTime.now)
					@characters = Character.where(updated_at: params[:from].to_datetime..params[:to].to_datetime) if params[:to]
					render json: @characters.to_json(include: {tags: {only: [:key, :value]}})
				else
					render json: @characters.to_json(include: {tags: {only: [:key, :value]}})
				end
				}
		end
	end

	def character_range
		@characters = Character.where(updated_at: params[:from_date]..params[:to_date])
		respond_to do |format|
			format.json{render json: @characters.to_json(include: {tags: {only: [:key, :value]}})}
		end
	end

	def set_edit
		@character = Character.find(params[:id])
		respond_to do |format|	
			format.js{}
		end
	end

	def set_view
		@character = Character.find(params[:id])
		respond_to do |format|	
			format.js{}
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
			set_current_character(@character.id)
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
		set_current_character(@character.id)
		respond_to do |format|
			format.js{}
			format.json {render json: @character.to_json(include: { :tags => { :only => [:key, :value]}})}
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
