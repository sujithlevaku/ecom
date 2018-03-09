class Product < ApplicationRecord
	extend FriendlyId
	friendly_id :name, use: :slugged



	belongs_to :category
	has_many :reviews
	 has_many :cart_line_items
	has_many :wishlists

	validates_presence_of :name, :price, :description, :stock, :category_id
	validates_numericality_of :price, greater_than: 0
	validates_numericality_of :stock , greater_than_or_equal_to: 0
	validates_numericality_of :category_id
	validates_length_of :description, minimum: 5
	

	def self.search(search)
  # Title is for the above case, the OP incorrectly had 'name'
  where("name LIKE ?", "%#{search}%")
end



end
