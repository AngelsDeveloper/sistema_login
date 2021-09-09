local email = require "email"
local username = require "username"
local password = require "password"
local database = require "database"
local user = {}

os.execute("clear")

local data = database.GetDatabase()

user.username = username.InputUsername()
user.email = email.InputEmail(data)
user.password = password.InputPassword()

database.SetDatabase(data, user)

io.write("\n", "----- CADASTRO FEITO COM SUCESSO -----", "\n\n")
io.write("Username: ", user.username, "\n")
io.write("Email: ", user.email, "\n")