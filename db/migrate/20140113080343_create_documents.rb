class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.belongs_to :library

      t.timestamps
    end
    add_index :documents, :library_id
  end
end
