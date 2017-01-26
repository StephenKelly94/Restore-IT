class UserFileSerializer < ActiveModel::Serializer
  attributes :id, :name, :folder_path, :service_file_id, :user_id

  belongs_to :folder

  def user_id
    instance_options[:user_id].to_i
  end
end
