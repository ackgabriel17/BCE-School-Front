DROP DATABASE if EXISTS bce_school;

CREATE DATABASE bce_school;

USE bce_school;

CREATE TABLE exercicios(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	titulo VARCHAR(255) NOT NULL,
	descricao TEXT NOT NULL,
	codigo_inicial TEXT NOT NULL
);

CREATE TABLE testes (
	id INT AUTO_INCREMENT PRIMARY KEY,
	exercicio_id INT NOT NULL,
	entrada TEXT NOT NULL,
	saida_esperada TEXT NOT NULL,
	tipo_verifica VARCHAR(50) NOT NULL default 'exata',
	/*on delete cascade faz q caso  exercicio pai do id seja deletado
	tambem é deleta o teste desse exercicio*/
	FOREIGN KEY(exercicio_id)REFERENCES exercicios(id) ON DELETE cascade
);

CREATE TABLE aulas(
	id INT AUTO_INCREMENT PRIMARY KEY,
	titulo VARCHAR(255) NOT NULL,
	video_url VARCHAR(255) NOT NULL,
	conteudo TEXT NOT NULL,
	exercicio_id INT NOT NULL,
	posicao INT NOT NULL,
	FOREIGN KEY (exercicio_id) REFERENCES exercicios(id)
	ON DELETE cascade
);

CREATE TABLE usuarios(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
	senha VARCHAR(255) NOT NULL,
	foto varchar(255) not null default 'default.jpg',
	aula_atual INT NOT NULL DEFAULT 1 
);

INSERT INTO usuarios(nome,email,senha, aula_atual)
VALUES('niger','a@gmail.com','$2y$10$08r2z7HSzUZcHGeH1TGDieW.dKc/LTmu0pHeQ7shjOWcmKglPvie.', 4);

/*INSERT INTO exercicios
(titulo, descricao, codigo_inicial)

VALUES
(
    'Exercício 1 — Hello World',
    'Escreva um programa Java que mostre Hello World.',
    '
    public class Main {
    public static void main(String[] args) {

    }
}'
),
(
    'Exercício 2 — Soma',
    'Leia dois números e mostre a soma deles.',
    '
    import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
    Scanner leitor = new Scanner(System.in);

    }
}'
),
(
    'Exercício 3 — Maior número',
    'Leia dois números e mostre qual é o maior.',
    '
    import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
    Scanner leitor = new Scanner(System.in);

    }
}'
);*/

INSERT INTO exercicios
(titulo, descricao, codigo_inicial)
VALUES

(
    'Hello World',
    'Escreva um programa em Java que mostre a mensagem Hello World na tela.',
    'public class Main {
    public static void main(String[] args) {
        
    }
}'
),

(
    'Calculadora de soma e subtração',
    'Crie um programa que receba dois números e mostre a soma e a subtração entre eles nessa ordem.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Seu código aqui
    }
}'
),

(
    'Maior entre dois números',
    'Crie um programa que receba dois números e mostre qual deles é o maior.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Seu código aqui
    }
}'
);
INSERT INTO testes
(exercicio_id, entrada, saida_esperada,tipo_verifica)
VALUES
(
   1,
   '',
   'Hello World',
   'exato'
),
(
   2,
   '2 3',
   '5
	-1',
   'numeros'
),
(
   2,
	'10 5',
   '15
	5',
   'numeros'
),
(
   2,
   '-2 3',
   '1
	-5',
   'numeros'
),
(	3,
    '2 1',
    '2',
    'numeros'
),
(
    3,
    '10 5',
    '10',
    'numeros'
),
(
    3,
    '-2 -5',
    '-2',
    'numeros'
);
/*INSERT INTO aulas
(titulo, video_url, conteudo, exercicio_id, posicao)
VALUES
(
    'Olá Mundo',
    'https://www.youtube.com/watch?v=QO5ItC3KqJg&list=PLJ0AcghBBWSi6nK2CUkw9ngvwWB1gE8mL&index=5',
    'Aqui você aprenderá como criar seu primeiro programa Java...',
    1,
    1
),
(
    'Soma',
    'https://www.youtube.com/watch?v=BLMu7ebMC1A&list=PLJ0AcghBBWSi6nK2CUkw9ngvwWB1gE8mL&index=6
',
    'Nesta aula você aprenderá como receber valores...',
    2,
    2
),
(
    'Maior número',
    'https://www.youtube.com/watch?v=xO2_XL7k29k&list=PLJ0AcghBBWSi6nK2CUkw9ngvwWB1gE8mL&index=8',
    'Nesta aula você aprenderá como comparar valores...',
    3,
    3
);

SELECT *FROM usuarios;*/

INSERT INTO aulas
(titulo, video_url, conteudo, exercicio_id, posicao)
VALUES

(
    'Introdução ao Java',
    'https://www.youtube.com/watch?v=QO5ItC3KqJg&list=PLJ0AcghBBWSi6nK2CUkw9ngvwWB1gE8mL&index=5',
    'Nesta aula, vamos conhecer o funcionamento do nosso site, aprender como navegar pelas aulas e entender o que será estudado durante o curso de Java. Também veremos conceitos iniciais de programação, sintaxe, estrutura de um programa Java, a classe Main e como executar um programa simples. Ao final, você aprenderá a criar seu primeiro Hello World.',
    1,
    1
),

(
    'Entrada, saída e variáveis',
    'https://www.youtube.com/watch?v=BLMu7ebMC1A&list=PLJ0AcghBBWSi6nK2CUkw9ngvwWB1gE8mL&index=6',
    'Nesta aula, vamos aprender como trabalhar com entradas e saídas de dados, variáveis, tipos de dados e operadores básicos da linguagem Java.',
    2,
    2
),

(
    'Maior entre dois números',
    'https://www.youtube.com/watch?v=BLMu7ebMC1A&list=PLJ0AcghBBWSi6nK2CUkw9ngvwWB1gE8mL&index=6',
    'Nesta atividade, vamos aplicar variáveis, entrada de dados e operadores de comparação para descobrir qual é o maior entre dois números.',
    3,
    3
);