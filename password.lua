------------------------------------------------------------------------
-------------------------------- FUNCTIONS ------------------------------
------------------------------------------------------------------------

function VerificarIgualdadePassword(_password, _confirmation)
    if not (_password == _confirmation) then
        io.write("\n", "[ERROR]: As senhas não são iguais, tente novamente.", "\n")
        return false
    end

    return true
end

function VerificarTamanhoPassword(_password)
    if #_password > 32 or #_password < 6 then
        io.write("\n","[ERROR]: Seu password não está em um intervalo correto", "\n")
        io.write("O invervalo correto é: 6~32", "\n")
        return false
    end

    return true
end

function InputPassword()
    io.write("\n", "Digite sua senha: ")
    local password = io.read()
    io.write("Digite sua senha novamente: ")
    local confirmation = io.read()
    
    if not VerificarIgualdadePassword(password, confirmation) then
        password = InputPassword() -- Stack overflow (call stack)
    end

    if not VerificarTamanhoPassword(password) then
        return InputPassword()
    end

    return password
end

return {
    --VerificarIgualdadePassword = VerificarIgualdadePassword,
    --VerificarTamanhoPassword = VerificarTamanhoPassword,
    InputPassword = InputPassword,
}