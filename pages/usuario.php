<?php
require_once "../backend/database.php";
require_once "../backend/sessao.php";

precisalogar();

$usuarioid = pegarusuarioid();

$stmt = $pdo->prepare(
    "SELECT nome, email, aula_atual, foto
     FROM usuarios
     WHERE id = ?"
);

$stmt->execute([$usuarioid]);

$usuario = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$usuario) {
    header("Location: ../backend/logout.php");
    exit;
}

$nome = $usuario["nome"];
$foto = $usuario["foto"];

if ($foto === "default.jpg") {
    $caminhoFoto = "../user/default.jpg";
} else {
    $caminhoFoto = "../uploads/perfil/" . $foto;
}

?>

<!DOCTYPE html>
<html lang="pt-br">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../imgs/Group 4 (3) (1).png" type="image/x-icon">

    <title>BCE School | Meu perfil</title>

    <link rel="stylesheet" href="../CSS/design-system.css">
    <link rel="stylesheet" href="../CSS/acessibilidade.css">

</head>

<body>

    <header class="bce-header">
        <a class="bce-brand" href="../index.html"><img class="logo" src="../imgs/Frame 3.png" alt="BCE School"></a>
        <a class="header-back" href="aulas.php">Voltar às aulas</a>
    </header>

    <main class="conta-container">

        <div class="conta-box">

            <h1>Meu perfil</h1>

            <p class="profile-email"><?= htmlspecialchars($usuario["email"]) ?></p>

            <p>
                Nome:
                <?= htmlspecialchars($nome) ?>
            </p>

            <img
                src="<?= htmlspecialchars($caminhoFoto) ?>"
                class="foto_perfil"
                alt="Foto de perfil"
            >

            <form
                action="../backend/fotoup.php"
                method="POST"
                enctype="multipart/form-data"
            >

                <label for="foto">Escolher foto de perfil</label>
                <input
                    type="file"
                    id="foto"
                    name="foto"
                    accept=".jpg,.jpeg,.png,.webp"
                >

                <button type="submit">
                    Alterar foto
                </button>

            </form>

            <a href="../backend/removefoto.php">
                Remover foto
            </a>

            <a
                class="botao"
                href="aulas.php"
            >
                &lt;-- Voltar
            </a>

            <a
                class="sair"
                href="../backend/logout.php"
            >
                Sair da conta
            </a>

        </div>

    </main>

    <script src="../acessibilidade.js" defer></script>
</body>

</html>