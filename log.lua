local logging = require("logging") 

local log_dict = ngx.shared.log_dict

local request_time = ngx.now() - ngx.req.start_time()
logging.add_plot(log_dict, "request_time", request_time)
