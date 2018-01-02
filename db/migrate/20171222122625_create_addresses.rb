class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
    	t.string :name
    	t.integer :pincode
    	t.string :street
    	t.string :landmark	
    	t.string :city
    	t.integer :user_id
      t.timestamps
    end
  end
end
