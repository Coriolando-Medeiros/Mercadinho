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

  
end


admin = Administrador.new
admin.menu_admin_estoque