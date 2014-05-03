http_path               = "/"
http_stylesheet_dir     = "css/"
http_images_dir         = "img/"
sass_dir                = "scss/"
css_dir                 = "htdocs/css/"
images_dir              = "htdocs/img/"
javascripts_dir         = "htdocs/js"
relative_assets         = false
asset_cache_buster      = :none
output_style            = (environment == :production) ? :compressed : :nested
line_comments           = (environment == :production) ? :false : :true
