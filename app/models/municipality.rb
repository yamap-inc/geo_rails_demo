# frozen_string_literal: true

class Municipality < ApplicationRecord
  has_many :municipality_areas, dependent: :destroy
end
