module ApplicationHelper
	def parse_url url
		uri = URI(url)
		uri.scheme.to_s+"://"+uri.host.to_s+uri.path.to_s
	end
end
