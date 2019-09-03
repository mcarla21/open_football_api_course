json.array! @modified_logos do |logo|
  json.set! :smaller_logo, rails_representation_url(logo[:logo_100])
  json.set! :bigger_logo, rails_representation_url(logo[:logo_600])
  json.set! :giant_logo, rails_representation_url(logo[:logo_1024_768])
end