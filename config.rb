###
# Compass
###

# Susy grids in Compass
# First: gem install susy --pre
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###
# Methods defined in the helpers block are available in templates
 helpers do
 end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Don't compress html
Slim::Engine.set_default_options pretty: true


# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
  # activate :asset_host
  # set :asset_host, "http://d1s93caews9t2v.cloudfront.net/"
  # set :asset_host, "http://assets1.mikefrawley.com/"
  activate :asset_host
  set :asset_host do |asset|
    "http://assets%d.mikefrawley.com" % ((asset.hash % 4) + 1)
  end
end


# Deployment
# ====
# This un-checked in file should contain:
#   S3_ACCESS_KEY = '...'
#   S3_SECRET_KEY = '...'
#   CLOUDFRONT_ID = '...'
#   
load './secrets.rb'

activate :s3_sync do |s3_sync|
  s3_sync.bucket                = 'www.mikefrawley.com' # The name of the S3 bucket you are targetting. This is globally unique.
  s3_sync.region                = 'us-east-1'     # The AWS region for your bucket.
  s3_sync.aws_access_key_id     = S3_ACCESS_KEY
  s3_sync.aws_secret_access_key = S3_SECRET_KEY
  s3_sync.delete                = false # We delete stray files by default.
  s3_sync.after_build           = false # We chain after the build step by default. This may not be your desired behavior...
end

activate :cloudfront do |cf|
  cf.access_key_id = S3_ACCESS_KEY
  cf.secret_access_key = S3_SECRET_KEY
  cf.distribution_id = CLOUDFRONT_ID
  # cf.filter = /\.html$/i  # default is /.*/
  # cf.after_build = false  # default is false
end



