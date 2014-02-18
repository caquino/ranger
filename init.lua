local cache_dict = ngx.shared.cache_dict

cache_dict:set("cache_hit", 0)
cache_dict:set("cache_miss", 0)
