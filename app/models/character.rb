class Character < ActiveRecord::Base
	has_many :tags, dependent: :destroy
	validates :bio, presence: true
	validates :name, presence: true
end
