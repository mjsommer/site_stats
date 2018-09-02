Rails.application.routes.draw do
  root 'site_visits#top_urls'

  get '/top_urls', to: 'site_visits#top_urls'
  get '/top_referrers', to: 'site_visits#top_referrers'
end
