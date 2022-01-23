class Category < ApplicationRecord
  has_many :contributions
  has_many :challenges
end
