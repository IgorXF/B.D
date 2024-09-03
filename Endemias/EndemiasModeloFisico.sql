CREATE TABLE UnidadeSaude (
	idUnidade INTEGER PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	tipo VARCHAR(50),
	telefone VARCHAR(15),
	IdEndereco INTEGER,
	FOREIGN KEY (IdEndereco) REFERENCES Endereco(IdEndereco)
);

CREATE TABLE Pessoa (
	CPF VARCHAR(11) PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	tipo VARCHAR(50),
	telefone VARCHAR(15),
	idade INTEGER,
	email VARCHAR(100),
	IdEndereco INTEGER,
	FOREIGN KEY (IdEndereco) REFERENCES Endereco(IdEndereco)
);

CREATE TABLE Funcionario (
	IDFunc INTEGER PRIMARY KEY,
	regiaoAtuacao VARCHAR(50),
	relatorioDiario VARCHAR(500),
	IdEndereco INTEGER,
	FOREIGN KEY (IdEndereco) REFERENCES Endereco(IdEndereco),
	CPF VARCHAR(11),
	FOREIGN KEY (CPF) REFERENCES Pessoa(CPF),
	idUnidade INTEGER,
	FOREIGN KEY (idUnidade) REFERENCES UnidadeSaude(idUnidade)
);

CREATE TABLE Medico (
	CRM VARCHAR(10) PRIMARY KEY,
	IDFuncionario INTEGER,
	especialidade VARCHAR(100),
	FOREIGN KEY (IDFuncionario) REFERENCES Funcionario(IDFunc)
);

CREATE TABLE AgenteSaude (
	IDAgenteS INTEGER PRIMARY KEY,
	IDFuncionario INTEGER,
	FOREIGN KEY (IDFuncionario) REFERENCES Funcionario(IDFunc)
);

CREATE TABLE AgenteCombate (
	IDAgenteC INTEGER PRIMARY KEY,
	IDFuncionario INTEGER,
	FOREIGN KEY (IDFuncionario) REFERENCES Funcionario(IDFunc)
);

CREATE TABLE AgentePrevencao (
	IDAgenteP INTEGER PRIMARY KEY,
	IDFuncionario INTEGER,
	FOREIGN KEY (IDFuncionario) REFERENCES Funcionario(IDFunc)
);

CREATE TABLE Notificacao (
	ID_Notificacao INTEGER PRIMARY KEY,
	DataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	tipo VARCHAR(50),
	idUnidade INTEGER,
	CPF VARCHAR(11),
	FOREIGN KEY (IDUnidade) REFERENCES UnidadeSaude(idUnidade),
	FOREIGN KEY (CPF) REFERENCES Pessoa(CPF)
);

CREATE TABLE Endereco (
	IdEndereco INTEGER PRIMARY KEY,
	estado VARCHAR(50),
	cidade VARCHAR(50),
	cep VARCHAR(15),
	rua varchar(50),
	bairro VARCHAR(50),
	numero VARCHAR(25)
);

CREATE TABLE Consulta (
	id_consulta INTEGER PRIMARY KEY,
	crm VARCHAR,
	FOREIGN KEY (crm) REFERENCES Medico(crm),
	CPF VARCHAR(11),
	FOREIGN KEY (CPF) REFERENCES Pessoa(CPF),
	tratamento VARCHAR(500),
	diagnostico VARCHAR(500),
	doenca VARCHAR(100)
);

CREATE TABLE Laboratorio (
	id_Laboratorio INTEGER PRIMARY KEY,
	nome VARCHAR(50),
	telefone VARCHAR(50),
	email VARCHAR(50),
	idUnidade INTEGER,
	FOREIGN KEY (idUnidade) REFERENCES UnidadeSaude(idUnidade),
	IdEndereco INTEGER,
	FOREIGN KEY (IdEndereco) REFERENCES Endereco(IdEndereco)
);

CREATE TABLE Vacinacao(
	id_Vacn INTEGER PRIMARY KEY,
	idVac INTEGER,
	FOREIGN KEY (idVac) REFERENCES Vacina(idVac),
	dataInicio VARCHAR(20),
	dataFim VARCHAR(20),
	idUnidade INTEGER,
	FOREIGN KEY (idUnidade) REFERENCES UnidadeSaude(idUnidade)
);	

CREATE TABLE Vacina(
	idVac INTEGER PRIMARY KEY,
	nome VARCHAR(20),
	fabricante VARCHAR(30),
	idUnidade INTEGER,
	FOREIGN KEY (idUnidade) REFERENCES UnidadeSaude(idUnidade)
);

CREATE TABLE Relata(
	resultadoExame VARCHAR(500),
	ID_Notificacao INTEGER,
	FOREIGN KEY (ID_Notificacao) REFERENCES Notificacao(ID_Notificacao),
	id_Laboratorio INTEGER,
	FOREIGN KEY (id_Laboratorio) REFERENCES Laboratorio(id_Laboratorio)
);

CREATE TABLE EXAME(
	ID_Exame INTEGER,
	Resultado VARCHAR(500),
	Tipo VARCHAR(500),
	CPF VARCHAR(11),
	FOREIGN KEY (CPF) REFERENCES Pessoa(CPF),
	id_Laboratorio INTEGER,
	FOREIGN KEY (id_Laboratorio) REFERENCES Laboratorio(id_Laboratorio)
);
