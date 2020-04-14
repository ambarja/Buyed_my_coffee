//  Código para descargar imágenes landsat --------------------------------

var escena = "LANDSAT/LC08/C01/T1_TOA";
var inicio = '2018-01-01';
var fin    = '2018-12-31';
var descrip = 'Landsat_2018'

var pol = ee.Geometry.Rectangle(-77.08,-11.87,-77.02,-11.83);
var image1 = ee.ImageCollection(escena)
            .filter(ee.Filter.eq('WRS_PATH', 07))
            .filter(ee.Filter.eq('WRS_ROW', 68))
            .filterDate(inicio,fin)
            .filterBounds(pol)
            .sort('CLOUD_COVER')
            .first()
            .clip(pol);

// Visualización de la img -------------------------------------------------

Map.addLayer(image1,{bands:['B5','B4','B3'], min:0.12,max:0.34},'image01');
print(image1);

// Exportar al drive la escena ---------------------------------------------

Export.image.toDrive({
    image: image1, 
    description: descrip,
    scale: 30,
    maxPixels: 1e13,
    region:pol
  });
