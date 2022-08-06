class MovieGenre < ApplicationRecord
  validates :name, presence: true
end
