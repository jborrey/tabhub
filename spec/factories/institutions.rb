FactoryGirl.define do
  factory :institution do
    name 'Test Institution'
    university 'Test University'
    location 'North of the wall'
    president_id 1
    website 'www.dukedebate.com'
    twitter_handle '@dukedebate'
    facebook_page 'facebook.com/some_page'
    youtube_channel 'youtube.com/some_channel'
    founded_at '1897-01-01'
  end
end
