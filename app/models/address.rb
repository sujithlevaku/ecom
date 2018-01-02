class Address < ApplicationRecord
	has_many :orders
	belongs_to :user
	validates_presence_of :name,:pincode,:street,:landmark,:city,:user_id
end
