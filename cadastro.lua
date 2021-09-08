local json = require "dkjson"
local email = require "email"
local username = require "username"
local password = require "password"

os.execute("clear")

local user = {
    username = nil,
    email = nil,
    password = nil
}

local database = {
    file = nil,
    conteudo = nil,
    data = nil
}

database.file = io.open("database.json", "r")
database.conteudo = database.file:read("*a")
database.data = json.decode(database.conteudo) or {}

user.username = username.InputUsername()
user.email = email.InputEmail(database.data)
user.password = password.InputPassword()

database.data[#database.data + 1] = user
database.file = io.open("database.json", "w+")
database.file:write(json.encode(database.data))

io.write("\n", "----- CADASTRO FEITO COM SUCESSO -----", "\n\n")