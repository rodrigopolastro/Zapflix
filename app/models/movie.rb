class Movie < ApplicationRecord
  # Not necessary to validate movie_genre_id and director_id
  # because they're foreign keys and assigned through check-boxes
  validates :title,        presence: true
  validates :cover_url,    presence: true
  validates :published_at, presence: true
  validates :artist_ids,   presence: true
  
  has_one :director
  has_one :movie_genre

  has_many :contracts
  has_many :artists, through: :contracts

end
