class Movie < ApplicationRecord
  validates :title, presence: true
  
  has_one :director
  has_one :movie_genre

  has_many :contracts
  has_many :artists, through: :contracts
end
