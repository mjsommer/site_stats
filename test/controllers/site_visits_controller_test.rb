require 'test_helper'

class SiteVisitsControllerTest < ActionDispatch::IntegrationTest
  test "should get top_urls" do
    get site_visits_top_urls_url
    assert_response :success
  end

  test "should get top_referrers" do
    get site_visits_top_referrers_url
    assert_response :success
  end

end
