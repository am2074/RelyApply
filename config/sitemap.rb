# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.relyapply.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  add companies_path, :priority => 0.5, :changefreq => 'daily'
  Company.find_each do |company|
    add company_path(company), :lastmod => company.updated_at, :priority => 0.5

    company.reviews.each do |review|
      add company_reviews_path(company), :changefreq => 'daily', :lastmod => review.updated_at
    end

    company.offers.each do |review|
      add company_offers_path(company), :changefreq => 'daily', :lastmod => review.updated_at
    end
  end
  


  add reviews_path, :priority => 0.5, :changefreq => 'daily'
  Review.find_each do |review|
    add review_path(review), :lastmod => review.updated_at, :priority => 0.5
  end
  

  add offers_path, :priority => 0.5, :changefreq => 'daily'
  Offer.find_each do |offer|
    add offer_path(offer), :lastmod => offer.updated_at, :priority => 0.5
  end
end
