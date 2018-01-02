class ProductsController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show]
    load_and_authorize_resource
	#url - http://localhost:3000/products
	#uri - /products
	#path- products_path
	#http methods - GET
	# roles & responsibility - to list all products 

	def index
		@products = Product.all
		@wishlist = Wishlist.new
	end

	#url - http://localhost:3000/products/new
	#uri - /products/new
	#path- new_products_path
	#http methods - GET
	# roles & responsibility - is to setup a form for adding a new product 
	
	def new
		@product = Product.new
		if params[:category_id] 
			@product[:category_id] = params[:category_id]
		end

	end

	#url - http://localhost:3000/products
	#uri - /products
	#path- products_path
	#http methods - post
	# roles & responsibility - take the data coming in from the form ,pass it to the constructor as an argument ,validates the object if the validations pass insert the record to the db and redirect the user to the a new page else display error message 
	

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to products_path
		else
			render action: "new"
		end
	end

	#url - http://localhost:3000/products/(id)
	#uri - /products/(id)
	#path- products_path(id)	
	#http methods - post
	# roles & responsibility -to find the product from the date dase and display it on the show page 
	def show
		
		@product = Product.find(params[:id])		
		@review = Review.new

	end

	#url - http://localhost:3000/products/:id/edit
	#uri - /products/:id/edit
	#path- edit_products_path(id)	
	#http methods - Get
	# roles & responsibility -to find the record the user is trying to edit , and display it on a form
	def edit
		    @product = Product.find(params[:id])

	end
	#url - http://localhost:3000/products/:id
	#uri - /products/:id
	#path- products_path(id)	
	#http methods - Patch
	# roles & responsibility -to find the record the user is just update in browser , and update its information by  taking the data comming in from a form , validates the object , if the validations pass update record to the db and redirect the user index page else display error message
	def update
		      @product = Product.find(params[:id])

		if @product.update_attributes (product_params)
			redirect_to products_path(@product.id)
		else
			render action: "edit"
		end
	end
	#url - http://localhost:3000/products/:id
	#uri - /products/:id
	#path- product_path(id)	
	#http methods - DELETE
	# roles & responsibility -to find the record the user is trying to delete, and destroy it from the db record
	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path
	end

	private
	



	def product_params
		params[:product].permit(:name,:description,:price,:stock,:category_id,:cod_eligible,:feature_image_url,:slug)
	end



end
