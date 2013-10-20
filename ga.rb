require 'garb'
require 'active_support/core_ext/time'
require 'active_support/core_ext/date'
require 'active_support/core_ext/numeric'

Garb::Session.login('xxx', 'xxx')
profile = Garb::Management::Profile.all.detect {|p| p.web_property_id == 'UA-xxxxxxxx-x'}

class Exits
  extend Garb::Model
  metrics :exits, :pageviews, :organicSearches, :visitors
  dimensions :date 
end

result = profile.exits(
  :filters => {},
  :start_date => 100.days.ago,
  :end_date => DateTime.now
)

result.each{|r|
  puts r.inspect
}
