<?php

require_once __DIR__ . "/database.php";
require_once __DIR__ . "/sessao.php";

precisalogar();

$usuario_id = pegarusuarioid();

$stmt = $pdo->prepare(
    "SELECT foto
     FROM usuarios
     WHERE id = ?"
);

$stmt->execute([$usuario_id]);

$usuario = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$usuario) {
    header("Location: ../backend/logout.php");
    exit;
}

$foto = $usuario["foto"];


if ($foto !== "default.jpg") {

    $caminho = __DIR__ . "/../uploads/perfil/" . $foto;

    if (is_file($caminho)) {
        unlink($caminho);
    }
}

$stmt = $pdo->prepare(
    "UPDATE usuarios
     SET foto = 'default.jpg'
     WHERE id = ?"
);

$stmt->execute([$usuario_id]);

header("Location: ../pages/usuario.php");
exit;