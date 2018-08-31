# Populate db w/ sample data

# A set of 6 distinct urls
urls = {
  1 => "http://apple.com",
  2 => "https://apple.com",
  3 => "https://www.apple.com",
  4 => "http://developer.apple.com",
  5 => "http://en.wikipedia.org",
  6 => "http://opensource.org"
}

# A set of 4 distinct referrers, plus 1 null
referrers = {
  1 => "http://apple.com",
  2 => "https://apple.com",
  3 => "https://www.apple.com",
  4 => "http://developer.apple.com",
  5 => nil
}

# A set of 10 consecutive days, plus 2 for testing query limits
days = {
  1 => DateTime.now,
  2 => DateTime.now - 1.day,
  3 => DateTime.now - 2.day,
  4 => DateTime.now - 3.day,
  5 => DateTime.now - 4.day,
  6 => DateTime.now - 5.day,
  7 => DateTime.now - 6.day,
  8 => DateTime.now - 7.day,
  9 => DateTime.now - 8.day,
  10 => DateTime.now - 9.day,
  11 => DateTime.now - 10.day,
  12 => DateTime.now - 11.day
}

# Populate data
1000000.times do
  url = urls[rand(1..6)]
  created_at = days[rand(1..12)]

  ref_rand = rand(1..5)
  referrer = referrers[ref_rand]

  hash = Digest::MD5.hexdigest({url: url, referrer: !ref_rand.nil? ? referrer : 0 , created_at: created_at}.to_s)

  SiteVisit.create( url: url, referrer: referrer, created_at: created_at, hash: hash )
end
