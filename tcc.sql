create table usuarios (
	id_usuario INT,
	nome VARCHAR(50),
	sobrenome VARCHAR(50),
	cpf VARCHAR(11),
	data_nascimento DATE,
	email VARCHAR(50),
	PRIMARY KEY (id_usuario)
);

create table login_usuarios (
	id_login_usuario INT,
	id_usuario INT,
	usuario VARCHAR(50),
	senha VARCHAR(50),
	PRIMARY KEY (id_login_usuario),
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

create table endereco (
	id_endereco INT,
	id_usuario INT,
	logradouro VARCHAR(50),
	numero INT,
	complemento VARCHAR(50),
	bairro VARCHAR(50),
	cidade VARCHAR(50),
	estado VARCHAR(2),
	PRIMARY KEY (id_endereco),
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

create table perfil_profissional (
	id_pp INT,
	id_usuario INT,
	PRIMARY KEY (id_pp),
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

create table historico_profissional  (
	id_hp INT,
	id_pp INT,
	nome_empresa VARCHAR(50),
	funcao VARCHAR(50),
	descricao VARCHAR(150),
	data_inicio DATE,
	data_termino DATE,
	PRIMARY KEY (id_hp),
	FOREIGN KEY (id_pp) REFERENCES perfil_profissional(id_pp)
);

create table formacao_profissional (
	id_fp INT,
	id_pp INT,
	nome_instituicao VARCHAR(50),
	curso VARCHAR(50),
	nivel VARCHAR(50),
	data_inicio DATE,
	data_termino DATE,
	PRIMARY KEY (id_fp),
	FOREIGN KEY (id_pp) REFERENCES perfil_profissional(id_pp)
);

create table skill_profissional (
	id_sp INT,
	id_pp INT,
	skill VARCHAR(50),
	PRIMARY KEY (id_sp),
	FOREIGN KEY (id_pp) REFERENCES perfil_profissional(id_pp)
);

create table empresas (
	id_empresa INT,
	nome_exibicao VARCHAR(50),
	nome_fantasia VARCHAR(50),
	cnpj VARCHAR(14),
	email VARCHAR(50),
	cidade VARCHAR(50),
	estado VARCHAR(2),
	PRIMARY KEY (id_empresa)
);

create table vagas (
	id_vaga INT,
	id_empresa INT,
	titulo VARCHAR(50),
    data_criacao DATE,
	data_limite DATE,
	area_atuacao VARCHAR(50),
	faixa_salarial VARCHAR(50),
	tipo_contratacao VARCHAR(50),
    descricao VARCHAR(500),
	PRIMARY KEY (id_vaga),
	FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa)
);

create table login_empresas (
	id_login_empresa INT,
	id_empresa INT,
	usuario VARCHAR(50),
	senha VARCHAR(50),
	PRIMARY KEY (id_login_empresa),
	FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa)
);

create table cadastro_vagas(
	id_cadastro INT,
	id_vaga INT,
	id_usuario INT,
	PRIMARY KEY (id_cadastro),
	FOREIGN KEY (id_vaga) REFERENCES vagas(id_vaga),
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);