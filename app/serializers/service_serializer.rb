class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :access_token, :used_space, :total_space, :root_folder, :user_id

  def root_folder
    object.folders.root
  end
end
