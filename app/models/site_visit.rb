class SiteVisit < Sequel::Model

  # Get raw url stats
  dataset_module do
    def url_stats(day_qty)
      # TODO: Convert raw SQL to a Sequel Dataset
      SiteVisit.fetch("
        select date_trunc('day', created_at) AS date, url, count(*) AS visits
        from site_visits
        where created_at > now() - interval '? day' group by date, url
        order by date desc, visits desc", day_qty).all
    end
  end

  # Get raw referrer stats
  dataset_module do
    def referrer_stats(day_qty, url_set)
      # TODO: Convert raw SQL to a Sequel Dataset
      SiteVisit.fetch("
        select url, referrer, count(*) AS visits, date_trunc('day', created_at) AS date
        from site_visits
        where created_at > now() - interval '? day' and url IN ?
        group by date, url, referrer
        order by date desc, url, visits desc", day_qty, url_set.to_a).all
    end
  end

end
