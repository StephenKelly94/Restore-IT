class UserFile < ApplicationRecord
  before_validation :set_path

  validates :name, presence: true
  validates :folder_path, presence: true

  belongs_to :folder

 private
   def set_path
     self.folder_path = folder.folder_path + "#{name}"
   end
end
