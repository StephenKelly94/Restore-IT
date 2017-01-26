class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :access_token
      t.float :used_space
      t.float :total_space

      t.timestamps
    end
  end
end
