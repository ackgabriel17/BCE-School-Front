# BCE School — Design System v2

## Direção visual
- Estilo: moderno e minimalista.
- Tema: claro.
- Cor principal: `#6246D9`.
- Fundo: `#F8F9FC`.
- Superfícies: branco.
- Tipografia: Inter com fallback para fontes do sistema.
- Editor de código: permanece escuro para preservar a legibilidade da sintaxe.

## Arquivo central
`CSS/design-system.css` concentra tokens, tipografia, componentes, estados, layouts e responsividade. Ele deve continuar sendo carregado depois do CSS específico de cada página.

## Páginas contempladas
- `index.html`: página inicial e navegação.
- `pages/login.php` e `pages/cadastro.php`: formulários de autenticação.
- `pages/aulas.php`: lista de aulas e estados de progresso.
- `pages/aula.php`: conteúdo e player da aula.
- `pages/tarefa.php`: editor de código e console.
- `pages/usuario.php`: perfil do estudante.

## Como ajustar a identidade
Edite primeiro as variáveis CSS em `:root` no início de `CSS/design-system.css`. Evite criar cores novas diretamente nos CSS individuais; reutilize as variáveis `--bce-*`.

## Acessibilidade visual
O sistema mantém foco de teclado visível, alvos de interação com altura mínima aproximada de 44px, contraste de texto e suporte a redução de movimento. Isso não substitui testes com leitores de tela, teclado e usuários reais.

## Observação
A fonte Inter é carregada do Google Fonts. Se o ambiente de apresentação não tiver internet, o sistema utiliza as fontes de fallback do dispositivo.
