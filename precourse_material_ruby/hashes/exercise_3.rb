weather = {temperature: 65, clouds: 'scattered', raining: 'no'}

weather.each_key {|key| puts key}

weather.each_value {|value| puts value}

weather.each {|key, value| puts key, value}