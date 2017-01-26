class Service < ApplicationRecord
  validates :name, presence: true

  has_many :folders
  belongs_to :user
end
