local logging = require("logging")
local cjson = require("cjson")

local cache_dict = ngx.shared.cache_dict
local log_dict = ngx.shared.log_dict

local count, avg, elapsed_time =  logging.get_plot(log_dict, "request_time")
local hits, flags = cache_dict:get("cache_hit")
local misses, flags = cache_dict:get("cache_miss")

local output = {}

output["last_t"] = elapsed_time 
output["count"] = count
output["avgreqt"] = avg
if avg > 0 then
	output["qps"] = count / elapsed_time
else
	output["qps"] = 0
end
output["cache"] = {}
output["cache"]["hits"] = hits
output["cache"]["misses"] = misses

ngx.say(cjson.encode(output))
ngx.exit(ngx.OK)
