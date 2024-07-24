use BancoDados

/*CREATE TABLE Sala(
    IdSala INT NOT NULL PRIMARY KEY,
    Nome VARCHAR(60) NOT NULL,
    Capacidade INT NOT NULL);*/

-- Declarando os atributos
--INSERT INTO Sala (IDSala, Nome, Capacidade) VALUES (1, 'Sala de TI', 20);
 
-- Não declarando atributos
--INSERT INTO Sala VALUES (2, 'Sala de Reunião', 10);
 
-- Inserindo várias linhas
--INSERT INTO Sala VALUES (3, 'Sala de palestras 1', 30), (4, 'Sala de aula', 15);

/*-- Recebendo todos os valores
SELECT * FROM Sala;
 
-- Recebendo a Descrição e a Capacidade
SELECT Nome, Capacidade FROM Sala;

CREATE TABLE Evento (
  IDEvento INT NOT NULL PRIMARY KEY,
  IDSala INT NOT NULL FOREIGN KEY REFERENCES Sala(IDSala),
  Descricao VARCHAR(100) NOT NULL,
  DtHrInicio DATETIME NOT NULL,
  DtHrFim DATETIME NOT NULL
);


INSERT INTO Evento VALUES (
    1,
    1,
    'Aula de IoT',
    '26/03/2022 19:00',
    '26/03/2022 22:30'
);*/

/*INSERT INTO Evento VALUES (
    (SELECT MAX(IDEvento) FROM Evento)+1,
    1,
    'Aula de Estrutura de Dados',
    '28/03/2022 21:15',
    '26/03/2022 22:30'
);*/


/*CREATE TABLE Equipamento (
  IDEquipamento INT NOT NULL PRIMARY KEY,
  IDSala INT NOT NULL FOREIGN KEY REFERENCES Sala(IdSala),
  Nome VARCHAR(100) NOT NULL,
  Tipo VARCHAR(100) NOT NULL)*/


/*CREATE TABLE Pessoa (
  IDPessoa INT NOT NULL PRIMARY KEY,
  Nome VARCHAR(100) NOT NULL,
  Categoria VARCHAR(20) NOT NULL
);*/



/*CREATE TABLE EventoEquipamento (
  IDEvEq INT NOT NULL PRIMARY KEY,
  IDEvento INT NOT NULL FOREIGN KEY REFERENCES Evento(IdEvento),
  IDEquipamento INT NOT NULL FOREIGN KEY REFERENCES Equipamento(IdEquipamento),
);*/

/*CREATE TABLE EventoPessoa (
  IDEvPe INT NOT NULL PRIMARY KEY,
  IDEvento INT NOT NULL FOREIGN KEY REFERENCES Evento(IdEvento),
  IDPessoa INT NOT NULL FOREIGN KEY REFERENCES Pessoa(IDPessoa),
  PapelEvento VARCHAR(75) NOT NULL,
  Presenca bit NOT NULL
);*/

-- Inserindo valores sem saber o último índex
/*INSERT INTO Evento VALUES (
(SELECT MAX(IDEvento) FROM Evento)+1,
1,
'Aula de Estrutura de Dados',
'28/03/2022 21:15',
'26/03/2022 22:30'
);*/

/*CREATE TABLE Equipamento (
IDEquipamento INT NOT NULL PRIMARY KEY,
IDSala INT FOREIGN KEY REFERENCES Sala(IDSala),
Nome VARCHAR(50) NOT NULL,
Tipo VARCHAR(100)
);*/

/*INSERT INTO Equipamento VALUES (
(SELECT IsNull(MAX(IDEquipamento), 0) FROM Equipamento ) + 1,
Null,
'Notebook HP',
'Informática'
);*/

/*CREATE TABLE EventoEquipamento (
IDEventoEquipamento INT NOT NULL PRIMARY KEY,
IDEvento INT NOT NULL FOREIGN KEY REFERENCES Evento(IDEvento),
IDEquipamento INT NOT NULL FOREIGN KEY REFERENCES Equipamento(IDEquipamento)
);*/

