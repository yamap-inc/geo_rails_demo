# frozen_string_literal: true

class CreateMunicipalities < ActiveRecord::Migration[7.0]
  def change
    create_table :municipalities do |t|
      t.string :name, null: false
    end
  end
end
