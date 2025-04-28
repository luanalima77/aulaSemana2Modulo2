CREATE TABLE alunos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  turma TEXT NOT NULL,
  curso TEXT NOT NULL,
  data_nascimento DATE,
  nacionalidade TEXT NOT NULL
);

CREATE TABLE cursos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  duracao_anos INT,
  tipo_curso TEXT NOT NULL
);

CREATE TABLE matriculas (
  id SERIAL PRIMARY KEY,
  aluno_id INT REFERENCES alunos(id) ON DELETE CASCADE,
  curso_id INT REFERENCES cursos(id) ON DELETE CASCADE,
  data_matricula DATE DEFAULT CURRENT_DATE
);


INSERT INTO alunos (nome, turma, curso, data_nascimento, nacionalidade)
VALUES ('Nicolli Venino', '1B', 'Engenharia da Computação', '2003-05-10', 'Brasileira'),
('Sarah Duarte', '1B', 'Ciência da Computação', '2002-05-10', 'Brasileira'),
('Reimar Filho', '1B', 'Engenharia da Computação', '2004-05-10', 'Brasileiro'),
('Paulo Vitor', '1B', 'Sistemas de Informação', '2007-05-10', 'Brasileiro'),
('Breno Silva', '1B', 'Ciência da Computação', '2006-05-10', 'Brasileiro'),
('Luiz Hinuy', '1B', 'Ciência da Computação', '2003-05-11', 'Brasileiro'),
('Felipe Neves', '1B', 'Engenharia de Software', '2003-05-11', 'Brasileiro'),
('Eduardo Jesus', '1B', 'Engenharia da Computação', '2003-05-12', 'Brasileiro'),
('Carlos Eduardo Quaglia', '1B', 'Ciência da Computação', '2003-05-15', 'Brasileiro'),
('Guilherme Schmidt', '1B', 'Engenharia da Computação', '2004-05-20', 'Brasileiro');


INSERT INTO cursos (nome, duracao_anos, tipo_curso)
VALUES ('Engenharia da Computação', 4, 'Bacharelado'),
       ('Engenharia de Software', 4, 'Bacharelado'),
       ('Ciência da Computação', 4, 'Bacharelado'),
       ('Sistemas de Informação', 4, 'Bacharelado');

INSERT INTO matriculas (aluno_id, curso_id)
VALUES (1, 1),
       (2, 3),
       (3, 1),
       (4, 4),
       (5, 3),
       (6, 3),
       (7, 2),
       (8, 1),
       (9, 3),
       (10, 1);

SELECT a.nome AS aluno, c.nome AS curso, m.data_matricula
FROM matriculas m
JOIN alunos a ON m.aluno_id = a.id
JOIN cursos c ON m.curso_id = c.id;