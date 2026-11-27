class Movie < ApplicationRecord
  has_many :shouts, dependent: :destroy
  has_many :notes, dependent: :destroy
end
