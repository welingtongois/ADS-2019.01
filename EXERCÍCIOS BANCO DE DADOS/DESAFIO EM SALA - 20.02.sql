--CRIANDO A TABELA TB_PROJETO (NÃO TEM DEPENDÊNCIA COM NENHUMA TABELA NO SEU SCRIPT)

CREATE TABLE tb_projeto
(cd_projeto INTEGER NOT NULL,
nm_projeto VARCHAR2(300) NOT NULL,
dt_ini_projeto DATE NOT NULL,
dt_fin_projeto DATE NOT NULL,
    CONSTRAINT tb_projeto_PK PRIMARY KEY (cd_projeto)
);

--CRIANDO A TABELA TB_DEPARTAMENTO (NÃO TEM DEPENDÊNCIA COM NENHUMA TABELA NO SEU SCRIPT)

CREATE TABLE tb_departamento
(cd_departamento INTEGER NOT NULL,
nm_dapartamento VARCHAR2(250),
    CONSTRAINT tb_departamento_PK PRIMARY KEY (cd_departamento)
);

----CRIANDO A TABELA TB_PROJETO_EMPREGADO (DEPENDENCIA COM TB_PROJETO)
CREATE TABLE tb_projeto_empregado
(cd_projeto INTEGER NOT NULL,
cd_empregado INTEGER NOT NULL,
    CONSTRAINT tb_projeto_empregado_PK PRIMARY KEY (cd_projeto,cd_empregado)
);

--CRIANDO A TABELA TB_EMPREGADO (DEPENDENCIA COM TB_DEPATARTAMENTO)

CREATE TABLE tb_empregado
(cd_empregado integer NOT NULL,
nm_empregado varchar2(200) NOT NULL,
dt_nasc_empregado date,
nm_end_empregado  varchar2(300),
cd_departamento   integer NOT NULL,
    CONSTRAINT empregado_cdempregado_PK PRIMARY KEY (cd_empregado)
);
------------------------------------------------------
--INSERINDO CHAVES ESTRANGEIRAS: TB_PROJETO_EMPREGADO
------------------------------------------------------

ALTER TABLE tb_projeto_empregado
ADD CONSTRAINT proj_empr_cdprojeto_FK
  FOREIGN KEY (cd_projeto)
  REFERENCES tb_projeto(cd_projeto);
  
ALTER TABLE tb_projeto_empregado
ADD CONSTRAINT proj_emp__cdempregado_FK
  FOREIGN KEY (cd_empregado)
  REFERENCES tb_empregado(cd_empregado);
  
------------------------------------------------------
--INSERINDO CHAVES ESTRANGEIRAS: TB_EMPREGADO
------------------------------------------------------
ALTER TABLE tb_empregado
ADD CONSTRAINT emp_depto_cddepartamento_FK
  FOREIGN KEY (cd_departamento)
  REFERENCES tb_departamento(cd_departamento);

------------------------------------------------------
--VALIDAÇÃO INI_PROJETO
------------------------------------------------------
 ALTER TABLE tb_projeto
 ADD CONSTRAINT dt_ini_projeto_validacao 
 CHECK (dt_ini_projeto<dt_fin_projeto)
 
 ------------------------------------------------------
--VALIDAÇÃO FIN_PROJETO
------------------------------------------------------
 ALTER TABLE tb_projeto
 ADD CONSTRAINT dt_fim_projeto_validacao 
 CHECK (dt_fin_projeto>dt_ini_projeto)

