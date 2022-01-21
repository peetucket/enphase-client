# Enlighten Ruby

This is a lightweight Ruby wrapper around the Enphase Enlighten API available at https://developer.enphase.com/

I am not affiliated with Enphase, this is just a convenience wrapper around their published API to make it easy to use in a Ruby app.  To use it, you will need to register an app to obtain an API key (or use your own existing API key).  You will also need to get authorization to connect a user's system (even if your own) using the instructions provided at https://developer.enphase.com/docs/quickstart.html

## Usage

1. Add the gem to your Gemfile.
2. Require if neeed.
3. Once you have an API key and an authorized user ID, you can instantiate the client and make API calls.  You will usually need the system ID you are interested in for most calls.  There is a call to fetch system IDs that you have access to. Responses are ruby hash objects.
4. Dates returned by the API can be in one of two formats, UNIX Epoch or ISO8601.  The client defaults to ISO8601, but you can specify epoch if you want when instantiating the client.

In Gemfile:
```
gem 'enphase-client'
```

In app:
```
require 'enphase-client'
client = Enphase::Client.new(api_key: YOUR_API_KEY, user_id: AUTHORIZED_USER_ID)

OR

client = Enphase::Client.new(api_key: YOUR_API_KEY, user_id: AUTHORIZED_USER_ID, datetime_format: 'epoch') # for epoch datetimes

result = client.stats(system_id: SYSTEM_ID)
result
 =>
3.0.3 :006 > c.stats(system_id: '2599884')
 =>
{"system_id"=>2599884,
 "total_devices"=>19,
 "intervals"=>
  [{"end_at"=>"2022-01-21T07:20:00-08:00", "devices_reporting"=>19, "powr"=>3, "enwh"=>0},
   {"end_at"=>"2022-01-21T07:25:00-08:00", "devices_reporting"=>19, "powr"=>7, "enwh"=>1},
   {"end_at"=>"2022-01-21T07:30:00-08:00", "devices_reporting"=>19, "powr"=>29, "enwh"=>2},
   {"end_at"=>"2022-01-21T07:35:00-08:00", "devices_reporting"=>19, "powr"=>46, "enwh"=>4},
   {"end_at"=>"2022-01-21T07:40:00-08:00", "devices_reporting"=>19, "powr"=>75, "enwh"=>6},
   {"end_at"=>"2022-01-21T07:45:00-08:00", "devices_reporting"=>19, "powr"=>98, "enwh"=>8},
   {"end_at"=>"2022-01-21T07:50:00-08:00", "devices_reporting"=>19, "powr"=>119, "enwh"=>10},
   {"end_at"=>"2022-01-21T07:55:00-08:00", "devices_reporting"=>19, "powr"=>132, "enwh"=>11},
   {"end_at"=>"2022-01-21T08:00:00-08:00", "devices_reporting"=>19, "powr"=>151, "enwh"=>13},
   {"end_at"=>"2022-01-21T08:05:00-08:00", "devices_reporting"=>19, "powr"=>169, "enwh"=>14},
   {"end_at"=>"2022-01-21T08:10:00-08:00", "devices_reporting"=>19, "powr"=>187, "enwh"=>16},
   {"end_at"=>"2022-01-21T08:15:00-08:00", "devices_reporting"=>19, "powr"=>214, "enwh"=>18},
   {"end_at"=>"2022-01-21T08:20:00-08:00", "devices_reporting"=>19, "powr"=>233, "enwh"=>19},
   {"end_at"=>"2022-01-21T08:25:00-08:00", "devices_reporting"=>19, "powr"=>252, "enwh"=>21},
   {"end_at"=>"2022-01-21T08:30:00-08:00", "devices_reporting"=>19, "powr"=>282, "enwh"=>24},
   {"end_at"=>"2022-01-21T08:35:00-08:00", "devices_reporting"=>19, "powr"=>321, "enwh"=>27},
   {"end_at"=>"2022-01-21T08:40:00-08:00", "devices_reporting"=>19, "powr"=>380, "enwh"=>32},
   {"end_at"=>"2022-01-21T08:45:00-08:00", "devices_reporting"=>19, "powr"=>460, "enwh"=>38},
   {"end_at"=>"2022-01-21T08:50:00-08:00", "devices_reporting"=>19, "powr"=>560, "enwh"=>47},
   {"end_at"=>"2022-01-21T08:55:00-08:00", "devices_reporting"=>19, "powr"=>654, "enwh"=>55},
   {"end_at"=>"2022-01-21T09:00:00-08:00", "devices_reporting"=>19, "powr"=>720, "enwh"=>60},
   {"end_at"=>"2022-01-21T09:05:00-08:00", "devices_reporting"=>19, "powr"=>760, "enwh"=>63},
   {"end_at"=>"2022-01-21T09:10:00-08:00", "devices_reporting"=>19, "powr"=>807, "enwh"=>67},
   {"end_at"=>"2022-01-21T09:15:00-08:00", "devices_reporting"=>19, "powr"=>852, "enwh"=>71},
   {"end_at"=>"2022-01-21T09:20:00-08:00", "devices_reporting"=>19, "powr"=>865, "enwh"=>72},
   {"end_at"=>"2022-01-21T09:25:00-08:00", "devices_reporting"=>19, "powr"=>846, "enwh"=>71},
   {"end_at"=>"2022-01-21T09:30:00-08:00", "devices_reporting"=>19, "powr"=>847, "enwh"=>71},
   {"end_at"=>"2022-01-21T09:35:00-08:00", "devices_reporting"=>19, "powr"=>936, "enwh"=>78},
   {"end_at"=>"2022-01-21T09:40:00-08:00", "devices_reporting"=>19, "powr"=>1054, "enwh"=>88},
   {"end_at"=>"2022-01-21T09:45:00-08:00", "devices_reporting"=>19, "powr"=>1164, "enwh"=>97},
   {"end_at"=>"2022-01-21T09:50:00-08:00", "devices_reporting"=>19, "powr"=>1315, "enwh"=>110},
   {"end_at"=>"2022-01-21T09:55:00-08:00", "devices_reporting"=>19, "powr"=>1464, "enwh"=>122},
   {"end_at"=>"2022-01-21T10:00:00-08:00", "devices_reporting"=>19, "powr"=>1587, "enwh"=>132},
   {"end_at"=>"2022-01-21T10:05:00-08:00", "devices_reporting"=>19, "powr"=>1759, "enwh"=>147},
   {"end_at"=>"2022-01-21T10:10:00-08:00", "devices_reporting"=>19, "powr"=>1967, "enwh"=>164},
   {"end_at"=>"2022-01-21T10:15:00-08:00", "devices_reporting"=>19, "powr"=>2107, "enwh"=>176},
   {"end_at"=>"2022-01-21T10:20:00-08:00", "devices_reporting"=>19, "powr"=>2216, "enwh"=>185},
   {"end_at"=>"2022-01-21T10:25:00-08:00", "devices_reporting"=>19, "powr"=>2364, "enwh"=>197},
   {"end_at"=>"2022-01-21T10:30:00-08:00", "devices_reporting"=>19, "powr"=>2535, "enwh"=>211},
   {"end_at"=>"2022-01-21T10:35:00-08:00", "devices_reporting"=>19, "powr"=>2645, "enwh"=>220},
   {"end_at"=>"2022-01-21T10:40:00-08:00", "devices_reporting"=>19, "powr"=>2685, "enwh"=>224},
   {"end_at"=>"2022-01-21T10:45:00-08:00", "devices_reporting"=>19, "powr"=>2802, "enwh"=>234},
   {"end_at"=>"2022-01-21T10:50:00-08:00", "devices_reporting"=>19, "powr"=>2944, "enwh"=>245},
   {"end_at"=>"2022-01-21T10:55:00-08:00", "devices_reporting"=>19, "powr"=>2988, "enwh"=>249},
   {"end_at"=>"2022-01-21T11:00:00-08:00", "devices_reporting"=>19, "powr"=>2997, "enwh"=>250},
   {"end_at"=>"2022-01-21T11:05:00-08:00", "devices_reporting"=>19, "powr"=>3070, "enwh"=>256},
   {"end_at"=>"2022-01-21T11:10:00-08:00", "devices_reporting"=>19, "powr"=>3144, "enwh"=>262}],
 "meta"=>
  {"status"=>"normal",
   "last_report_at"=>"2022-01-21T11:16:29-08:00",
   "last_energy_at"=>"2022-01-21T11:12:58-08:00",
   "operational_at"=>"2014-01-01T10:29:53-08:00"}}
```

## Available API calls in the client

These are just mapped 1:1 for the calls shown at https://developer.enphase.com/docs

If the call succeeds, you will get a Ruby hash out that maps exactly the JSON response described in the documents.
If the call fails, you will get a `Enphase::ClientError` error raised with a status code and message.  You should handle this exception in your app to provide error handling.

If optional parameters can be passed for these API calls, you can add them has keyword arguments to the method (a couple examples shown below).  Note that the `start_at` and `end_at` interval parameters that can be passed to many of the
calls are UNIX epoch times, regardless of the return date format specified.  You can convert ruby dates to UNIX epoch:

```
require 'time'
puts Time.parse('2022-01-15T10:20:00-08:00').to_i
=> 1642270800
```

1. Stats: https://developer.enphase.com/docs#stats

```
result = client.stats(system_id: SYSTEM_ID)

# with optional intervals parameters
result = client.stats(system_id: SYSTEM_ID, start_at: '1642270800', end_at: '1642278000')

```

2. Summary: https://developer.enphase.com/docs#summary

```
result = client.summary(system_id: SYSTEM_ID)
```

3. Inverters summary: https://developer.enphase.com/docs#inverters_summary_by_envoy_or_site

```
result = client.inverters(system_id: SYSTEM_ID)
```

4. Systems: https://developer.enphase.com/docs#index

```
result = client.systems
```

## License

This code is provided under an MIT License.  https://opensource.org/licenses/MIT
