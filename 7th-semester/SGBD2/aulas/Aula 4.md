#anotacao
## SQL

**Instrução ALTER TABLE:**
- adicionar um novo atributo
- modificar um atributo existente
- eliminar um atributo da relação

```sql
-- ALTER TABLE <tabela> [tarefa] (informações da tabela)
ALTER TABLE ESTADOS
	ADD (cidade varchar2(10));
```

**Instrução CONSTRAINT:**
```sql
-- CONSTRAINT <nome> PRIMARY KEY (<atributos>)
CREATE TABLE ESTADO (
	sigla varchar(2) NOT NULL,
	nome varchar(20),
	CONSTRAINT ESTADO_PK PRIMARY KEY(sigla)
);
```

**Restrição UNIQUE:**
- requer que cada valor do atributo seja **exclusivo**
- funciona assim como a restrição de **PRIMARY KEY**
- chave candidata ou exclusiva

```sql
CREATE TABLE ESTADO (
	sigla varchar(2) NOT NULL,
	nome varchar(20)
);

ALTER TABLE ESTADO
	ADD CONSTRAINT ESTADO_UK UNIQUE (nome);
```

**Restrição ON DELETE CASCADE:**
- identifica que as tuplas da relação filho também serão apagadas quando a tupla da Relação pai for apagada.

```sql
CREATE TABLE CIDADE (
	idCidade int NOT NULL,
	cidade varchar(40) NOT NULL,
	estado varchar(2),
	CONSTRAINT CIDADE_PK PRIMARY KEY (idCidade)
	CONSTRAINT CIDADE ESTADO_FK FOREIGN KEY (estado)
		REFERENCES ESTADO (sigla) ON DELETE CASCADE
);
```

