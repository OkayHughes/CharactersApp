class Character < ActiveRecord::Base
	has_many :tags, dependent: :destroy
	validates :name, presence: true
	validates :health, presence: true
	validates :health_sigma, presence: true, if:  :is_unique?
	validates :strength, presence: true
	validates :strength_sigma, presence: true, if:  :is_unique?
	validates :dexterity, presence: true
	validates :dexterity_sigma, presence: true, if:  :is_unique?
	validates :constitution, presence: true
	validates :constitution_sigma, presence: true, if:  :is_unique?
	validates :intelligence, presence: true
	validates :intelligence_sigma, presence: true, if:  :is_unique?
	validates :wisdom, presence: true
	validates :wisdom_sigma, presence: true, if:  :is_unique?
	validates :charisma, presence: true
	validates :charisma_sigma, presence: true, if:  :is_unique?

	def is_unique?
		:unique == "true"
	end 
end
