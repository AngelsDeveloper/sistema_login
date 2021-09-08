------------------------------------------------------------------------
------------------------------ PROVEDORES ------------------------------
------------------------------------------------------------------------

local provedores = {
    {index = "gmail.com"},
    {index = "hotmail.com"},
    {index = "yahoo.com"}
}

for key,prov in ipairs(provedores) do
    function prov.verificar(_email)
        return _email:find("@" .. prov.index)
    end
end

------------------------------------------------------------------------
------------------------------- FUNCTIONS ------------------------------
------------------------------------------------------------------------
function VerificarEmailExistente(_email, data)
    for key,users in pairs(data) do
        if users.email == _email then
            io.write("\n", "[ERROR]: Email já existente no banco de dados.", "\n")
            return false
        end
    end
    return true
end


function VerificarProvedorEmail(_email)
    local first, last

    for key, prov in ipairs(provedores) do
	    first, last = prov.verificar(_email)

        if first then
            break
        end
    end

	if not first or #_email ~= last then
		io.write("\n", "[ERROR]: Seu provedor não é válido, provedores válidos: ", "\n")
        for key,prov in ipairs(provedores) do
            io.write("\"", prov.index, "\"", "\n")
        end

		return false
	end

	local useremail = _email:sub(1, first - 1)
	local provedor = _email:sub(first + 1, last)
	
	return useremail, provedor
end

function VerificarTamanhoUseremail(_useremail)
	if #_useremail > 32 or #_useremail < 1 then
		io.write("\n","[ERROR]: Seu useremail não está em um intervalo correto", "\n")
        io.write("O invervalo correto é: 1~32", "\n")
		return false
	end

	return true
end

function InputEmail(data)
    io.write("\n", "Digite seu email: ")
    local email = io.read()

    local useremail, provedor = VerificarProvedorEmail(email)

    if not useremail or not VerificarTamanhoUseremail(useremail) or not VerificarEmailExistente(email, data) then
        return InputEmail(data)
    end

    return email
end

return {
    --VerificarProvedorEmail = VerificarProvedorEmail,
    --VerificarTamanhoUseremail = VerificarTamanhoUseremail,
    InputEmail = InputEmail
}