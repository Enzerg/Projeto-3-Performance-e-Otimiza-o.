# Projeto 3 — Performance e Otimização SQL 

## 📌 Sobre o projeto

Este projeto foi desenvolvido com o objetivo de praticar, revisar e aprofundar meus conhecimentos em SQL, com foco em **performance e otimização de consultas**.

A proposta foi criar uma tabela de vendas com produtos, preços e quantidades, gerar dados fictícios para preencher essa tabela e comparar o desempenho de uma consulta antes e depois da criação de um índice.

## ⚙️ Etapas do projeto

### 1. Criação e preenchimento da tabela

Criei uma tabela com informações de vendas, incluindo produtos, preços e quantidades.

Para gerar os dados de teste, utilizei `RANDOM()` para criar valores aleatórios e `GENERATE_SERIES()` para inserir um volume maior de registros, simulando uma tabela com milhares de linhas.

### 2. Verificação dos dados

Após preencher a tabela, utilizei consultas com `COUNT()`, `MIN()` e `MAX()` para conferir a quantidade de registros e verificar os valores presentes nos dados.

### 3. Análise de desempenho sem índice

Utilizei `EXPLAIN ANALYZE` para analisar o plano de execução da consulta e observar o tempo gasto, a quantidade de linhas analisadas e o comportamento do banco de dados.

O resultado inicial foi:

| Métrica | Resultado |
|---|---:|
| Tipo de operação | Sequential Scan (`Seq Scan`) |
| Páginas lidas | 212 |
| Linhas descartadas pelo filtro | 29.997 |
| Tempo de execução | 1,364 ms |

Nesse primeiro teste, a consulta foi executada sem um índice para auxiliar na busca dos dados.

### 4. Criação do índice e nova análise

Depois de analisar o primeiro resultado, decidi estudar mais sobre índices. Utilizei o Claude como ferramenta de apoio ao aprendizado, buscando entender os conceitos, em vez de simplesmente pedir que ele fornecesse o código pronto.

A partir desse estudo, criei um índice e executei novamente a consulta para comparar os resultados.

O novo resultado foi:

| Métrica | Resultado |
|---|---:|
| Tipo de operação | Index Only Scan |
| Páginas acessadas | 3 (1 em cache e 2 em disco) |
| Linhas descartadas pelo filtro | Nenhuma |
| Tempo de execução | 0,076 ms |

## 📊 Comparação dos resultados

| Métrica | Sem índice | Com índice |
|---|---:|---:|
| Plano de execução | Seq Scan | Index Only Scan |
| Páginas acessadas | 212 | 3 |
| Linhas descartadas | 29.997 | 0 |
| Tempo de execução | 1,364 ms | 0,076 ms |

Considerando os tempos registrados, a segunda execução foi aproximadamente **18 vezes mais rápida** que a primeira.

## 💡 Aprendizados

Mesmo trabalhando com um volume relativamente pequeno de dados, consegui observar na prática como a criação de um índice pode influenciar o desempenho de uma consulta SQL.

Esse projeto me ajudou a compreender melhor a importância de analisar planos de execução com `EXPLAIN ANALYZE`, observar o comportamento das consultas e testar possíveis melhorias em vez de apenas escrever SQL e presumir que ele está otimizado.

Ainda tenho muito a aprender sobre bancos de dados e otimização, mas esse experimento foi um passo importante para consolidar meus conhecimentos e desenvolver o hábito de investigar o desempenho das minhas consultas.

**Objetivo alcançado:** aprender na prática, comparar resultados e entender melhor como o PostgreSQL executa consultas.
