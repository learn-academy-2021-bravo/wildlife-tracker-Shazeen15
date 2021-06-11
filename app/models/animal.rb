class Animal < ApplicationRecord
    has_many :sightings
    accepts_nested_attributes_for :sightings
end
