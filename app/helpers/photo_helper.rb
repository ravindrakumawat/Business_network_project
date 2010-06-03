module PhotoHelper
def thumbnail_tag(user)
    image_tag(user.photo.url, :border => 1)
end
end