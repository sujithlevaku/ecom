class WishlistsController < ApplicationController

	before_action :authenticate_user! 



	def create 
		@wishlist = Wishlist.new(wishlist_params)
		@wishlist.user_id = current_user.id
		if @wishlist.save_or_update
			redirect_to wishlists_path, notice: "Successfully moved the product to the wishlist "
		else
			redirect_to wishlists_path, notice: "Item is already in the wishlist"
		end
	end

	def index 
		@wishlists = current_user.wishlists	

	end

	def destroy
		@wishlist = Wishlist.find(params[:id])
		@wishlist.destroy
		redirect_to wishlists_path,  notice: "Successfully removed item from wishlist"

	end




	private

	def wishlist_params
		params[:wishlist].permit(:product_id)


	end

end
