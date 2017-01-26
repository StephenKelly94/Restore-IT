class Folder < ApplicationRecord
  before_validation :set_path

  validates :name, presence: true
  validates :folder_path, presence: true

  belongs_to :parent, class_name: "Folder", required: false
  belongs_to :service
  has_many :children, class_name: "Folder",
                      foreign_key: "parent_id",
                      before_add: :set_service_id,
                      dependent: :destroy
  has_many :user_files

  def has_parent?
    parent.present?
  end

  def has_children?
    children.exists?
  end

  def siblings
    parent.children.where.not(id: id)
  end

  def ancestors(ancestors = [])
    ancestors << self
    if has_parent?
      parent.ancestors(ancestors)
    else
      return ancestors
    end
  end

  def has_ancestor?(ancestor)
    if self == ancestor
      return true
    else
      if has_parent?
        parent.has_ancestor?(ancestor)
      else
        return false
      end
    end
  end

  def root
    if has_parent?
      parent.root
    else
      return self
    end
  end

  def is_root?
    return parent_id.nil?
  end

  def is_only_child?
    parent.children.where.not(id: id).nil?
  end

  def self.root
    self.where(parent_id: nil)
  end

 private
  def set_path
    if has_parent?
      self.folder_path = parent.folder_path + "#{name}/"
    else
      self.folder_path = "/"
    end
  end

  def set_service_id(folder)
    unless folder.service
      folder.service = folder.parent.service
    end
  end

end
