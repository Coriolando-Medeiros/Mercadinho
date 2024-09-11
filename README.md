## Sistema de Gerenciamento de Comércio de Pequeno Porte

Este projeto foi desenvolvido com foco no aprendizado, utilizando arquivos de texto (.txt) para armazenar e gerenciar dados relacionados a produtos, clientes, e vendas. Embora em sistemas mais complexos o uso de um banco de dados seja a escolha mais adequada, a opção por arquivos de texto aqui foi intencional para fins didáticos, permitindo explorar conceitos fundamentais de manipulação de arquivos em Ruby.

Embora o uso de arquivos de texto atenda bem ao propósito educacional deste projeto, reconheço que, para aplicações mais complexas, essa abordagem apresenta limitações em termos de escalabilidade, eficiência e segurança. Em um ambiente de produção, a escolha ideal seria a utilização de um banco de dados, capaz de lidar com volumes maiores de informações de maneira mais eficiente e segura.

A escolha de simplificar o armazenamento dos dados foi feita com o intuito de fortalecer o entendimento dos conceitos básicos, mantendo a clareza e a acessibilidade do código para iniciantes, mas sempre com a visão de que soluções mais robustas, como a adoção de bancos de dados, são essenciais em sistemas profissionais.

### Estrutura dos Arquivos

 - app.rb: Arquivo principal que inicializa o sistema e chama o menu de login.
 - login.rb: Responsável pela autenticação dos usuários.
 - admin.rb: Fornece o menu para o administrador, com opções de gerenciamento de estoque e fornecedores.
 - estoque.rb: Gerencia o estoque e o histórico de recebimentos.
 - produto.rb: Responsável pelo cadastro, listagem e remoção de produtos e fornecedores.
 - vendas.rb: Gerencia o processo de vendas e o histórico de vendas realizadas.

### Funcionalidades
**1. Autenticação de Usuários**

O sistema possui uma autenticação baseada em arquivo (login.txt), onde o usuário e a senha são verificados. Dependendo do tipo de usuário, o menu exibido será diferente:

 - Administrador: Acesso a funcionalidades de controle de estoque, fornecedores e histórico de vendas.
 - Usuário Comum: Acesso ao menu de vendas.

**2. Menu de Administrador**

O administrador possui as seguintes opções:

 - **Menu Fornecedor**:
  - Cadastrar fornecedor
  - Listar fornecedores
  - Remover fornecedore

 - **Menu Produto**:
  - Cadastrar produto
  - Listar produtos
  - Remover produto

 - **Menu Estoque**:
  - Cadastrar recebimento de produtos
  - Ver histórico de recebimentos
  - Visualizar o estoque.

### 3. Menu de Vendas

O usuário comum (não administrador) pode:

 - **Realizar vendas**: Selecionar produtos e registrar a venda.
 - **Histórico de vendas**: Ver todas as vendas realizadas.

### 4. Gerenciamento de Produtos

O sistema permite que o administrador cadastre, liste e remova produtos e fornecedores, mantendo o estoque atualizado e garantindo que o inventário esteja sempre correto.
### 5. Gerenciamento de Estoque

Além do cadastro de novos produtos, o sistema também gerencia recebimentos de produtos, permitindo que o estoque seja atualizado à medida que novas entregas chegam ao comércio. Um histórico de recebimentos é mantido para consulta.
### 6. Histórico de Vendas e Estoque

O sistema mantém um registro completo de todas as vendas realizadas e dos recebimentos de produtos. Esses registros podem ser visualizados a qualquer momento.

## Como Executar

  1.  Certifique-se de que todos os arquivos estão na mesma pasta.

  2.  No terminal, execute o arquivo app.rb:

```
    bash

    ruby app.rb
```

  3. O sistema exibirá um menu de login, onde o usuário deverá inserir suas credenciais.

  4. Após a autenticação, o sistema exibirá as opções de acordo com o tipo de usuário.

## Estrutura de Arquivos

 - **login.txt**: Contém o nome de usuário e senha no formato usuario:senha.
 - **estoque.txt**: Registra os produtos cadastrados no estoque.
 - **fornecedores.txt**: Armazena as informações dos fornecedores cadastrados.
 - **entregas.txt**: Contém o histórico de recebimentos de produtos.

### Tecnologias Utilizadas

 - Linguagem de Programação: Ruby

### Licença

Este projeto é licenciado sob a licença MIT.
