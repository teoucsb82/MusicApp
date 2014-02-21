module BandsHelper

	#lets us use <%= band_image(@band, :small) %>
	def band_image(band, size)
		"<img src=\"#{h(band.image_url)}\" class=\"band-image #{size}\">".html_safe
	end
end

