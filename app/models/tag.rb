class Tag < ActiveRecord::Base
	belongs_to :character
	validates :key, uniqueness: {scope: :character}, presence: true
	validates :value, presence: true
	
end
