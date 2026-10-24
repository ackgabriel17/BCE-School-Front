<?php

function decodificar(?string $texto): string {
    if (!$texto) {
        return "";
    }

    $textoDecodificado = base64_decode(
        $texto,
        true
    );

    return $textoDecodificado !== false
        ? $textoDecodificado
        : $texto;
}

function normalizarOutput(string $texto): string {
    $texto = str_replace(
        "\r\n",
        "\n",
        $texto
    );

    return trim($texto);
}

function extrairNumeros(string $texto): array {
    preg_match_all(
        '/[-+]?(?:\d+(?:\.\d+)?|\.\d+)/',
        $texto,
        $correspondencias
    );

    return $correspondencias[0];
}

function compararSaida(
    string $saida,
    string $saidaEsperada,
    string $tipoVerificacao
): bool {

    $saida = normalizarOutput($saida);
    $saidaEsperada = normalizarOutput($saidaEsperada);

    if ($tipoVerificacao ===  "exata") {
        return $saida === $saidaEsperada;
    }

    if ($tipoVerificacao === "numeros") {
        $numerosSaida = extrairNumeros($saida);
        $numerosEsperados = extrairNumeros($saidaEsperada);

        if (count($numerosSaida) !== count($numerosEsperados)) {
            return false;
        }

        foreach ($numerosEsperados as $indice => $numeroEsperado) {

            if ((float) $numerosSaida[$indice] !== (float) $numeroEsperado) {
                return false;
            }
        }

        return true;
    }

    return false;
}