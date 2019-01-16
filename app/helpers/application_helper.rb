module ApplicationHelper
	def liked
	  liked = current_user.liked?(review) ? 'liked' : ''
	  content_tag(:i, '', class: "fas fa-money-bill-alt")
	end
	
	def mobile_device
	  agent = request.user_agent
	  return "tablet" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
	  return "mobile" if agent =~ /Mobile/
	  return "desktop"
	end
end
