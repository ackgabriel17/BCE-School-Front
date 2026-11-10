export function prepararCodigoParaFala(codigo) {
        const simbolos = {
            "{": " abre chave ",
            "}": " fecha chave ",
            "(": " abre parênteses ",
            ")": " fecha parênteses ",
            "[": " abre colchetes ",
            "]": " fecha colchetes ",
            ";": " ponto e vírgula ",
            ".": " ponto ",
            ",": " vírgula ",
            "=": " igual ",
            "+": " mais ",
            "-": " menos ",
            "*": " vezes ",
            "/": " barra ",
            "<": " menor que ",
            ">": " maior que ",
            '"': " aspas ",
            "'": " aspas simples ",
            "!": " exclamação ",
            "&": " e comercial ",
            "|": " barra vertical "
        };

        return codigo
            .replace(/\r\n?/g, "\n")
            .replace(/([{}()[\];.,=+\-*\/<>"'!&|])/g,
                simbolo => simbolos[simbolo])
            .replace(/\n/g, ". próxima linha. ")
            .replace(/[ \t]+/g, " ");
    }
