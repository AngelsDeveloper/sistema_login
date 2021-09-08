------------------------------------------------------------------------
-------------------------------- FUNCTIONS ------------------------------
------------------------------------------------------------------------

function VerificarTamanhoUsername(_username)
    if #_username > 16 or #_username < 4 then
        io.write("\n","[ERROR]: Seu username não está em um intervalo correto", "\n")
        io.write("O invervalo correto é: 4~16", "\n")
        return false
    end

    return true
end

function InputUsername()
    io.write("Digite seu username: ")
    local username = io.read()

    if not VerificarTamanhoUsername(username) then
        io.write("\n")
        return InputUsername()
    end

    return username
end

return {
    --VerificarTamanhoUsername = VerificarTamanhoUsername,
    InputUsername = InputUsername
}