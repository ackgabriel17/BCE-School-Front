<?php

require_once "../backend/database.php";
require_once "../backend/sessao.php";

precisalogar();

$exercicioId = $_GET["p"] ?? null;

if (!$exercicioId) {
    die("Exercício não encontrado");
}

$usuario_id = pegarusuarioid();

$stmt = $pdo->prepare(
    "SELECT aula_atual, foto
     FROM usuarios
     WHERE id = ?"
);

$stmt->execute([$usuario_id]);

$usuario = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$usuario) {
    die("Usuário não encontrado");
}

$foto = $usuario["foto"];

if ($foto === "default.jpg") {
    $caminhoFoto = "../user/default.jpg";
} else {
    $caminhoFoto = "../uploads/perfil/" . $foto;
}

$aula_atual = (int) $usuario["aula_atual"];

$stmt = $pdo->prepare(
    "SELECT posicao
     FROM aulas
     WHERE exercicio_id = ?"
);

$stmt->execute([$exercicioId]);

$aula = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$aula) {
    die("Aula não encontrada");
}

if ((int) $aula["posicao"] > $aula_atual) {
    header("Location: aulas.php");
    exit;
}

$stmt = $pdo->prepare(
    "SELECT *
     FROM exercicios
     WHERE id = ?"
);

$stmt->execute([$exercicioId]);

$exercicio = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$exercicio) {
    die("Exercício não encontrado");
}

?>

<!DOCTYPE html>
<html lang="pt-br">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Editor</title>

    <link rel="stylesheet" href="css/tarefa.css">
    <link rel="stylesheet" href="../CSS/design-system.css">
    <link rel="stylesheet" href="../CSS/acessibilidade.css">

    <!-- Monaco Editor via CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.39.0/min/vs/loader.min.js"></script>

</head>

<body>


    <header class="bce-header">
        <a class="bce-brand" href="../index.html">BCE <span>School</span></a>
        <a href="usuario.php" class="perfil_link" aria-label="Abrir perfil do usuário">

        <img
            src="<?= htmlspecialchars($caminhoFoto) ?>"
            class="foto_menu"
            alt="Perfil"
        >

    </a>
    </header>

    <main id="conteudo-principal" tabindex="-1" class="editor-container"
        data-exercicio-id="<?= (int) $exercicio["id"] ?>"
    >

        <h1>
            <?= htmlspecialchars($exercicio["titulo"]) ?>
        </h1>

        <div>
            <?= nl2br(htmlspecialchars($exercicio["descricao"])) ?>
        </div>

        <button class="btnfala">fala</button>
        <!-- Div para o Monaco Editor -->
        <label for="editor-container">Editor de código Java</label>
        <div
            id="editor-container"
            role="region"
            aria-label="Editor de código Java. Use os recursos de acessibilidade do editor para navegar pelo código."
            style="background-color: #1e1e1e;height: 350px; padding-top: 20px; border: 1px solid #ccc; margin-bottom: 15px;"
        ></div>

        <!-- Guarda o código inicial -->
        <textarea
            id="codigo-inicial"
            style="display:none;"
        ><?= htmlspecialchars($exercicio["codigo_inicial"]) ?></textarea>

        <label for="stdin">Entrada do programa (stdin)</label>
        <textarea
            id="stdin"
            aria-label="Entrada padrão do programa"
            placeholder="Digite aqui os dados de entrada"
            style="height:120px;"
        ></textarea>

        <div class="button-group">

            <button id="runButton">
                Rodar Código
            </button>

            <button id="verifyButton">
                Verificar Solução
            </button>

        </div>

        <div
            id="loading"
            class="loading-container"
            style="display:none;"
        >

            <div class="spinner"></div>

        </div>

        <h2 id="output-title">Resultado da execução</h2>
        <div
            class="console"
            style="color: white;"
            id="output"
            role="region"
            aria-labelledby="output-title"
            aria-live="polite"
            tabindex="0"
        ></div>

    </main>

    <a class="editor-continue" href="aulas.php">
        Voltar às aulas
    </a>

    <script type="module" src="js/editor.js?v=2"></script>
    <script type="module" >
    
    import {getEditorValue} from "./js/ui.js";
    import {prepararCodigoParaFala} from "./js/falacodigo.js";
    import {setVozDaniel} from "./js/vozDaniel.js";
    
    const btnfala = document.querySelector(".btnfala");
    
    
    
      btnfala.addEventListener('click', () => {
        const codigo =  getEditorValue();
        const falatxt = prepararCodigoParaFala(codigo);
    
        window.speechSynthesis.cancel();
        
        const fala = new SpeechSynthesisUtterance(falatxt);
        
        fala.lang = 'pt-BR';
        fala.rate = 1.2;
        fala.pitch = 0.9;
        setVozDaniel(fala);
        
        window.speechSynthesis.speak(fala);
      });
    
    
    </script>

    <script src="../acessibilidade.js" defer></script>
</body>

</html>
