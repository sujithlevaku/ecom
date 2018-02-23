 	class ReviewsController < ApplicationController
	before_action :authenticate_user! , except: [:index,:show]
	load_and_authorize_resource

	def index
		@reviews = current_user.reviews
	end

	def show 
		@review = Review.find(params[:id])
	end	



	def create 
		@review = Review.new(review_params)		
		@review.user_id = current_user.id
		 @review.save
				
	end

	def edit
		@review = Review.find(params[:id])
	end
	def update
		@review = Review.find(params[:id])
		if @review.update_attributes (review_params)
			redirect_to review_path(@review.id)
		else
			render action: "edit"
		end
	end



	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		
	end


private 
def review_params
	params[:review].permit(:body,:product_id,:rating)
end

end


