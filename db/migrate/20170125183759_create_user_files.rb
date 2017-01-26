class CreateUserFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_files do |t|
      t.string :name
      t.string :folder_path
      t.integer :service_file_id

      t.timestamps
    end
  end
end
