# 📚 Banco de Dados de Livros – Projeto MySQL

Banco de dados de livros. Curso de MySQL pela Bóson Treinamentos em Tecnologia. EN: Book database. MySQL course.

Este projeto consiste na criação e manipulação de um banco de dados relacional para gerenciar livros, autores, editoras e assuntos. Ele foi desenvolvido com foco em aprendizado prático de SQL, incluindo comandos de **CRUD**, **joins**, **funções agregadas**, **subconsultas** e muito mais.

---

## 🏗️ Estrutura do Banco de Dados

O banco foi nomeado como `db_MeusLivros` e é composto por diversas tabelas relacionadas:

- `tbl_Autores`: Cadastro de autores com nome e sobrenome.
- `tbl_Editoras`: Editoras responsáveis pela publicação dos livros.
- `tbl_Assuntos`: Tópicos ou áreas temáticas dos livros.
- `tbl_Livros`: Informações bibliográficas dos livros.
- `tbl_LivrosAutores`: Relacionamento muitos-para-muitos entre livros e autores.
- `tbl_Emprestimos`: Tabela temporária para controle de empréstimos (criada e excluída no projeto).

---

## 🛠️ Recursos Utilizados

- **MySQL** como sistema de gerenciamento de banco de dados (SGBD)
- **Workbench** ou linha de comando para execução dos scripts SQL
- Uso de **chaves primárias e estrangeiras**
- Comandos de **manipulação de dados** (INSERT, UPDATE, DELETE)
- **Consultas com JOIN**, filtros, ordenações e **subconsultas**
- Utilização de **funções matemáticas**, **agregadas** e **de formatação**

---

## 📘 Funcionalidades Implementadas

✅ Criação de banco e tabelas com relacionamentos  
✅ Inserção de dados com `INSERT` em lote  
✅ Consultas simples e avançadas com `SELECT`  
✅ Atualizações com `UPDATE`  
✅ Exclusões com `DELETE` e `TRUNCATE`  
✅ Relatórios usando `GROUP BY`, `HAVING`, `ORDER BY`, `LIMIT`, `BETWEEN` e `LIKE`  
✅ Índices com `CREATE INDEX` e `EXPLAIN`  
✅ Operações matemáticas, conversões e funções como `ROUND()`, `SQRT()`, `POW()`, `HEX()`, `MOD()`, `PI()`  
✅ Comandos de **junções internas e externas (INNER, LEFT, RIGHT, CROSS)**  
✅ **UNIONs** com filtros e cálculos de preço ajustado  
✅ Cálculo de estatísticas: média de páginas, soma de preços, total de registros etc.

---

## 📊 Exemplos de Consultas

- Listar todos os livros e seus respectivos autores
- Exibir livros com preço maior que R$ 200,00 e aplicar desconto
- Buscar livros publicados por uma editora específica
- Consultar total de páginas por assunto
- Obter livros mais caros e mais baratos com `LIMIT`
- Exibir editoras sem nenhum livro publicado (LEFT JOIN com IS NULL)
- Criar índices para otimização de busca por nome da editora

---

## 📌 Objetivos do Projeto

- Praticar os principais comandos SQL em um projeto realista
- Compreender os relacionamentos entre tabelas (1:N e N:N)
- Aprender a modelar e consultar dados de forma eficiente
- Aplicar lógica de programação em consultas com filtros complexos

---

## 💡 Possíveis Evoluções

- Criação de **stored procedures** para empréstimos e devoluções  
- Interface com aplicação (PHP, Python, Java)  
- Exportação de relatórios em formatos como PDF ou CSV  
- Controle de usuários e permissões (GRANT, REVOKE)  
- Implementação de triggers para controle de integridade

---

## 👨‍💻 Autor

Desenvolvido por **Piter Gomes**, como parte dos estudos em bancos de dados relacionais e linguagem SQL.

---

## 🧪 Como Usar

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/db-meus-livros.git
Importe o arquivo .sql no seu MySQL local ou servidor. Execute os comandos no MySQL Workbench, DBeaver ou outro cliente de sua preferência.
