class Artist < ApplicationRecord
  validates :name, presence: true

  has_many :contracts
  has_many :movies, through: :contracts
end
