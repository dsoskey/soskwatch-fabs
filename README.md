# soskwatch-fabs

soskwatch-fabs is my personal 3d modeling and fabrication catalogue

## development

### prerequisites / what i use

- [OpenSCAD](https://openscad.org/) for rendering models
- [BOSL2](https://github.com/revarbat/BOSL2)
- [Cura](https://ultimaker.com/software/ultimaker-cura) for compiling gcode
- [Ender 3](https://www.crealityofficial.co.uk/products/official-creality-ender-3-3d-printer) for printing

### getting started

1. install OpenSCAD
2. install BOSL2
3. clone this repo: `git clone git@github.com:dsoskey/soskwatch-fabs.git`
4. install soskwatch-fabs libraries: `cp -R ./soskwatch-fabs/libraries/ <PATH_TO_OPENSCAD_LIBRARY_DIR>`

### style guide

- prefer use over include when working with subcomponents to prevent accidentally rendering standalone subcomponents
- 