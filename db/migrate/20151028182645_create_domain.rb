class CreateDomain < ActiveRecord::Migration
  def change
    create_table :domains do |t|
    	t.text :name
    	t.integer :lead_id
    	t.timestamps
    end
  end
end
