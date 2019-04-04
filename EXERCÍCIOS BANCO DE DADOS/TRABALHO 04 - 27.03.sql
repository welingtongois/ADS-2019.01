
/*1. Exibir os nomes dos livros, que custam mais de R$ 100,00
mostrando o as iniciais em maiúsculo e o valor.

2. Mostrar qual é o livro mais caro, mostrando somente o valor.
3. Contar quantas editoras existem.
4. Mostrar o nome do livro, e data de lançamento no formato
DD/MM/YYYY dos livros da editora com número 1.
5. Mostrar quantos autores existem no banco de dados.
6. Mostar os nomes dos livros em maiúsculo.
7. Montar a seguinte expressão: “O livro XXX tem YYY caracteres”,
onde XXX será o nome do livro e YYY a quantidade de caracteres
que este livro tem.*/

--1
select Initcap(liv_titulo),liv_preco from livro where liv_preco>100

--2
select max(liv_preco) from livro

--3
select count(edi_codigo) as numero_editoras from editora 

--4
select liv_titulo,to_char(liv_lancamento, 'DD/MM/YYYY') from livro where edi_codigo = 1

--5
select count(aut_matricula) as numero_autores from autor

--6
select Upper(liv_titulo),Initcap(liv_titulo) from livro

--7
select 'O livro '||liv_titulo||' tem '||LENGTH(liv_titulo)|| ' caracteres' as frase from livro