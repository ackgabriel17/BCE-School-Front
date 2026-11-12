<?php

$erro = $_GET["erro"] ?? "";
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../imgs/Group 4 (3) (1).png" type="image/x-icon">

    <title>BCE School | Entrar</title>

    <link rel="stylesheet" href="../CSS/design-system.css">
    <link rel="stylesheet" href="../CSS/acessibilidade.css">

</head>

<body>

    <main class="conta-container">

        <div class="conta-box">

            <a class="bce-brand auth-brand" href="../index.html"><img class="logo" src="../imgs/Frame 3.png" alt="BCE School"></a>

            <h1>Entrar</h1>

            <?php if ($erro === "preenchimento"): ?>

                <p class="erro" role="alert">
                    Preencha todos os campos.
                </p>

            <?php elseif ($erro === "credenciais"): ?>

                <p class="erro" role="alert">
                    E-mail ou senha incorretos.
                </p>

            <?php endif; ?>

            <form
                action="../backend/login.php"
                method="POST"
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
                >

                <button type="submit">
                    Entrar
                </button>

            </form>

            <p class="conta-link">
                Não possui uma conta?
                <a href="cadastro.php">
                    Criar conta
                </a>
            </p>

        </div>

    </main>

    <script src="../acessibilidade.js" defer></script>
</body>

</html>