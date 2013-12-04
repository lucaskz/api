class Resources < ActiveRecord::Migration
  def up
    create_table :resources do |t|
      t.string :name
      t.text :description
    end
  end

  def down
  	drop_table :resources
  end
end
