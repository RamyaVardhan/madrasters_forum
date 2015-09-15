class CreateAndPopulateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :user_id
      t.timestamps
    end
  	tag_names = %w(Calligraphy Caricature Digital\ Art Folk\ Art Pencil\ Sketching Jugadh Photography Painting Printing Typography UI UX Others)
  	tag_names.each{|i| Tag.create(:name => i)}
  end
end
