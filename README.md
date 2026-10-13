# Projeto-3-Performance-e-Otimização.


Projeto visando aprimorar e relembrar meu aprendizado de sql

Foi criado uma tabela de vendas e preço com produtos e suas quantidades
foi criado numero randomicos para fazer o preenchimento das tabelas usando Random() e generate_series para inflar as tabelas
em seguida foi usado um select para checar os numeros das consulta com count e min e max para saber a quantidade na consulta
depois criei uma consulta com explain analize para ver os valores e a velocidade da consulta para conferir e os resultados foram

|SEQ SCAN                      |
|212 paginas lidas             |
|29,997 linhas desscartadas    |
|1,364 ms de tempo de execução |

isso sem indices após esse resultado eu procurei estudar um pouco utilizando a IA do Claude não para me dar os códigos mas para me ajudar a aprender mais
e ele pediu para mim criar um indice com o mesmo criado o resultado foi de:

|Index Only scan              |
|3 (1 em cache + 2 do disco)  |
|Znenhuma linha descartada    |
|0,076ms de tempo de execução |

e o tempo diminuiu um absurdo apesar do volume baixo de linhas nas tabelas foi um grande avanço.

