class CreateRivers < ActiveRecord::Migration[7.0]
  def change
    create_table :rivers do |t|
      t.line_string :line, null: false, srid: 3857, index: { using: :gist }
    end
  end
end
