class Place < ApplicationRecord
    validates :name, :description, :latitude, :longitude, :city, :country, presence: true
end
  