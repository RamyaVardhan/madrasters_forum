class AddHelplineNumberToLocationAndEventTable < ActiveRecord::Migration
  def change
  	add_column :locations, :helpline_number , :string
  	add_column :events, :helpline_number , :string
  end
end
