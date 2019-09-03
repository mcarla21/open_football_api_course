# frozen_string_literal: true

class CreateManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.belongs_to :team
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :description
    end
  end
end
