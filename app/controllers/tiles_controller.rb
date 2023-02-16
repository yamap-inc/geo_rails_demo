# frozen_string_literal: true

class TilesController < ApplicationController
  def show
    zoom, x, y = params.values_at(:zoom, :x, :y).map(&:to_i)

    respond_to do |format|
      format.mvt do
        send_data(Municipality.as_mvt_for(zoom:, x:, y:))
      end
    end
  end
end
