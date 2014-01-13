class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.belongs_to :library
      t.integer :parent_id
      t.string :name

      t.timestamps
    end
    add_index :folders, :library_id
  end
end
