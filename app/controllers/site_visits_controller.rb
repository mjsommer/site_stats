class SiteVisitsController < ApplicationController

  # REST endpoint to retrieve the number of page views per URL, grouped by day, for the past 5 days
  def top_urls
    stats = SiteVisit.url_stats(5)
    results = {}

    # Format as hash, with array of hashes
    stats.each do |s|
      results[s[:date].strftime("%F")] = ['url' => s[:url], 'visits' => s[:visits]]
    end

    render :json => results
  end

  # REST endpoint to retrieve the top 5 referrers, for the top 10 URLs, grouped by day, for the past 5 days
  def top_referrers
    url_stats = SiteVisit.url_stats(5)
    url_set = Set[]
    results = {}

    # Gather list of urls for In statement
    url_stats.each do |s|
      url_set << s.url
    end

    # Get referrer stats
    referrer_stats = SiteVisit.referrer_stats(5, url_set)

    # Format as hash, with array of hashes, and referrer as an array of hashes
    url_stats.each do |s|
      ref_array = []
      referrers = referrer_stats.select {|k| k[:url] == s[:url]}
      referrers_by_date = referrers.select {|k| k[:date] == s[:date]}

      referrers_by_date.each do |r|
        ref_array << { :url => r[:referrer], :visits => r[:visits] }
      end

      results[s[:date].strftime("%F")] = [ :url => s[:url], :visits => s[:visits], :referrers => ref_array ]
    end

    render :json => results
  end
end
