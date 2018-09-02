# README

This is a sample API app.

Setup: Run 'db:drop db:create db:migrate db:seed', to build the db, and generate 1M rows of data.

API:

1) Number of page views per URL, grouped by day, for the past 5 days: http://localhost:3000/top_urls

2) Top 5 referrers, for the top 10 URLs grouped by day, for the past 5 days: http://localhost:3000/top_referrers

Requirements:

 - Rails 5
 - Postgres
