class Login
  def login
    puts "Bem-vindo"
    puts "Sistema de gerenciamento"
    puts "de pequenos comércios"

    print "Usuário: "
    @usuario = gets.chomp
    print "Senha: "
    @senha = gets.chomp
  end


  def autenticacao
    if File.exist?("login.txt") && !File.zero?("login.txt")
      linhas = File.readlines("login.txtx").map(&:chomp)
      autenticado = linhas.any? do |linha|
        username, password = linha.split(':')
        @usuario == username && @senha == password
      end

      if autenticado
        puts "login bem sucedido!"
        Puts "Bem-vindo #{@usuario.capitalize}"
      else
        puts "Usuário e/ou senha inválidos!"
        login
      end
    else
      puts "Banco de dados inexistente!"
    end
   
  end
end

logar = Login.new
logar.login
logar.autenticacao