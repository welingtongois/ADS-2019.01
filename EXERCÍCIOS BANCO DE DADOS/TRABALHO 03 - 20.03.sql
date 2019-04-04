create table editora
(edi_codigo number (10),
edi_nome varchar2(70) not null);

create table autor
(aut_matricula number (10),
aut_nome varchar2 (50) not null,
aut_cpf varchar2(12) not null,
aut_dtnasc date not null,
aut_nascionalidade varchar2(30));

create table livro
(liv_codigo number(10),
liv_titulo varchar2(70),
liv_preco number(7,2),
liv_lancamento date,
edi_codigo number(10),
ass_sigla char(3) not null);

create table assunto
(ass_sigla char(3),
ass_descricao varchar2 (20));

alter table editora
add(constraint editora_edi_codigo_pk primary key(edi_codigo));

alter table livro
add (constraint livro_liv_codigo_pk primary key (liv_codigo));

alter table autor
add(constraint autor_aut_matricula_pk primary key (aut_matricula));

alter table assunto
add(constraint assunto_ass_sigla_pk primary key(ass_sigla));


alter table livro
add(constraint livro_edi_codigo_fk foreign key(edi_codigo) references editora(edi_codigo));


alter table livro
add (constraint livro_ass_sigla_fk foreign key (ass_sigla) references assunto(ass_sigla));

create table escreve
(liv_codigo number(10),
aut_matricula number (10),
constraint escreve_liv_aut_pk primary key(liv_codigo,aut_matricula),
constraint escreve_liv_codigo_fk foreign key (liv_codigo) references livro (liv_codigo),
constraint escreve_liv_aut_matricula_fk foreign key (aut_matricula)
references autor(aut_matricula));

--------------------------------------------------------------------------------------------
-- insert
--------------------------------------------------------------------------------------------
--01INSERT TABLE assunto

insert into assunto(ass_sigla,ass_descricao) values
('BAN','Banco');
insert into assunto(ass_sigla,ass_descricao) values
('PRO','Programação');
insert into assunto(ass_sigla,ass_descricao) values
('RED','Redes');
insert into assunto(ass_sigla,ass_descricao) values
('SIS','SO');

--02INSERT TABLE EDITORA

insert into editora(edi_codigo,edi_nome) values
(1,'Mirandela');
insert into editora(edi_codigo,edi_nome) values
(2,'Editora Via Norte');
insert into editora(edi_codigo,edi_nome) values
(3,'Editora Ilhas Tijucas');
insert into editora(edi_codigo,edi_nome) values
(4,'Maria José');


--03INSERT TABLE LIVRO
insert into livro(liv_codigo,liv_titulo,liv_preco,liv_lancamento,edi_codigo,ass_sigla) values
(1,'banco de dados para web ',32.2,DATE  '1999-01-10',1,'BAN');
insert into livro(liv_codigo,liv_titulo,liv_preco,liv_lancamento,edi_codigo,ass_sigla) values
(2,'programando em linguagem c  ',30,DATE  '1997-10-01',1,'PRO');
insert into livro(liv_codigo,liv_titulo,liv_preco,liv_lancamento,edi_codigo,ass_sigla) values
(3,'progrmando em linguagem c++',115.5,DATE  '1998-11-01',3,'PRO');
insert into livro(liv_codigo,liv_titulo,liv_preco,edi_codigo,ass_sigla) values
(4,'banco de dados na bioinformática',48,2,'BAN');
insert into livro(liv_codigo,liv_titulo,liv_preco,liv_lancamento,edi_codigo,ass_sigla) values
(5,'redes de computadores',42,DATE  '1996-09-01',2,'RED');

--04INSERT TABLE AUTOR
insert into AUTOR(aut_matricula,aut_nome,aut_cpf,aut_dtnasc) values
(1,'Gobbato',123456789,DATE '2019-03-26');
insert into AUTOR(aut_matricula,aut_nome,aut_cpf,aut_dtnasc) values
(2,'Luiz',123456789,DATE '2019-03-26');
insert into AUTOR(aut_matricula,aut_nome,aut_cpf,aut_dtnasc) values
(3,'Joaquim',123456789,DATE '2019-03-26');
insert into AUTOR(aut_matricula,aut_nome,aut_cpf,aut_dtnasc) values
(4,'Regina',123456789,DATE '2019-03-26');

--05INSERT TABLE ESCREVE
insert into ESCREVE(liv_codigo,aut_matricula) values
(1,1);
insert into ESCREVE(liv_codigo,aut_matricula) values
(2,1);
insert into ESCREVE(liv_codigo,aut_matricula) values
(3,2);
insert into ESCREVE(liv_codigo,aut_matricula) values
(4,3);
insert into ESCREVE(liv_codigo,aut_matricula) values
(5,4);
--------------------------------------------------------------------------------------------
-- questões
--------------------------------------------------------------------------------------------
--02 Selecionar o preço do livro cujo preço seja maior que 50 e a sigla seja BAN

SELECT * FROM LIVRO WHERE LIV_PRECO >50 AND ass_sigla='BAN'

--03 Selecionar o preço do livro cujo preço seja maior que 50 ou o assunto comece com a letra “P

SELECT * FROM LIVRO WHERE LIV_PRECO>50 AND ASS_SIGLA LIKE 'P%' 

--04 Selecionar os livros (todos os campos) cujo lançamento seja Nulo.

SELECT * FROM LIVRO WHERE liv_lancamento IS NULL

--05 Selecionar os títulos do livro cujo título comece com Banco

SELECT * FROM LIVRO WHERE LIV_TITULO LIKE 'banco%'

--06 Selecionar os livros (todos os campos) cujo preço esteja entre 10 e 60

select * from livro where liv_preco >10 and liv_preco<60

--07 Selecionar os livros (todos os campos) cuja sigla seja BAN e PRO

select * from livro where ass_sigla in('BAN','PRO')


--08 Excluir o livro cujo título é Banco de Dados Distribuído ou Banco de Dados para WEB. Somente estas 2 opções devem ser consideradas

alter table escreve
drop constraint escreve_liv_codigo_fk
delete livro where liv_titulo = 'banco de dados para web ';
delete livro where liv_titulo = 'Banco de Dados Distribuído';


--09 Excluir da tabela de livros aqueles que possuem o código maior ou igual a 2, que possuem preço maior que R$ 50,00;
delete livro where liv_codigo >=2 and liv_preco>50

--10 Atualize para zero o preço de todos os livros onde a data de lançamento for nula ou onde seu preço atual for inferior a R$5,00.
update livro set liv_preco = 0 where liv_lancamento is null or liv_preco<5

--11 Excluir todos os livros onde o assunto for diferente de ‘BAN’ ou 'PRO’
delete livro where ass_sigla <> 'BAN' OR ass_sigla<>'PRO'

--12 pós popular a tabela livro, criar uma tabela de “backup”.


insert into livro(liv_codigo,liv_titulo,liv_preco,liv_lancamento,edi_codigo,ass_sigla) values
(1,'banco de dados para web ',32.2,DATE  '1999-01-10',1,'BAN');
insert into livro(liv_codigo,liv_titulo,liv_preco,liv_lancamento,edi_codigo,ass_sigla) values
(2,'programando em linguagem c  ',30,DATE  '1997-10-01',1,'PRO');
insert into livro(liv_codigo,liv_titulo,liv_preco,liv_lancamento,edi_codigo,ass_sigla) values
(3,'progrmando em linguagem c++',115.5,DATE  '1998-11-01',3,'PRO');
insert into livro(liv_codigo,liv_titulo,liv_preco,edi_codigo,ass_sigla) values
(4,'banco de dados na bioinformática',48,2,'BAN');
insert into livro(liv_codigo,liv_titulo,liv_preco,liv_lancamento,edi_codigo,ass_sigla) values
(5,'redes de computadores',42,DATE  '1996-09-01',2,'RED');

create table backup_livro
as select * from livro
