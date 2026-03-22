class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end