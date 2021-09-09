local json = require "dkjson"

function GetDatabase()
    local file = io.open("database.json", "r")
    local data 
    if file then
        local content = file:read("*a")
        data = json.decode(content or "") or {}
    else
        file = io.open("database.json", "w")
        data = {}
    end

    file:close()

    return data
end

function SetDatabase(data, user)
    local file = io.open("database.json", "w+")

    data[#data + 1] = user
    file:write(json.encode(data))

    file:close()
end

return {
    GetDatabase = GetDatabase,
    SetDatabase = SetDatabase
}