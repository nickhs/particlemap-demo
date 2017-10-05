/* global self */

self.addEventListener('message', function(e) {
    importScripts('particlemap/build/particlemap.min.js');
    var worldMap = new ParticleMap(e.data.geojson, e.data.params);
    var parsed = worldMap.parse(worldMap.geojson);
    worldMap.determineOffsets(parsed);
    worldMap.makeGrid();
    worldMap.determineGrid();
    self.postMessage(worldMap);
}, false);
