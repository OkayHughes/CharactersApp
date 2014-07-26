module CharactersHelper
	def current_character
		Character.find(cookies.permanent[:character_id])
	end

	def set_current_character(id)
		cookies.delete(:character_id)
		cookies.permanent[:character_id] = id
	end
end
