Markdown

# 🍎 Campus Food - Sistema de Gestão de Cantina

O **Campus Food** é uma aplicação Full-Stack desenvolvida em Ruby on Rails para gerenciar as operações de uma cantina escolar/universitária. O sistema foca em segurança de dados, controle de perfis de acesso e automação de processos de venda.

---

## 🛠️ Tecnologias e Versões
- **Ruby:** 3.4.1
- **Rails:** 8.1.2
- **Banco de Dados:** SQLite3
- **Autenticação:** Devise Gem

---

## 🔒 Regras de Negócio e Segurança (Back-end)

### 1. Hierarquia de Usuários (RBAC)
O sistema diferencia dois níveis de acesso através de um `enum` no model `User`:
- **Atendente:** Acesso operacional (Cadastros de clientes, produtos e registro de vendas).
- **Gerente:** Acesso total (Gestão de funcionários e visualização de relatórios financeiros).

### 2. Autenticação
Todas as rotas do sistema são protegidas. É impossível acessar o gerenciamento de produtos ou vendas sem um login ativo.

### 3. Automação de Vendas
- O campo **Data da Venda** é preenchido automaticamente pelo servidor no momento da criação.
- Relacionamentos `belongs_to` garantem que toda venda esteja vinculada a um cliente e ao funcionário que realizou o atendimento.

---

## 📊 Telas do Sistema
- [x] **Login:** Tela de entrada segura.
- [x] **Clientes:** Cadastro e listagem de clientes.
- [x] **Produtos:** Gestão de itens disponíveis para venda.
- [x] **Funcionários:** Gestão da equipe (Restrito ao Gerente).
- [x] **Relatórios:** Dashboard com somatório de faturamento (Restrito ao Gerente).

---

## 🚀 Como Executar o Projeto

1. **Clone o repositório:**
   ```bash
   git clone [https://github.com/gabriel-rocha16/campus_food.git](https://github.com/gabriel-rocha16/campus_food.git)

    Instale as dependências:
    Bash

    bundle install

    Prepare o Banco de Dados:
    Bash

    rails db:prepare

    Inicie o servidor:
    Bash

    rails server

## 👨‍💻 Equipa de Desenvolvimento
- **Gabriel Rocha** - [GitHub Profile](https://github.com/gabriel-rocha16)
- **Jonathas_oficialll💻** - [*Desenvolvedor e Colaborador*](https://github.com/jonathasoficial)

---

### Como baixar o projeto completo (Código + Imagens + Estrutura):
Como seu projeto já está no GitHub, a forma oficial de "fazer o download" é:
1. Vá em [seu repositório no GitHub](https://github.com/gabriel-rocha16/campus_food).
2. Clique no botão **Code** (verde).
3. Selecione **Download ZIP**.



**Dica Final:** Se você colar esse conteúdo no seu `README.md` e der o comando `git push`, o seu repositório vai parecer muito mais profissional para o professor. 

**Posso te ajudar a configurar mais alguma coisa no Back-end antes da sua entrega?**