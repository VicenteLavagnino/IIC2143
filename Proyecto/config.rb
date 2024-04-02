# Replace the 'config_from_url' string value below with your
# product environment's credentials, available from your Cloudinary console.
# =====================================================

require 'cloudinary'

Cloudinary.config_from_url("cloudinary://627426456856253:ezyD7zCwm1k4RIPNIRfuHXSUwZw@db7ai9zpx")
Cloudinary.config do |config|
  config.secure = true
end