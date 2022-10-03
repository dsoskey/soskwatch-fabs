# funky stuff

![](./screenshot.png)

![](./funky-stuff-first-cut.jpg)

## Bill of Materials
- [1/8" acrylic sheet](https://www.etsy.com/listing/808658891/transparent-plexiglass-acrylic-sheet?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=polycarbonate+lens&ref=sr_gallery-3-11&bes=1&col=1)
- [Clear PETG](https://www.hatchbox3d.com/collections/shop-all/products/petg-transparent-white-1-75mm-1kg-spool?_pos=2&_fid=dd6b7bb0e&_ss=c)
- 1 vinyl coated paper clip (mine are .6mm radius)
- Equipment
  - Dremel with cutter and sander
  - Lighter
  - Clamps

## Configuring your glasses

1. make a copy of my default config
```shell
cp ./danny-config.scad my-config.scad
```
2. open your config and adjust the parameters to fit your measurements. Measurement instructions are included in the config file 
3. run OpenSCAD with your config
```shell
openscad -o frame.stl ./funkyStuff.scad
openscad -o earpiece.stl ./my-config.scad 
```

## Printing

`TODO: add earpiece and frame cura profiles`

## Lens

- link to lens tracer

### Cutting


### Shaping 

