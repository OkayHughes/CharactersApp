class Character < ActiveRecord::Base
	has_many :tags
	validates :bio, presence: true
	validates :name, presence: true
end
