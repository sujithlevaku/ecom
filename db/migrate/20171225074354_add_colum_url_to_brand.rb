class AddColumUrlToBrand < ActiveRecord::Migration[5.1]
  def change
  	add_column :brands, :url, :string
  end
end
