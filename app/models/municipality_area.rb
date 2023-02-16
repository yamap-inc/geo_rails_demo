# frozen_string_literal: true

class MunicipalityArea < ApplicationRecord
  belongs_to :municipality

  def self.for_map_tile(zoom:, x:, y:)
    where('area && ST_TileEnvelope(:zoom, :x, :y)', zoom:, x:, y:)
  end

  def self.as_mvt_geom_for(zoom:, x:, y:)
    sql = sanitize_sql_array([
            "ST_AsMVTGeom(area, ST_TileEnvelope(:zoom, :x, :y)) AS geom",
            zoom:, x:, y:,
          ])

    for_map_tile(zoom:, x:, y:).select(sql)
  end
end
