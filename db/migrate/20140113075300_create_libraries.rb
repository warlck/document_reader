class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.belongs_to :user

      t.timestamps
    end
    add_index :libraries, :user_id
  end
end
