class Tag < ActiveRecord::Base
	belongs_to :character, touch: true
	#optional uniqueness within character uniqueness: {scope: :character},
	validates :key, presence: true
	validates :value, presence: true

end
