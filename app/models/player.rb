class Player < ApplicationRecord
  belongs_to :team
  validates :name, presence: true, uniqueness: true
  validates :age, presence: true
end
