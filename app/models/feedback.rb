class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :workshop

  validates_length_of :body, minimum: 10
end
