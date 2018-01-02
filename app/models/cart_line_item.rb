class CartLineItem < ApplicationRecord
	belongs_to :product
	belongs_to :user

	validates_presence_of :product_id,:user_id,:quantity

	#before_save :empty_wishlist
	after_save :empty_wishlist

	def save_or_update
		line_item = CartLineItem.find_by(user_id: self.user_id ,product_id: self.product_id )
		if line_item.nil?
		 self.save
		else
			line_item.update_attributes(quantity: line_item.quantity + self.quantity)

		end

	end

	def empty_wishlist


		user = self.user
		user.wishlists.each do |wishlist|
			if wishlist.product == self.product
				wishlist.delete
			end

		end
		#Wishlist.delete(self.product.wishlists.pluck(:id))

	end


end













	# def save_or_update(data)
	# 	line_item = CartLineItem.find_by(user_id: data[:user],product_id: data[:product])
	# 	if line_item.nil?
	# 	 self.save
	# 	else
	# 		line_item.update_attributes(quantity: line_item.quantity + self.quantity)

	# 	end

	# end






