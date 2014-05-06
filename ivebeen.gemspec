Gem::Specification.new do |s|
    s.name        = "ivebeen"
    s.version     = "0.1.0"
    s.date        = "2014-05-06"
    s.summary     = "extract exif from image, and convert it to a geojson file"
    s.description = "extract exif from image, and convert it to a geojson file, for present"
    s.authors     = ["Juntao Qiu"]
    s.email       = "juntao.qiu@gmail.com"
    s.files       = Dir.glob("{bin,lib}/**/*")
    s.add_runtime_dependency 'thor', '>=0.18.1'
    s.add_runtime_dependency 'exifr', '>=1.1.3'
    s.executables << "ivebeen"
    s.homepage    = "https://github.com/abruzzi/ivebeen"
    s.license     = "MIT"
end
