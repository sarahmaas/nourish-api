class Recipe < ApplicationRecord
  # associations
  belongs_to :user

  # validates values exist
  validates_presence_of :title, :source, :servings, :description
end
