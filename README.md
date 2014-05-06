#### What's *ivebeen*

`ivebeen` is a simple tool for extract [EXIF](http) out of images taken by smart phones(iPhone, Andorid), and converts those information to [geojson](http://en.wikipedia.org/wiki/GeoJSON).

So basically, the geojson is very handy to be rendered on Maps, like google maps.

#### How to use it?

First you need to install it:

```sh
gem install ivebeen
```

and then simply use the `generate` sub-command to generate the geojson file.

```sh
ivebeen generate "/Users/jtqiu/Dropbox/Camera\ Uploads"
```

and after a while, you should find a file named `places.geojson` in current folder.

That's it.
