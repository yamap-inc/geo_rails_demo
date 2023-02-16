# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'ol-mapbox-style', to: 'https://ga.jspm.io/npm:ol-mapbox-style@9.5.0/dist/index.js'
pin 'ieee754', to: 'https://ga.jspm.io/npm:ieee754@1.2.1/index.js'
pin 'ol/', to: 'https://ga.jspm.io/npm:ol@7.2.2/'
pin 'pbf', to: 'https://ga.jspm.io/npm:pbf@3.2.1/index.js'
pin 'rbush', to: 'https://ga.jspm.io/npm:rbush@3.0.1/rbush.min.js'
