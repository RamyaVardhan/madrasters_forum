class AddRolesFixtures < ActiveRecord::Migration
  def change
  	["Super Admin","Location Manager","Domain Manager","Event Manager"].each do |role_name|
  		role_obj = Role.new()
  		role_obj.name = role_name
  		role_obj.save!
  	end
  end
end
