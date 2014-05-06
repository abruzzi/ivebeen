require 'json'
require 'exifr'

def to_decimal(dms)
    dms[0].to_f + dms[1].to_f / 60 + dms[2].to_f / 3600
end

def to_geojson(exif)
    lat_exif = exif.gps_latitude
    lon_exif = exif.gps_longitude
    return "" unless lon_exif && lat_exif
    lon = to_decimal(lon_exif.map(&:to_f))
    lon = -lon if exif.gps_longitude_ref == "W"
    lat = to_decimal(lat_exif.map(&:to_f))
    lat = -lat if exif.gps_latitude_ref == "S"
    {
        :type => "Point",
        :coordinates => [lon, lat]
    }
end

def format_attachment_gps(file)
    geometry, altitude = nil, nil
    body = File.read file
    r, w = IO.pipe
    w.write_nonblock(body)
    exif = EXIFR::JPEG.new(r)
    geometry = to_geojson(exif)
    altitude = exif.gps_altitude.to_f
    altitude = -altitude if exif.gps_altitude_ref.to_i < 0
    {   :type => "Feature",
        :geometry => geometry,
        :properties => {
            :altitude => altitude
        }
    }
end

def extract_image_info(path)
    image_types = "*.jpg"

    info = []
    Dir.glob("#{path}/#{image_types}") do |jpg|
        begin
            info << format_attachment_gps(jpg)
            print "."
        rescue Exception => e
            print "E"
        end
    end

    puts "\n"

    {
        :type => "FeatureCollection",
        :features => info
    }.to_json
end
