```ruby
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
```

OUTPUT:
```
#<OpenStruct exits="2929", pageviews="4258", organic_searches="2215", visitors="2797", date="20130731">
#<OpenStruct exits="2558", pageviews="3865", organic_searches="1946", visitors="2454", date="20130801">
#<OpenStruct exits="2444", pageviews="3711", organic_searches="1831", visitors="2355", date="20130802">
#<OpenStruct exits="2046", pageviews="3010", organic_searches="1481", visitors="1964", date="20130803">
#<OpenStruct exits="2369", pageviews="3502", organic_searches="1741", visitors="2292", date="20130804">
#<OpenStruct exits="3119", pageviews="4734", organic_searches="2353", visitors="2984", date="20130805">
#<OpenStruct exits="3142", pageviews="4657", organic_searches="2366", visitors="2996", date="20130806">
#<OpenStruct exits="3012", pageviews="4479", organic_searches="2278", visitors="2869", date="20130807">
#<OpenStruct exits="2904", pageviews="4453", organic_searches="2221", visitors="2779", date="20130808">
#<OpenStruct exits="2743", pageviews="4096", organic_searches="2080", visitors="2632", date="20130809">
#<OpenStruct exits="2585", pageviews="3883", organic_searches="1872", visitors="2489", date="20130810">
#<OpenStruct exits="2991", pageviews="4511", organic_searches="2206", visitors="2884", date="20130811">
```

Nice ;)
