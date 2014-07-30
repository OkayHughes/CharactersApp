class TagsController < ApplicationController
	
	def new
		@tag = Tag.new
	end

	def create
		@tag = Tag.new(tag_params)
		respond_to do |format|
			if @tag.save
				flash[:notice] = "Tag added"
				format.js {}
			else
				flash[:notice] = "Tag couldn't be added"
				format.js {}
			end
		end
	end

	def edit
		@tag = Tag.find(params[:id])
		respond_to do |format|
			format.js {}
		end
	end

	def update
		@tag = Tag.find(params[:id])
		if @tag.update(tag_params)
			respond_to do |format|
				if @tag.save
					flash[:notice] = "Tag updated"
					format.js {}
				else
					flash[:notice] = "Tag couldn't be updated"
					format.js {}
				end
			end
		end
	end

	def show
		@tag = Tag.find(params[:id])
		respond_to do |format|
			format.json {render json: @tag}
		end
	end

	def destroy
		Tag.destroy(params[:id])
		flash[:notice] = "Tag sucessfully deleted"
		respond_to do |format|
			format.js {}
		end
	end

	private

	def tag_params
		params.require(:tag).permit(:key, :value, :character_id, :depth)
	end

end
