<?php

require_once __DIR__ . '/database.php';
require_once __DIR__ . '/sessao.php';

precisalogar();

$usuario_id = pegarusuarioid();

if (!isset($_FILES['foto'])) {
    header('Location: ../pages/usuario.php');
    exit;
}


$arquivo = $_FILES['foto'];

if ($arquivo['error'] !== UPLOAD_ERR_OK) {
    header('Location: ../pages/usuario.php?erro=upload');
    exit;
}

if ($arquivo['size'] > 5 * 1024 * 1024) {
    header('Location: ../pages/usuario.php?erro=tamanho');
    exit;
}


$informacoes = getimagesize($arquivo['tmp_name']);

if ($informacoes === false) {
    header('Location: ../pages/usuario.php?erro=formato');
    exit;
}


$tiposPermitidos = [
    IMAGETYPE_JPEG => 'jpg',
    IMAGETYPE_PNG => 'png',
    IMAGETYPE_WEBP => 'webp'
];

$tipoImagem = $informacoes[2];

if (!isset($tiposPermitidos[$tipoImagem])) {
    header('Location: ../pages/usuario.php?erro=formato');
    exit;
}

$extensao = $tiposPermitidos[$tipoImagem];

$nomeArquivo = 'usuario_' . $usuario_id . '.' . $extensao;

$pasta = __DIR__ . '/../uploads/perfil/';


if (!is_dir($pasta)) {
    mkdir($pasta, 0755, true);
}

$caminho = $pasta . $nomeArquivo;

$stmt = $pdo->prepare(
    'SELECT foto
     FROM usuarios
     WHERE id = ?'
);

$stmt->execute([$usuario_id]);

$usuario = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$usuario) {
    header('Location: ../backend/logout.php');
    exit;
}

$fotoAntiga = $usuario['foto'];


if (!move_uploaded_file($arquivo['tmp_name'], $caminho)) {
    header('Location: ../pages/usuario.php?erro=upload');
    exit;
}

$stmt = $pdo->prepare(
    'UPDATE usuarios
     SET foto = ?
     WHERE id = ?'
);

$stmt->execute([
    $nomeArquivo,
    $usuario_id
]);


if (
    $fotoAntiga !== 'default.jpg' &&
    $fotoAntiga !== $nomeArquivo
) {
    $caminhoFotoAntiga = $pasta . $fotoAntiga;

    if (is_file($caminhoFotoAntiga)) {
        unlink($caminhoFotoAntiga);
    }
}
header('Location: ../pages/usuario.php');
exit;