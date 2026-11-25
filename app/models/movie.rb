class Movie < ApplicationRecord
  has_many :shouts, dependent: :destroy
end
