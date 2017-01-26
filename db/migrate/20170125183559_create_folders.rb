class CreateFolders < ActiveRecord::Migration[5.0]
  def change
    create_table :folders do |t|
      t.string :name
      t.string :folder_path
      t.string :dirty_flag
      t.integer :service_folder_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
