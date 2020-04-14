//  Código para descargar imágenes landsat --------------------------------

// LANDSAT/LT05/C01/T1_TOA : 1984 - 2012
// LANDSAT/LE07/C01/T1_TOA : 1999 - 2015
// LANDSAT/LC08/C01/T1_TOA : 2013 - actual

var escena = "LANDSAT/LT05/C01/T1_TOA";
var inicio = '2000-01-01';
var fin    = '2000-04-30';
var descrip = 'Landsat_2000'

var pol = ee.Geometry.Rectangle(-77.08,-11.87,-77.02,-11.83);
var image1 = ee.ImageCollection(escena)
            .select(['B1','B2','B3','B4','B5','B7'])
            .filter(ee.Filter.eq('WRS_PATH', 07))
            .filter(ee.Filter.eq('WRS_ROW', 68))
            .filterDate(inicio,fin)
            .filterBounds(pol)
            .sort('CLOUD_COVER')
            .first()
            .clip(pol);

// Visualización de la img -------------------------------------------------
Map.centerObject(pol,13)
Map.addLayer(image1,{bands:['B5','B4','B3'], min:0.12,max:0.34},'image01');
print(image1);

// Exportar al drive la escena ---------------------------------------------

Export.image.toDrive({
    image: image1, 
    description: descrip,
    scale: 30,
    maxPixels: 1e8,
    region:pol
    
  });
