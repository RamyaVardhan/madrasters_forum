class CreateLocation < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    	t.text :name
    	t.integer :manager_id
    	t.timestamps
    end
  end
end
