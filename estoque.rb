require_relative 'produto'

class Estoque

  def initialize(arquivo = nil)
    @arquivo = arquivo
    @entregas = []
    
  end

  def adicionar_recebimento
    puts "Adicionar produto"
    print "Fornecedor: "
    fornencedor = gets.chomp.capitalize
    print "Entregador: "
    entregador = gets.chomp.capitalize
    print "Vendedor: "
    vendedor = gets.chomp.capitalize
    print "Quantidade de itens da entrega: "
    itens = gets.chomp.to_i
    hora = Time.now.strftime("%H:%M:%S")
    data = Time.now.strftime("%d-%m-%Y")
    contador = 0
    produto = Produto.new
    until contador == itens
      produto.cadastrar_produto
      contador += 1
    end

    File.open("entregas.txt", "a") do |arquivo|
      arquivo.puts "Fornecedor: #{fornencedor} | Entregador: #{entregador} | Vendedor: #{vendedor} | Data: #{data} | Hora: #{hora}"
    end
    puts "Atualizado estoque #{data} #{hora}"
  end

  def ver_historico_recebimentos
    if File.exist?("entregas.txt") && !File.zero?("entregas.txt")
      File.open("entregas.txt", "r") do |arquivo|
        arquivo.each_line do |linha|
          puts linha
        end
      end
    end
  end

  def ver_estoque
    if File.exist?("estoque.txt") && !File.zero?("estoque.txt")
      File.open("estoque.txt", "r") do |arquivo|
        arquivo.each_line do |linha|
          puts linha
        end
      end
    end
  end
    
end

estoque = Estoque.new
estoque.adicionar_recebimento
#estoque.ver_estoque
#estoque.ver_historico_recebimentos