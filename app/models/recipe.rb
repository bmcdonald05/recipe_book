class Recipe < ActiveRecord::Base
	belongs_to :user
	
	mount_uploader :picture, PictureUploader
	def minutes_total
		if (minutes_to_prepare)
			minutes_to_prepare + minutes_to_cook
		else
			minutes_to_cook
		end
	end
	validates :name, presence: true, length: { minimum: 2} #validations are key
	validates :category, presence: true, length: { minimum: 3}
	validates :instructions, presence: true, length: { maximum: 1500}
	validates :minutes_to_prepare, presence: true, numericality: {greater_than: 0}
	validates :minutes_to_cook, presence: true, numericality: {greater_than: 0, less_than: 500}
end
