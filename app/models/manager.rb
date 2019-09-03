# frozen_string_literal: true

class Manager < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :age
  belongs_to :team

  def name
    "#{first_name} #{last_name}"
  end
end
