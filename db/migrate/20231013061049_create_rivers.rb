class CreateRivers < ActiveRecord::Migration[7.0]
  def change
    create_table :rivers do |t|
      t.st_polygon :area, null: false, srid: 3857, index: { using: :gist }
    end
  end
end
