# Sistema de Gerenciamento de Mercadinho

	Este é um sistema robusto de gerenciamento de mercadinho, desenvolvido em Ruby, que oferece controle total sobre o estoque, cadastro de produtos, registro de vendas, gestão de clientes, entre outras funcionalidades. A aplicação visa otimizar as operações de pequenos mercados, fornecendo um sistema fácil de usar e eficiente.
	
## Funcionalidades
### 1. Cadastro de Produtos

   - **Produtos**: Permite o cadastro de produtos com informações como nome, preço, categoria (alimentos, bebidas, limpeza, etc.), quantidade em estoque e código do produto.
   - **Fornecedores**: Armazena informações sobre fornecedores para reposição de mercadorias, ajudando no controle de compras.

#### 2. Gestão de Estoque

   - **Entrada de Produtos**: Registra a entrada de novos produtos no estoque, aumentando as quantidades existentes.
   - **Saída de Produtos**: Atualiza automaticamente o estoque quando os produtos são vendidos.
   - **Alerta de Baixo Estoque**: Gera notificações quando a quantidade de um produto está abaixo do limite configurado, evitando a falta de mercadorias.

### 3. Vendas

   - **Registro de Vendas**: Cada venda é registrada detalhadamente, incluindo os produtos vendidos, suas quantidades, o valor total da compra e o tipo de pagamento.
   - **Pagamento**: Suporte a múltiplos tipos de pagamento, como dinheiro, cartão e Pix.
   - **Histórico de Vendas**: Oferece um histórico completo das vendas, permitindo o acompanhamento diário, semanal ou mensal.

### 4. Gestão de Clientes

   - **Cadastro de Clientes**: Permite cadastrar informações como nome, telefone, email, etc., útil para promoções ou programas de fidelidade.
   - **Histórico de Compras**: Relaciona cada cliente com suas compras anteriores, permitindo um melhor atendimento e promoções personalizadas.

### 5. Relatórios

   - **Vendas Diárias/Semanais/Mensais**: Gera relatórios financeiros detalhados para análise de desempenho em diferentes períodos.
   - **Produtos Mais Vendidos**: Identifica os produtos com maior demanda, auxiliando no planejamento de compras.
   - **Relatório de Estoque**: Permite verificar o nível de estoque em qualquer momento, facilitando o controle e a reposição de mercadorias.

### 6. Autenticação e Permissões

   - **Login de Funcionários**: Sistema de autenticação que diferencia o nível de acesso para administradores, caixas e estoquistas.
   - **Controle de Acesso**: Funcionalidades restritas a diferentes perfis, garantindo maior segurança no sistema.

### 7. Gestão Financeira

   - **Contas a Pagar e Receber**: Registra despesas com fornecedores e controla os recebimentos das vendas.
   - **Fechamento de Caixa**: Realiza o fechamento diário do caixa, registrando o saldo e gerando relatórios de movimentação financeira.

## Como Usar

**1 Instalação:**
  - Clone o repositório

```
    bash

    git clone https://github.com/usuario/sistema-gerenciamento-mercadinho.git
```

  - Navegue até o diretório:
```
    bash

    cd sistema-gerenciamento-mercadinho
```

   - Certifique-se de ter o Ruby instalado.
   
**2 Execução**:

   - Inicie o sistema executando o arquivo principal:

```
   bash

   ruby mercadinho.rb
```
  - O sistema apresentará um menu com opções para cadastro, vendas, relatórios, entre outros.

## Exemplo de Uso
### Cadastro de Produtos
```
   bash

   Nome: Arroz
   Preço: 5.99
   Categoria: Alimentos
   Quantidade: 50
   Código: 12345
```
### Registro de Vendas
```
   bash

    Produto: Arroz
    Quantidade: 2
    Preço Total: 11.98
    Tipo de Pagamento: Cartão
```
### Relatório de Vendas
```
    bash

    Relatório de Vendas - Semana 36
    - Total de Vendas: R$ 1200,00
    - Produtos Mais Vendidos: Arroz, Feijão
```
### Estrutura do Projeto

  - **app.rb**: Arquivo principal que contém o fluxo da aplicação.
  - **produtos.txt**: Arquivo para armazenar os dados dos produtos.
  - **vendas.txt**: Armazena o histórico de vendas.
  - **clientes.txt**: Dados dos clientes cadastrados para promoções e fidelidade.

### Tecnologias Utilizadas

  - **Linguagem de programação**: Ruby
  - **Sistema de controle de versão**: Git
  - **Execução**: Linha de comando (CLI)

## Contribuições

Contribuições são bem-vindas! Para contribuir, siga os passos abaixo:

   - Faça um fork do repositório.
   - Crie uma branch para sua funcionalidade (git checkout -b feature/MinhaFuncionalidade).
   - Commit suas alterações (git commit -m 'Adiciona nova funcionalidade').
   - Envie para a branch original (git push origin feature/MinhaFuncionalidade).
   - Abra um Pull Request.

## Licença

   Este projeto está licenciado sob a Licença MIT - consulte o arquivo LICENSE para mais detalhes.
