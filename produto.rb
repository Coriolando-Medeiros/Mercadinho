class Produto
  def initialize
    @produtos = []
    @fornencedores = []
  end


#Tenho que fazer o cadastro mudar de array para arquivo ainda
  def cadastrar_produto
    codigo = 10000
    if File.exist?("estoque.txt")
      File.open("estoque.txt", "r") do |arquivo|
        arquivo.each_line do |linha|
          if linha =~ /Código: (\d+)/
            codigo = $1.to_i
          end
        end
      end
    else
      codigo = 10000
    end

    codigo += 1

    puts "Cadastrar produtos"
    print "Nome: "
    nome = gets.chomp
    print "Preço: "
    preco = gets.chomp.to_f
    print "Categoria: "
    produto_categoria = gets.chomp
    print "Quantidade: "
    quantidade = gets.chomp.to_i

    File.open("estoque.txt", "a") do |arquivo|
      arquivo.puts "Produto: #{nome} | Preço: #{preco} | Categoria: #{produto_categoria} | Quantidade: #{quantidade} | Código: #{codigo}"
    end
  end

  def remover_produto
    puts "Remover produto"
    if @produtos.empty?
      puts "Estoque inexistente!"
      puts "Adicionar novo produto?"
      puts "1 - Sim | Enter - Sair"
      opcao = gets.chomp
      if opcao == '1'
        cadastrar_produto
      else
        puts "Saindo..."
        return
      end
    else
      @produtos.each_with_index do |item, indice|
        puts "#{indice + 1}° item | Nome: #{item[:nome]} | Preço: #{item[:preco]} | Quantidade: #{item[:quantidade]} | Categoria: #{item[:produto_categoria]} |Código: #{item[:codigo]}"
      end
      puts "Qual produto deseja remover?"
      puts "Digite o número do índice"
      escolha = gets.chomp.to_i - 1

      

      if escolha >= 0 && escolha < @produtos.size
        puts "Deseja mesmo remover?"
        puts "1 - Sim | Enter - Sair"
        opcao_remover = gets.chomp

        if opcao_remover == '1'
          @produtos.delete_at(escolha)
          puts "Produto removido!"
        else
          puts "Saindo..."
          return
        end
      else
        puts "Escolha inválida!"
      end
    end
  end

  def listar_produtos
    puts "Lista de produtos"
    @produtos.each_with_index do |item, indice|
      puts "#{indice + 1}º item | Nome: #{item[:nome]} | Preço: #{item[:preco]} | Quantidade: #{item[:quantidade]} | Catergoria: #{item[:produto_categoria]} | Código: #{item[:codigo]}"
    end
  end



  def cadastrar_fornecedor
    puts "Cadastrar fornencedores"
    print "Nome: "
    nome_fornecedor = gets.chomp.capitalize
    print "Empresa: "
    nome_empresa = gets.chomp.capitalize
    print "Telefone: "
    telefone_empresa = gets.chomp
    print "E-mail: "
    email_empresa = gets.chomp.downcase

    @fornencedores << { nome: nome_fornecedor, empresa: nome_empresa, telefone: telefone_empresa, email: email_empresa}
  end

  def listar_fornecedores
    puts "Lista de fornecedores"
    @fornecedores.each_with_index do |item, indice|
      puts "#{indice + 1}º item | Vendedor: #{item[:nome]} | Empresa: #{item[:empresa]} | Telefone: #{item[:telefone]} | E-mail: #{item[:email]}"
    end
  end

  def remover_fornecedor
    puts "Remover fornecedor"
    if @fornecedores.empty?
      puts "Nenhum fornecedor cadastrado"
      puts "Cadastrar novo fornecedor?"
      puts "1 - Sim | Enter - sair"
      escolha = gets.chomp
      if escolha == '1'
        cadastrar_fornecedor
      else
        puts "Saindo..."
        return
      end
    else
      @fornecedores.each_with_index do |item, indice|
        puts "#{indice + 1}º item | Vendedor: #{item[:nome]} | Empresa: #{item[:empresa]} | Telefone: #{item[:telefone]} | E-mail: #{item[:email]}"
      end
      puts "Qual fornecedor remover?"
      puts "Digite o número do índice"
      escolha = gets.chomp.to_i - 1
      if escolha >= 0 && escolha < @fornecedores.size
        puts "Deseja mesmo remover?"
        puts "1 - Sim | Enter - Sair"
        opcao_remover = gets.chomp
        if opcao_remover == '1'
          @fornecedores.delete_at(escolha)
          puts "Fornecedor removido!"
        else
          puts "Saindo..."
          return
        end
      else
        puts "Escolha inválida!"
      end
    end
  end

end

#Transformar as outras funções em leituras de arquivos

#produtos = Produto.new
#produtos.lista_de_produtos
#produtos.remover_produto
#produtos.listar_produtos
#produtos.lista_de_fornecedores
#produtos.listar_fornecedores
#produtos.remover_fornecedor
#produtos.listar_fornecedores