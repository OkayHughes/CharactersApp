class Character < ActiveRecord::Base
	has_many :tags, dependent: :destroy
	validates :name, presence: true
end
