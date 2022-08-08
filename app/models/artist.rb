class Artist < ApplicationRecord
  validates :name, presence: true

  has_many :contracts, dependent: :destroy 
  has_many :movies, through: :contracts
end
