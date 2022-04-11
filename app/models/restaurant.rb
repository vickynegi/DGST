class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true, allow_nil: false
end
