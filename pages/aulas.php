<?php

require_once "../backend/database.php";
require_once "../backend/sessao.php";

precisalogar();

$usuarioid = pegarusuarioid();

$stmt = $pdo->prepare(
    "SELECT aula_atual, foto
     FROM usuarios
     WHERE id = ?"
);

$stmt->execute([$usuarioid]);

$usuario = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$usuario) {
    header("Location: ../backend/logout.php");
    exit;
}

$aula_atual = (int) $usuario["aula_atual"];

$foto = $usuario["foto"];


if ($foto === "default.jpg") {
    $caminhoFoto = "../user/default.jpg";
} else {
    $caminhoFoto = "../uploads/perfil/" . $foto;
}

$stmt = $pdo->prepare(
    "SELECT *
     FROM aulas
     ORDER BY posicao ASC"
);

$stmt->execute();

// pdo::fetch_assoc faz com que os dados sejam
// retornados como um array acessado pelos nomes das colunas
$aulas = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="pt-br">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Aulas</title>

    <link rel="stylesheet" href="../CSS/design-system.css">
    <link rel="stylesheet" href="../CSS/acessibilidade.css">

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

<main id="conteudo-principal" class="aulas-lista" tabindex="-1" aria-label="Lista de aulas">

    <div class="page-intro">
        <p class="page-eyebrow">SUA JORNADA</p>
        <h1>Minhas aulas</h1>
        <p>Continue aprendendo no seu ritmo. Acompanhe seu progresso abaixo.</p>
    </div>

<?php foreach ($aulas as $a): ?>

    <?php

    $posicao = (int) $a["posicao"];

    $concluido = $posicao < $aula_atual;
    $afazer = $posicao === $aula_atual;

    ?>

    <?php if ($concluido || $afazer): ?>

        <a
            class="aula_<?= $concluido ? "concluida" : "afazer" ?>"
            href="aula.php?id=<?= $a["id"] ?>"
        >

    <?php else: ?>

        <div class="aula_fechada">

    <?php endif; ?>

        <h2>
            <?= htmlspecialchars($a["titulo"]) ?>
        </h2>

        <?php if ($concluido): ?>

            <p>concluída</p>

        <?php elseif ($afazer): ?>

            <p>a fazer</p>

        <?php else: ?>

            <p>fechada</p>

        <?php endif; ?>

    <?php if ($afazer || $concluido): ?>

        </a>

    <?php else: ?>

        </div>

    <?php endif; ?>

<?php endforeach; ?>

</main>

    <script src="../acessibilidade.js" defer></script>
</body>

</html>