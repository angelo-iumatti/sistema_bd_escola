USE bd_sysescola;

CREATE TABLE Alunos (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100),
    tipo_curso VARCHAR(100)
);

CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_curso INT,
    data_matricula DATE,
    tipo_matricula VARCHAR(20),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

CREATE TABLE Secoes (
    id_secao INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    descricao TEXT,
    numero_secao INT,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

CREATE TABLE Exercicios (
    id_exercicio INT PRIMARY KEY AUTO_INCREMENT,
    id_secao INT,
    pergunta TEXT,
    resposta_inicial TEXT,
    FOREIGN KEY (id_secao) REFERENCES Secoes(id_secao)
);

CREATE TABLE Respostas (
    id_resposta INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_exercicio INT,
    resposta_aluno TEXT,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_exercicio) REFERENCES Exercicios(id_exercicio)
);

CREATE TABLE Notas (
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
    id_resposta INT,
    valor_nota DECIMAL(3,2),
    FOREIGN KEY (id_resposta) REFERENCES Respostas(id_resposta)
);