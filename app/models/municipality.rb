# frozen_string_literal: true

class Municipality < ApplicationRecord
  has_many :municipality_areas, dependent: :destroy

  def self.as_mvt_for(zoom:, x:, y:)
    relation = joins(:municipality_areas)
               .merge(MunicipalityArea.as_mvt_geom_for(zoom:, x:, y:))
               .select(:id, :name)

    all.unscoped.from(relation, :mvtgeom).select('ST_AsMVT(mvtgeom.*) mvt').take.mvt
  end
end
