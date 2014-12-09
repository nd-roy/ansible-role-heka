-- Sample input:
-- {
--     "message": "Reloading user from user provider.",
--     "context": [
--     ],
--     "level": 100,
--     "level_name": "DEBUG",
--     "channel": "security",
--     "datetime": {
--         "date": "2014-05-23 14:19:19",
--         "timezone_type": 3,
--         "timezone": "Europe\/Paris"
--     },
--     "extra": {
--         "url": "\/app_dev.php\/",
--         "ip": "127.0.0.1",
--         "http_method": "GET",
--         "server": "connect.product.localhost",
--         "referrer": null
--     }
-- }

require "string"
require "cjson"

local msg_type = read_config("type")
local msg_hostname = read_config("hostname")
local msg_facet = read_config("facet")
local msg_server = read_config("server")

local date_pattern = '^(%d+-%d+-%d+) (%d+:%d+:%d+)'
local severity_map = {
    DEBUG = 7,
    INFO = 6,
    NOTICE = 5,
    WARNING = 4,
    ERROR = 3,
    CRITICAL = 2,
    ALERT = 1,
    EMERGENCY = 0
}

local msg = {
    Timestamp   = nil,
    Type        = msg_type,
    Payload     = nil,
    Fields      = {}
}

function process_message()
    local json = cjson.decode(read_message("Payload"))

    if not json then
        return -1
    end

    msg.Payload = cjson.encode(json)

    msg.Severity = severity_map[json.level_name]

    msg.Logger = json.channel

    -- WARNING, the TZ must be UTC
    local d, t = string.match(json.datetime.date, date_pattern)
    if d then
        msg.Timestamp = string.format("%sT%sZ", d, t)
    end

    msg.Hostname = msg_hostname

    -- In order to use native Heka Id, it should be of type "raw bytes or
    -- RFC4122 string representation"
    if json.extra.uuid then
        msg.Fields.UUID = json.extra.uuid
    end
    msg.Fields.Message = json.message
    msg.Fields.SeverityText = json.level_name
    if msg_facet then
        msg.Fields.facet = msg_facet
    end
    if msg_server then
        msg.Fields.server = msg_server
    end

    inject_message(msg)

    return 0
end
