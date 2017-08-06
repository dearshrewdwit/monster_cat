class Workshop < ApplicationRecord
  has_many :feedbacks, dependent: :destroy

  validates_length_of :name, minimum: 5
  validates_length_of :description, minimum: 5
  validates_presence_of :url
end
