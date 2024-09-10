class Administrador

  def ver_relatorios
    @vendas.historico_vendas
  end

  def menu_admin_estoque
    loop do
      puts "Menu"
      puts "1 - Fornecdor"
      puts "2 - Produto"
      puts "3 - Históricos"
      puts "0 - Sair"
      print "Opção: "
      opcao = gets.chomp

      if opcao == '1'
        menu_fornecedor
      elsif opcao == '2'
        menu_produto
      elsif opcao == '3'
        menu_estoque
      elsif opcao == '0'
        puts "Saindo..."
        return
      else
        puts "Opção inválida! Tente novamente"
      end
    end
  end

  def menu_fornecedor
    loop do
      puts "Menu Fornecedor"
      puts ""
      puts "1 - Cadastrar fornecedor"
      puts "2 - Listar fornecedores"
      puts "3 - Remover fornecedor"
      puts "0 - Sair"
      print "Opção: "
      opcao = gets.chomp

      require_relative 'produto'
      @produto = Produto.new('estoque.txt')
      if opcao == '1'
        @produto.cadastrar_fornecedor
      elsif opcao == '2'
        @produto.listar_fornecedores
      elsif opcao == '3'
        @produto.remover_fornecedor
      elsif opcao == '0'
        puts "Saindo..."
        return
      else
        puts "Opção inválida! Tente novamente"
      end
    end
  end

  def menu_produto
    loop do
      puts "Menu Produto"
      puts ""
      puts "1 - Cadastrar produto"
      puts "2 - Listar produtos"
      puts "3 - Remover produto"
      puts "0 - Sair"
      print "Opção: "
      opcao = gets.chomp

      require_relative 'produto'
      @produto = Produto.new('estoque.txt')
      if opcao == '1'
        @produto.cadastrar_produto
      elsif opcao == '2'
        @produto.listar_produtos
      elsif opcao == '3'
        @produto.remover_produto
      elsif opcao == '0'
        puts "Saindo..."
        return
      else
        puts "Opção inválida! Tente novamente"
      end
    end
  end

  
end


admin = Administrador.new
admin.menu_admin_estoque