class Produto
  def initialize(arquivo = nil)
    @arquivo = arquivo
    @produtos = []
    @fornencedores = []
  end



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
    if File.exist?("estoque.txt") && !File.zero?("estoque.txt")
      produtos = File.readlines("estoque.txt")

      produtos.each_with_index do |produto, indice|
        puts "Produto: #{indice + 1}: #{produto}"
      end
      puts "Qual produto deseja excluir?"
      puts "Digite o número | Enter - Sair"
      escolha = gets.chomp.to_i - 1

      if escolha >= 0 && escolha < produtos.size
        puts "Deseja mesmo excluir? É irreversivel!"
        puts "1 - Sim | Enter - Sair"
        opcao_deleta = gets.chomp
        if opcao_deleta == '1'
          produtos.delete_at(escolha)

          File.open("estoque.txt", "w") do |arquivo|
            arquivo.puts(produtos)
          end
        else
          puts "Saindo..."
          return
        end
        puts "Produto removido!"
      else
        puts "escolha inválida!"
      end
    else
      puts "estoque vazio!"
      puts "Adicionar item?"
      puts "1 - Sim | Enter - Sair"
      opcao = gets.chomp
      if opcao == '1'
        cadastrar_produto
      else
        puts "Saindo..."
        return
      end
    end
  end

  def listar_produtos
    puts "Lista de produtos"
    if File.exist?("estoque.txt") && !File.zero?("estoque.txt")
      File.open("estoque.txt", "r") do |arquivo|
        arquivo.each_line do |linha|
          puts linha
        end
      end
    else
      puts "Estoque vazio!"
      puts "Adicionar produto?"
      puts "1 - Sim | Enter - Não"
      opcao = gets.chomp
      if opcao == '1'
        cadastrar_produto
      else
        puts "Saindo..."
        return
      end
    end
  end



  def cadastrar_fornecedor
    puts "Cadastrar fornencedores"
    print "Empresa: "
    nome_empresa = gets.chomp.capitalize
    print "Vendedor: "
    nome_vendedor = gets.chomp.capitalize
    print "Telefone: "
    telefone_empresa = gets.chomp
    print "E-mail: "
    email_empresa = gets.chomp.downcase


    File.open("fornecedores.txt", "a") do |arquivo|
      arquivo.puts "Empresa: #{nome_empresa} | Vendedor: #{nome_vendedor} | Telefone: #{telefone_empresa} | E-mail: #{email_empresa}"
    end
    puts "Fornecedor #{nome_empresa} cadastrado!"
  end

  def listar_fornecedores
    if File.exist?("fornecedores.txt") && !File.zero?("fornecedores.txt")
      File.open("fornecedores.txt", "r") do |arquivo|
        arquivo.each_line do |linha|
          puts linha
        end
      end
    else
      puts "Cadastro de fornecedores vazio!"
      puts "Cadastrar novo fornecedor?"
      puts "1 - Sim | Enter - Sair"
      opcao = gets.chomp
      if opcao == '1'
        cadastrar_fornecedor
      else
        puts "Saindo..."
        return
      end
    end
  end

  def remover_fornecedor
    puts "Remover fornecedor"

    if File.exist?("fornecedores.txt") && !File.zero?("fornecedores.txt")
      fornecedores = File.readlines("fornecedores.txt")

      fornecedores.each_with_index do |fornecedor, indice|
        puts "Fornecedor: #{indice + 1}: #{fornecedor}"
      end

      puts "Qual fornecedor remover?"
      puts "Digite o número | Enter - Sair"
      escolha = gets.chomp.to_i - 1

      if escolha >= 0 && escolha < fornecedores.size
        puts "Deseja mesmo remover?"
        puts "! - Sim | Enter - Sair"
        opcao_remover = gets.chomp
        if opcao_remover == '1'
          fornecedores.delete_at(escolha)

          File.open("fornecedores.txt", "w") do |arquivo|
            arquivo.puts(fornecedores)
          end

          puts "Fornecedor removido!"
        else
          puts "Saindo..."
          return
        end
      else
        puts "Escolha inválida!"     
      end
    else
      puts "Nenhum fornecedor cadastrado!"
      puts "Cadastrar novo fornecedor?"
      puts "1 -Sim | Enter - Sair"
      opcao = gets.chomp
      if opcao == '1'
        cadastrar_fornecedor
      else
        puts "Saindo..."
        return
      end
    end
  end

end

