# shaders


Integrantes: Kevin Méndez Páez

Objetivos:
- Modelar distintos objetos que harán parte de la escena.
- Aplicar shaders escritos en GLSL que puedan renderizar la escena teniendo en cuenta la luz y las texturas.
- Mostrar distintos efectos que se pueden aplicar sobre la luz de la escena.
Descripción:
Se utilizo SketchUp para modelar los lapices y el libro, Blender para asociarles texturas a estos objetos y finalmente en processing se cargaban estos objetos, ademas de generar nuevo, como
una superficie, un vaso, un cono y una pelota. La pelota tiene un movimiento de rebote contra
la superficie y va reduciendo su velocidad con el paso del tiempo como se esperaria.
Se usan variables dentro del vertex shader que se modifican desde processing para cambiar
la intensidad de luz asi como sus colores.

Texturas:
https://thumbs.dreamstime.com/b/real-wood-table-top-texture-backgrounds-empty-102054903.jpg
http://www.backgroundsy.com/file/large/brushed-aluminum-texture.jpg
https://ih1.redbubble.net/image.215486676.1818/flat,800x800,070,f.u2.jpg

Referencias:
https://processing.org
http://ogldev.atspace.co.uk/
