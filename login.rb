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
      linhas = File.readlines("login.txt").map(&:chomp)
      autenticado = linhas.any? do |linha|
        username, password = linha.split(':')
        @usuario == username && @senha == password
      end

      if autenticado
        puts "login bem sucedido!"
        puts "Bem-vindo #{@usuario.capitalize}"
        if @usuario == "administrador"
          require_relative 'admin'
          admin = Administrador.new
          admin.menu_admin_estoque

        else
          require_relative 'vendas'
          vendas = Vendas.new("estoque.txt")
          loop do
            puts "Menu"
            puts ""
            puts "1 - Vender"
            puts "2 - Histórico de vendas"
            puts "0 - Sair"
            print "Opção: "
            opcao = gets.chomp

            if opcao == '1'
              vendas.iniciar
            elsif opcao == '2'
              vendas.historico_vendas
            elsif opcao == '0'
              puts "Saindo..."
              return
            else
              puts "Opção inválida! Tente novamente"
            end
          end
        end
      else
        puts "Usuário e/ou senha inválidos!"
      end
    else
      puts "Banco de dados inexistente!"
    end
   
  end
end

logar = Login.new
logar.login
logar.autenticacao