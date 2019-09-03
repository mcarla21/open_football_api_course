# frozen_string_literal: true

class Team < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  before_create :add_abbreviation_from_name!

  has_one :manager, dependent: :destroy
  has_many :players, dependent: :destroy
  has_many_attached :logos

  accepts_nested_attributes_for :players
  accepts_nested_attributes_for :manager

  def add_abbreviation_from_name!
    return if abbreviation

    abbreviation = name.upcase.split(' ')
    self.abbreviation = abbreviation.map(&:first).join('')
  end
end
