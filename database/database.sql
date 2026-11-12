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
VALUES('niger','a@gmail.com','$2y$10$08r2z7HSzUZcHGeH1TGDieW.dKc/LTmu0pHeQ7shjOWcmKglPvie.', 21);

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
),
(
    
    'Classificando números',
    'Leia três números inteiros. Para cada número, mostre um código de classificação: 1 se for positivo, -1 se for negativo e 0 se for igual a zero. Mostre os três códigos na mesma ordem dos números recebidos. Não escreva mensagens adicionais com números.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Leia três números e classifique cada um.

    }
}'
),

(
    
    'Números pares e ímpares',
    'Leia três números inteiros. Para cada número, mostre 1 se ele for par ou 0 se ele for ímpar. Considere que zero também é par. Mostre os três resultados na mesma ordem dos números recebidos.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Leia três números e verifique quais são pares.

    }
}'
),

(
    
    'Maior entre três números',
    'Leia três números inteiros e mostre o maior deles. Os números podem ser positivos, negativos ou iguais. Mostre somente o maior valor.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Leia três números e encontre o maior.

    }
}'
),

(
    
    'Menor entre três números',
    'Leia três números inteiros e mostre o menor deles. Os números podem ser positivos, negativos ou iguais. Mostre somente o menor valor.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Leia três números e encontre o menor.

    }
}'
),

(
    
    'Média de dois números',
    'Leia dois números decimais e calcule a média aritmética entre eles. A média é obtida somando os dois valores e dividindo o resultado por 2. Mostre somente a média. Utilize double para armazenar os valores.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Leia dois números e calcule a média.

    }
}'
),

(
    'Verificando um intervalo',
    'Leia três números inteiros. Para cada número, mostre 1 se ele estiver entre 10 e 20, incluindo os limites, ou 0 caso esteja fora desse intervalo. Mostre os três resultados na ordem recebida.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Leia três números e verifique se estão no intervalo.

    }
}'
),

(
    
    'Contagem crescente',
    'Leia um número inteiro positivo N e mostre todos os números de 1 até N, em ordem crescente. Mostre um número por linha. Por exemplo, se N for 4, a saída será 1, 2, 3 e 4.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Leia N e conte de 1 até N.

    }
}'
),

(
    
    'Soma de 1 até N',
    'Leia um número inteiro positivo N e calcule a soma de todos os números inteiros de 1 até N. Por exemplo, para N igual a 5, o resultado será 15. Mostre somente o resultado.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Leia N e calcule a soma de 1 até N.

    }
}'
),

(
    
    'Múltiplos de um número',
    'Leia um número inteiro e mostre seus cinco primeiros múltiplos positivos, começando pela multiplicação por 1. Mostre um resultado por linha. Por exemplo, para o número 3, mostre 3, 6, 9, 12 e 15.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Leia um número e mostre seus cinco primeiros múltiplos.

    }
}'
),

(
    
    'Calculando o fatorial',
    'Leia um número inteiro entre 0 e 10 e calcule seu fatorial. O fatorial é o produto dos números inteiros positivos de 1 até o número informado. Por exemplo, 5! é igual a 120. O fatorial de zero é 1. Mostre somente o resultado.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Leia um número e calcule seu fatorial.

    }
}'
),

(
    
    'Somando até encontrar zero',
    'Leia números inteiros e some todos eles. A leitura deve continuar até que o número zero seja recebido. O zero encerra a leitura e não entra na soma. Os números podem ser positivos ou negativos. Mostre somente a soma final.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Leia e some números até encontrar zero.

    }
}'
),

(
    
    'Soma dos elementos de um vetor',
    'Leia cinco números inteiros e armazene-os em um vetor de cinco posições. Depois, percorra o vetor e calcule a soma de seus elementos. Mostre somente o resultado.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        int[] numeros = new int[5];

        // Leia os cinco valores e calcule a soma.

    }
}'
),

(
    
    'Maior elemento de um vetor',
    'Leia cinco números inteiros e armazene-os em um vetor. Depois, percorra o vetor e encontre o maior valor armazenado. Os números podem ser negativos ou iguais. Mostre somente o maior valor.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        int[] numeros = new int[5];

        // Leia os cinco valores e encontre o maior.

    }
}'
),

(
    
    'Contando números positivos',
    'Leia cinco números inteiros e armazene-os em um vetor. Depois, conte quantos elementos são maiores que zero. O número zero não deve ser considerado positivo. Mostre somente a quantidade encontrada.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        int[] numeros = new int[5];

        // Leia os valores e conte quantos são positivos.

    }
}'
),

(
    
    'Contando números pares no vetor',
    'Leia cinco números inteiros e armazene-os em um vetor. Depois, conte quantos elementos são pares. Lembre-se de que um número é par quando o resto da divisão por 2 é igual a zero. O número zero também é par. Mostre somente a quantidade encontrada.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        int[] numeros = new int[5];

        // Leia os valores e conte quantos são pares.

    }
}'
),

(
    
    'Média dos elementos de um vetor',
    'Leia cinco números inteiros e armazene-os em um vetor. Depois, calcule a média aritmética dos cinco valores. Utilize double para o resultado, evitando perder a parte decimal da divisão. Mostre somente a média.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        int[] numeros = new int[5];

        // Leia os valores e calcule a média.

    }
}'
),

(
    
    'Contando ocorrências no vetor',
    'Leia cinco números inteiros e armazene-os em um vetor. Depois, leia mais um número inteiro, que será o valor procurado. Percorra o vetor e conte quantas vezes esse valor aparece. Mostre somente a quantidade de ocorrências.',
    'import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        int[] numeros = new int[5];

        // Leia os cinco valores e depois o número procurado.

    }
}'
);

INSERT INTO testes
(exercicio_id, entrada, saida_esperada,tipo_verifica)
VALUES
(1, '', 'Hello World', 'exata'),

(2, '2 3', '5	-1', 'numeros'),

(2, '10 5', '15	5', 'numeros'),

(2, '-2 3',  '1 -5', 'numeros'),

(3, '2 1', '2', 'numeros'),

(3, '10 5', '10', 'numeros'),

(3, '-2 -5', '-2', 'numeros'),

(4, '8 0 -3', '1 0 -1', 'numeros'),

(5, '8 7 0', '1 0 1', 'numeros'),

(6, '3 9 5', '9', 'numeros'),

(7, '3 9 5', '3', 'numeros'),

(8, '8 7', '7.5', 'numeros'),

(9, '10 15 21', '1 1 0', 'numeros'),

(10, '5', '1 2 3 4 5', 'numeros'),

(11, '5', '15', 'numeros'),

(12, '3', '3 6 9 12 15', 'numeros'),

(13, '5', '120', 'numeros'),

(14, '2 3 -1 0', '4', 'numeros'),

(15, '1 2 3 4 5', '15', 'numeros'),

(16, '-8 -2 -5 -1 -3', '-1', 'numeros'),

(17, '-1 0 2 3 -4', '2', 'numeros'),

(18, '1 2 3 4 5', '2', 'numeros'),

(19, '8 6 7 9 10', '8', 'numeros'),

(20, '2 5 2 7 2 2', '3', 'numeros');
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
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4
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
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos conhecer o funcionamento do nosso site, aprender como navegar pelas aulas e entender o que será estudado durante o curso de Java. Também veremos conceitos iniciais de programação, sintaxe, estrutura de um programa Java, a classe Main e como executar um programa simples. Ao final, você aprenderá a criar seu primeiro Hello World.',
    1,
    1
),

(
    'Entrada, saída e variáveis',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos aprender como trabalhar com entradas e saídas de dados, variáveis, tipos de dados e operadores básicos da linguagem Java.',
    2,
    2
),

(
    'Maior entre dois números',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta atividade, vamos aplicar variáveis, entrada de dados e operadores de comparação para descobrir qual é o maior entre dois números.',
    3,
    3
),

(
    'Classificando números',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos aprofundar o uso das estruturas condicionais.

O if permite executar um bloco quando uma condição é verdadeira. O else permite executar outro bloco quando ela é falsa.

Também podemos utilizar else if para verificar várias possibilidades.

Exemplo:

if (numero > 0) {
    resultado = 1;
} else if (numero < 0) {
    resultado = -1;
} else {
    resultado = 0;
}

No exercício, você deverá ler três números e classificar cada um como positivo, negativo ou zero, utilizando os códigos indicados no enunciado.',
    4,
    4
),

(
    'Verificando números pares',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos conhecer o operador módulo (%).

Esse operador retorna o resto de uma divisão.

Exemplos:

10 % 2 resulta em 0.
7 % 2 resulta em 1.

Quando o resto da divisão de um número por 2 é zero, esse número é par.

Exemplo:

if (numero % 2 == 0) {
    resultado = 1;
} else {
    resultado = 0;
}

No exercício, leia três números e indique quais são pares.',
    5,
    5
),

(
    'Encontrando o maior número',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos comparar três números inteiros.

Uma estratégia é guardar o primeiro número em uma variável chamada maior.

Depois, comparamos os outros valores com essa variável. Se algum deles for maior, atualizamos o valor guardado.

Exemplo:

int maior = a;

if (b > maior) {
    maior = b;
}

if (c > maior) {
    maior = c;
}

Ao final, a variável maior contém o maior valor encontrado.

No exercício, aplique essa estratégia para encontrar o maior de três números.',
    6,
    6
),

(
    'Encontrando o menor número',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos aplicar a comparação de valores para encontrar o menor número.

A lógica é semelhante à utilizada para encontrar o maior, mas agora procuramos valores menores.

Exemplo:

int menor = a;

if (b < menor) {
    menor = b;
}

if (c < menor) {
    menor = c;
}

Sempre que encontramos um valor menor, atualizamos a variável.

No exercício, leia três números inteiros e mostre o menor deles.',
    7,
    7
),

(
    'Trabalhando com médias e double',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos trabalhar com números decimais.

Em Java, o tipo int armazena números inteiros, enquanto double permite armazenar números com casas decimais.

Exemplo:

double nota1 = 8;
double nota2 = 7;

double media = (nota1 + nota2) / 2.0;

Utilizar 2.0 ajuda a deixar explícito que queremos uma divisão decimal.

No exercício, leia dois números e calcule a média aritmética entre eles.',
    8,
    8
),

(
    'Combinando condições',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos combinar duas condições utilizando operadores lógicos.

O operador && significa E. As duas condições precisam ser verdadeiras.

Exemplo:

if (numero >= 10 && numero <= 20) {
    resultado = 1;
} else {
    resultado = 0;
}

Nesse caso, o número precisa ser maior ou igual a 10 e menor ou igual a 20.

No exercício, verifique três números e indique quais pertencem ao intervalo de 10 a 20.',
    9,
    9
),

(
    'Introdução ao for',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos aprender a repetir instruções utilizando o for.

Exemplo:

for (int i = 1; i <= 5; i++) {
    System.out.println(i);
}

A estrutura possui três partes:

A primeira define o valor inicial do contador.

A segunda determina quando a repetição deve continuar.

A terceira atualiza o contador a cada repetição.

No exemplo, o programa mostra os números de 1 até 5.

No exercício, leia N e mostre todos os números de 1 até N.',
    10,
    10
),

(
    'Utilizando acumuladores',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos aprender a utilizar acumuladores.

Um acumulador guarda um resultado que é atualizado durante uma repetição.

Exemplo:

int soma = 0;

for (int i = 1; i <= 5; i++) {
    soma = soma + i;
}

System.out.println(soma);

A cada repetição, o valor de i é adicionado à soma.

Ao final, o resultado será 15.

No exercício, leia N e calcule a soma de todos os números de 1 até N.',
    11,
    11
),

(
    'Calculando múltiplos com for',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos utilizar o for para executar cálculos repetidos.

Podemos multiplicar um número por um contador que aumenta a cada repetição.

Exemplo:

int numero = 3;

for (int i = 1; i <= 5; i++) {
    System.out.println(numero * i);
}

O programa mostra os cinco primeiros múltiplos positivos de 3.

No exercício, leia um número e mostre seus cinco primeiros múltiplos.',
    12,
    12
),

(
    'Calculando fatoriais',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos utilizar repetição e multiplicação para calcular o fatorial.

O fatorial de 5 é:

5 * 4 * 3 * 2 * 1 = 120

Podemos começar com uma variável resultado valendo 1 e multiplicá-la pelos números de 1 até o valor informado.

Exemplo:

int resultado = 1;

for (int i = 1; i <= numero; i++) {
    resultado = resultado * i;
}

O fatorial de zero também é 1.

No exercício, leia um número entre 0 e 10 e calcule seu fatorial.',
    13,
    13
),

(
    'Repetição com while',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos conhecer o while.

O while é útil quando não sabemos antecipadamente quantas repetições serão necessárias.

Exemplo:

int numero = entrada.nextInt();

while (numero != 0) {
    soma = soma + numero;
    numero = entrada.nextInt();
}

O laço continua enquanto o número for diferente de zero.

É importante ler um novo valor dentro do laço. Caso contrário, o programa pode repetir para sempre.

No exercício, some os números recebidos até encontrar zero.',
    14,
    14
),

(
    'Introdução aos vetores',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos aprender a armazenar vários valores utilizando vetores, também chamados de arrays.

Exemplo:

int[] numeros = new int[5];

Esse comando cria um vetor com cinco posições.

Os índices começam em zero:

numeros[0]
numeros[1]
numeros[2]
numeros[3]
numeros[4]

Podemos utilizar um for para preencher todas as posições:

for (int i = 0; i < 5; i++) {
    numeros[i] = entrada.nextInt();
}

No exercício, armazene cinco números e calcule a soma dos elementos.',
    15,
    15
),

(
    'Percorrendo vetores',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos percorrer um vetor para encontrar seu maior elemento.

Podemos considerar inicialmente que o primeiro elemento é o maior.

Exemplo:

int maior = numeros[0];

for (int i = 1; i < 5; i++) {
    if (numeros[i] > maior) {
        maior = numeros[i];
    }
}

Sempre que encontramos um valor maior, atualizamos a variável.

Essa estratégia também funciona quando todos os números são negativos.

No exercício, leia cinco valores e encontre o maior deles.',
    16,
    16
),

(
    'Contadores e condições em vetores',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos combinar vetores, condições e contadores.

Um contador registra quantas vezes determinada condição foi satisfeita.

Exemplo:

int quantidade = 0;

for (int i = 0; i < 5; i++) {
    if (numeros[i] > 0) {
        quantidade++;
    }
}

O operador ++ aumenta a variável em uma unidade.

No exercício, leia cinco números e conte quantos são positivos.',
    17,
    17
),

(
    'Operador módulo em vetores',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos aplicar o operador módulo ao percorrer um vetor.

O operador % retorna o resto da divisão.

Para verificar se um número é par, podemos utilizar:

if (numeros[i] % 2 == 0) {
    quantidade++;
}

Quando o resto da divisão por 2 é zero, o número é par.

No exercício, leia cinco números e conte quantos deles são pares.',
    18,
    18
),

(
    'Calculando a média de um vetor',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos utilizar vetores e acumuladores para calcular uma média.

Primeiro, percorremos o vetor e somamos seus elementos.

Depois, dividimos a soma pela quantidade de elementos.

Exemplo:

double media = soma / 5.0;

Utilizar 5.0 garante que o resultado seja uma divisão decimal.

No exercício, leia cinco números inteiros, calcule a média e mostre o resultado.',
    19,
    19
),

(
    'Contando ocorrências em um vetor',
    'https://youtu.be/JkxnHrc1Gxg?si=2ohAozQbzlZfyeN4',
    'Nesta aula, vamos aprender a procurar valores dentro de um vetor.

Podemos percorrer todas as posições e comparar cada elemento com o valor procurado.

Exemplo:

int quantidade = 0;

for (int i = 0; i < 5; i++) {
    if (numeros[i] == procurado) {
        quantidade++;
    }
}

Cada vez que encontramos uma ocorrência, aumentamos o contador.

No exercício, leia cinco números, depois leia um valor procurado e conte quantas vezes ele aparece no vetor.',
    20,
    20
);
