class AddServiceIdToFolder < ActiveRecord::Migration[5.0]
  def change
    add_column :folders, :service_id, :integer
  end
end
