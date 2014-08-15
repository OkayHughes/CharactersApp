class Tag < ActiveRecord::Base
	belongs_to :character, touch: true
	#optional uniqueness within character uniqueness: {scope: :character},
	validates :key, presence: true
	validates :value, presence: true
	validate :no_key_value_pair_duplicates

	def no_key_value_pair_duplicates()
		t = Character.find(character_id).tags
		if t.where(key: key, value: value).length != 0
			errors.add(:value, "key pairs cannot be duplicates")
		end
	end
end
