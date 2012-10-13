# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'livereload' do
  watch(%r{source/.+\.(erb|haml|slim)$})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{source/stylesheets/.*})  { |m| "/stylesheets/application.css" }
end
