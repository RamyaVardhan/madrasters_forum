class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.text :name
        t.text :description
    	t.integer :type_id
    	t.integer :manager_id
    	t.integer :event_type
    	t.integer :count
    	t.text :venue
    	t.references :domain
    	t.references :location
    	t.integer :speaker_id
    	t.text :team
    	t.text :agenda
    	t.date :event_date
        t.timestamps
    end
  end
end
