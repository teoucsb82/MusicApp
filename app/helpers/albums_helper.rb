module AlbumsHelper
	def album_image(album, size)
		"<img src=\"#{h(album.image_url)}\" class=\"album-image #{size}\">".html_safe
	end
end
