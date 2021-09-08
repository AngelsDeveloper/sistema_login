local json = require "dkjson"
local email = require "email"
local username = require "username"
local password = require "password"

os.execute("clear")

local user = {}
user.username = username.InputUsername()
user.email = email.InputEmail()
user.password = password.InputPassword()

io.write("\n", "----- CADASTRO FEITO COM SUCESSO -----", "\n\n")

print(json.encode(user))