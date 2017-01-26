class AddFolderIdToUserFile < ActiveRecord::Migration[5.0]
  def change
    add_column :user_files, :folder_id, :integer
  end
end
