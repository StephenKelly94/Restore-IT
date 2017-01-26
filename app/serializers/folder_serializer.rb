class FolderSerializer < ActiveModel::Serializer
  attributes :id, :name, :folder_path, :dirty_flag, :service_folder_id, :parent_id, :service_id, :user_id

  has_many :user_files
  has_many :children

  def user_id
    instance_options[:user_id].to_i
  end
end
