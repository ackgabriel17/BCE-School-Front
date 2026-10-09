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

    <title>Java School | Usuário</title>

    <link rel="stylesheet" href="css/conta.css">

</head>

<body>

    <main class="conta-container">

        <div class="conta-box">

            <h1>Usuário</h1>

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

                <input
                    type="file"
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
                href="javascript:history.back()"
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

</body>

</html>