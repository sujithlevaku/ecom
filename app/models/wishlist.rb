class Wishlist < ApplicationRecord
	belongs_to :user
	belongs_to :product
	validates_presence_of :product_id,:user_id




def save_or_update
		line_item = Wishlist.find_by(user_id: self.user_id ,product_id: self.product_id )
		if line_item.nil?
		 self.save
		end
	end



end
