class Note < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :title, presence: true
  validates :body, presence: true
end
