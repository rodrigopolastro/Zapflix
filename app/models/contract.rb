class Contract < ApplicationRecord
  belongs_to :movie
  belongs_to :artist
end
