# frozen_string_literal: true

json.version 8

json.center [130.399994, 33.583332] # Fukuoka

json.zoom 12

json.sources do
  json.map do
    json.type 'vector'
    json.tiles [tile_url('{z}', '{x}', '{y}', format: :mvt)]
  end
end

json.layers do
  json.child! do
    json.id 'municipality-label'
    json.type 'symbol'
    json.source 'map'
    json.set! 'source-layer', 'default'
    json.layout do
      json.set! 'text-field', %w[get name]
      json.set! 'symbol-placement', 'line-center'
    end
  end

  json.child! do
    json.id 'municipality-outline'
    json.type 'line'
    json.source 'map'
    json.set! 'source-layer', 'default'
    json.paint do
      json.set! 'line-color', '#3EA5F5'
      json.set! 'line-width', 3
    end
  end
end
