# frozen_string_literal: true

class River < ApplicationRecord

  def self.as_mvt_for(zoom:, x:, y:)
    all.unscoped.from(as_mvt_geom_for(zoom:, x:, y:), :mvtgeom).select('ST_AsMVT(mvtgeom.*) mvt').take.mvt
  end

  def self.for_map_tile(zoom:, x:, y:)
    where('line && ST_TileEnvelope(:zoom, :x, :y)', zoom:, x:, y:)
  end

  def self.as_mvt_geom_for(zoom:, x:, y:)
    sql = sanitize_sql_array(
      ['ST_AsMVTGeom(line, ST_TileEnvelope(:zoom, :x, :y)) AS geom',
       { zoom:, x:, y: }]
    )

    for_map_tile(zoom:, x:, y:).select(sql)
  end
end
