module ApplicationHelper
def liked
  liked = current_user.liked?(review) ? 'liked' : ''
  content_tag(:i, '', class: "fas fa-money-bill-alt")
end
end
