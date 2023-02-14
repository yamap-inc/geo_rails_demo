# frozen_string_literal: true

class CreateMunicipalityAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :municipality_areas do |t|
      t.references :municipality, null: false, foreign_key: true
      t.st_polygon :area, null: false, srid: 3857, index: { using: :gist }
    end
  end
end
