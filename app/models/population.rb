class Population < ApplicationRecord
  has_one :country
  has_one :indicator
end
