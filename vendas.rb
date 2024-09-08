require 'date'


class Vendas
  def initialize(arquivo_estoque)
    @arquivo_estoque = arquivo_estoque
    @produtos = []
    @total_preco = 0.0
  end

  def iniciar
    while true
      puts "Digite o código do produto ou 0 para sair"
      print "Código do produto: "
      @codigo_produto = gets.chomp.to_i

      break if @codigo_produto == 0

      print "Quantidade: "
      quantidade = gets.chomp.to_i

      produto = buscar_produto(@codigo_produto)

      if produto
        if produto[:quantidade] >= quantidade
          preco_total = produto[:preco] * quantidade
          @total_preco += preco_total
          nova_quantidade = produto[:quantidade] - quantidade
          @produtos << { codigo: @codigo_produto, nome: produto[:nome], preco: produto[:preco], quantidade: quantidade, nova_quantidade: nova_quantidade }
        else
          puts "Quantidade solicitada não disponível. Disponível: #{produto[:quantidade]}"
        end
      else
        puts "Produto não encontrado."
      end
    end

    exibir_resumo
  end

  def historico_vendas
    puts "Histórico de vendas"
    if File.exist?("vendas.txt") && !File.zero?("vendas.txt")
      File.open("vendas.txt", "r") do |arquivo|
        arquivo.each_line do |linha|
          puts linha
        end
      end
    else
      puts "Relatório de vendas inexistente!"
    end
  end

  def preparar_relatorio(nome_arquivo)
    dados = []
    File.open(nome_arquivo, "r") do |arquivo|
      arquivo.each_line do |linha|
        dados << linha.chomp
      end
    end
    dados
  end


  def gerar_relatorio(dados)
    relatorio = []
    hoje = Date.today
    puts "1 - 1 dia"
    puts "2 - 7 dias"
    puts "3 - 30 dias"
    puts "4 - 3 meses"
    puts "5 - 6 meses"
    puts "0 - Sair"
    opcao = gets.chomp.to_i

    if opcao == '1'
      x_dias_antes = hoje - 1
      @dados.each do |linha|
        data_str, evento = linha.split(';')
        data_evento = date.parse(data_str)

        if data_evento >= 1 && data_evento <= hoje
          relatorio << "#{data_evento}: #{evento}"
        end
      end

      relatorio
    end

  end

  

  private

  def buscar_produto(codigo_produto)
    produto = nil
    File.open(@arquivo_estoque, "r") do |file|
      file.each_line do |linha|
        if linha =~ /Código: #{codigo_produto}/
          dados = linha.split('|')
          nome = dados[0].split(':')[1].strip
          preco = dados[1].split(':')[1].strip.to_f
          categoria = dados[2].split(':')[1].strip
          quantidade = dados[3].split(':')[1].strip.to_i
          produto = { nome: nome, preco: preco, quantidade: quantidade }
          break
        end
      end
    end
    produto
  end

  def atualizar_estoque(codigo_produto, nova_quantidade)
    linhas = []
    File.open(@arquivo_estoque, "r") do |file|
      linhas = file.readlines
    end

    File.open(@arquivo_estoque, "w") do |file|
      linhas.each do |linha|
        if linha =~ /Código: #{codigo_produto}/
          linha = linha.sub(/Quantidade: \d+/, "Quantidade: #{nova_quantidade}")
        end
        file.puts linha
      end
    end
  end

  def exibir_resumo
    puts "Resumo da compra:"
    @produtos.each do |produto|
      puts "Nome: #{produto[:nome]} | Preço: #{produto[:preco]} | Quantidade: #{produto[:quantidade]}"
    end
    puts "Total a pagar: R$ #{@total_preco.round(2)}"
    puts "Pagar? 1 - Sim | Enter - Sair"
    escolha = gets.chomp
    if escolha == '1'
      pagamento
    else
      puts "Compras não realizadas"
      puts "Finalizando..."
      return
    end
  end

  def pagamento
    print "Valor recebido: "
    valor_recebido = gets.chomp.to_f
    troco = valor_recebido - @total_preco

    if valor_recebido < @total_preco
      puts "Valor insuficiente"
      puts "Ainda falta #{'%.2f' % -troco}"
      print "Valor adicional: "
      valor_adicional = gets.chomp.to_f
      valor_recebido += valor_adicional
      troco = valor_recebido - @total_preco
    end

    if valor_recebido >= @total_preco
      puts "Seu troco é R$: #{'%.2f' % troco}" if troco > 0
      puts "Pagamento confirmado!"
      puts "Obrigado! Volte sempre."
      @produtos.each do |produto|
        atualizar_estoque(produto[:codigo], produto[:nova_quantidade])
      end

      File.open("vendas.txt", "a") do |arquivo|
        @produtos.each do |produto|
          arquivo.puts "Produto: #{produto[:nome]} | Preço: #{produto[:preco]} | Quantidade: #{produto[:quantidade]}"
        end
        arquivo.puts "Total: R$ #{'%.2f' % @total_preco}"
        arquivo.puts "Data e Hora: #{Time.now.strftime('%d/%m/%Y %H:%M:%S')}"
      end
    else
      puts "Pagamento cancelado. Ainda falta R$: #{'%.2f' % (@total_preco - valor_recebido)}"
    end
  end


end

# Exemplo de uso:
vendas = Vendas.new("estoque.txt")
vendas.iniciar
#vendas.historico_vendas
vendas.ver_historico