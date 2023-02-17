# Mapbox Vector Tiles with Ruby on Rails

This is the sample application for the [福岡Rubyist会議03](https://regional.rubykaigi.org/fukuoka03) Yamap sponsor session. The slides can be found [here](https://docs.google.com/presentation/d/e/2PACX-1vTdCnKBF-8b8Cjc-I6KD1WntvGlwMr5HqVy2BJNdolXHnIDKeN9KkuLAvqzhI1EadSMJhEtEhaZ4ne-/pub?start=false&loop=false&delayms=3000).

## Goal

![fukuoka_area_map](https://user-images.githubusercontent.com/10478179/219823416-0c7dc34f-ccff-447f-99e0-3169055d77fd.png)

We will create a map displaying Japan's municipalities.

# Steps to create a map

## PostGIS setup with active record adapter [:link:](https://github.com/yamap-inc/geo_rails_demo/commit/40224346e15dcc524c5d88b6a52b23d383faa823)

To store geographic data, you need Postgres with the [PostGIS](https://postgis.net/) extension enabled. PostGIS introduces new data types and functions to Postgres for storing and querying geographic information. Ruby on Rails does not support these data types out of the box. The [Rgeo](https://github.com/rgeo) library got you covered here.

## Municipalities with many areas [:link:](https://github.com/yamap-inc/geo_rails_demo/commit/3e40b1ca6a2f2ed4e1bf2f4f0d9b6d64a349adb5)

Data structure to save Japanese municipalities and the associated areas.

## Download, Convert, and import Japanese area information. [:link:](https://github.com/yamap-inc/geo_rails_demo/commit/456c5b69258339933b9ab366c1844320d2d99294)

National [Land Information Division](https://nlftp.mlit.go.jp/ksj/gml/datalist/KsjTmplt-N03-v2_3.html) of Japan offers areal information. This data is converted into PostGIS SQL and imported into the municipalities table.

The data format is called a [Shapefile](https://en.wikipedia.org/wiki/Shapefile). This standard data format is used to publish most geographic data.

## Query and convert municipality data to vector tile [:link:](https://github.com/yamap-inc/geo_rails_demo/commit/4efa05df052dc705ac9ee58627364441505ec0af)

Vector tiles can be created with a PostGIS query.

First, The geometry data needs to be limited for inclusion into the vector tiles. Only areas that intersect the tile boundary are considered. [Overlapping zones are clipped.](https://postgis.net/docs/ST_AsMVTGeom.html)

The scoped data is then converted to the [Mapbox Vector Tile](https://postgis.net/docs/ST_AsMVT.html) binary format.

## Map resources and JavaScript map client [:link:](https://github.com/yamap-inc/geo_rails_demo/commit/f481ac1e0fe68789420ffff8022f0213a20b8397)

To display a map of the Japanese municipalities, two resources are needed:

1. The vector tile endpoint to stream the binary vector tiles.
2. A [Mapbox Style](https://docs.mapbox.com/mapbox-gl-js/style-spec/) endpoint to tell the map client how to render the vector data.

The [JavaScript client](https://github.com/openlayers/ol-mapbox-style) can now render this map with the style URL without further design configuration.

# Development

## Setup

1.  Get the code.

        % git clone git@github.com:yamap-inc/geo_rails_demo.git

2. Start dockerized PostGIS

        % docker-compose up -d

3. Setup your environment.

        % bin/setup

4. Generate Japanese municipality data

        % bin/generate_data

5. Start Rails.

        % bin/rails server

6. Verify that the app is up and running.

        % open http://localhost:3000
