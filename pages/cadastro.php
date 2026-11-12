<?php

$erro = $_GET["erro"] ?? "";
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../imgs/Group 4 (3) (1).png" type="image/x-icon">
    <title>BCE School | Criar conta</title>
    <link rel="stylesheet" href="../CSS/design-system.css">
    <link rel="stylesheet" href="../CSS/acessibilidade.css">
</head>
<body>

    <main class="conta-container">

        <div class="conta-box">

            <a class="bce-brand auth-brand" href="../index.html"><img class="logo" src="../imgs/Frame 3.png" alt="BCE School"></span></a>

            <h1>Criar conta</h1>

            <?php if ($erro === "preenchimento"): ?>

                <p class="erro" role="alert">
                    Preencha todos os campos.
                </p>

            <?php elseif ($erro === "email_invalido"): ?>

                <p class="erro" role="alert">
                    Digite um e-mail válido.
                </p>

            <?php elseif ($erro === "senha_curta"): ?>

                <p class="erro" role="alert">
                    A senha deve ter pelo menos 8 caracteres.
                </p>

            <?php elseif ($erro === "email_existente"): ?>

                <p class="erro" role="alert">
                    Este e-mail já está cadastrado.
                </p>

            <?php endif; ?>

            <form
                action="../backend/cadastro.php"
                method="POST"
            >

                <label for="nome">
                    Nome
                </label>

                <input
                    type="text"
                    id="nome"
                    name="nome"
                    required
                >

                <label for="email">
                    E-mail
                </label>

                <input
                    type="email"
                    id="email"
                    name="email"
                    required
                >

                <label for="senha">
                    Senha
                </label>

                <input
                    type="password"
                    id="senha"
                    name="senha"
                    required
                    minlength="8"
                >

                <button type="submit">
                    Criar conta
                </button>

            </form>

            <p class="conta-link">
                Já possui uma conta?
                <a href="login.php">
                    Entrar
                </a>
            </p>

        </div>

    </main>

    <script src="../acessibilidade.js" defer></script>
</body>

</html>