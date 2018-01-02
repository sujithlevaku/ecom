class AddressesController < ApplicationController
		before_action :authenticate_user! 


		def index
			@addresses = Address.all
		end

		def new
			@address = Address.new
		end


		def create
			@address = Address.new(address_params)
			@address.user_id = current_user.id
			if @address.save
				redirect_to addresses_path
			else
				render action: "new"
			end
		end

		def edit

			@address = Address.find(params[:id])

		end

		def update
			@address = Address.find(params[:id])
			if @address.update_attributes(address_params)
				redirect_to addresses_path
			else
				render action: "edit"
			end
		end

		def destroy
			@address = Address.find(params[:id])
			@address.destroy
			redirect_to addresses_path



		end
	






	private


		def address_params

			params[:address].permit(:name,:pincode,:street,:landmark,:city,:user_id)
		end




end

