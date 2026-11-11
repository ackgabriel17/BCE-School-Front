(() => {
  const root = document.documentElement;
  const storageKey = 'bce-preferencias-acessibilidade';
  const defaults = { text: 0, contrast: false, spacing: false, motion: false };
  let prefs = { ...defaults };

  try {
    const saved = JSON.parse(localStorage.getItem(storageKey) || '{}');
    prefs = { ...defaults, ...saved };
  } catch (_) { /* Preferências inválidas não impedem o uso do site. */ }

  const apply = () => {
    root.classList.toggle('a11y-text-plus', prefs.text === 1);
    root.classList.toggle('a11y-text-max', prefs.text === 2);
    root.classList.toggle('a11y-contrast', prefs.contrast);
    root.classList.toggle('a11y-spacing', prefs.spacing);
    root.classList.toggle('a11y-reduced-motion', prefs.motion);
    try { localStorage.setItem(storageKey, JSON.stringify(prefs)); } catch (_) {}
    updateButtons();
  };

  const widget = document.createElement('aside');
  widget.className = 'a11y-widget';
  widget.setAttribute('aria-label', 'Ferramentas de acessibilidade');
  widget.innerHTML = `
    <button class="a11y-toggle" type="button" aria-expanded="false" aria-controls="a11y-panel">Acessibilidade</button>
    <section class="a11y-panel" id="a11y-panel" aria-labelledby="a11y-title" hidden>
      <h2 id="a11y-title">Ajustes de acessibilidade</h2>
      <p>As preferências ficam salvas neste navegador.</p>
      <div class="a11y-controls">
        <button type="button" data-action="text-down" aria-label="Diminuir tamanho do texto">A− Texto</button>
        <button type="button" data-action="text-up" aria-label="Aumentar tamanho do texto">A+ Texto</button>
        <button type="button" data-action="contrast" aria-pressed="false">Alto contraste</button>
        <button type="button" data-action="spacing" aria-pressed="false">Espaçamento</button>
        <button type="button" data-action="motion" aria-pressed="false">Reduzir animações</button>
        <button type="button" class="a11y-reset" data-action="reset">Restaurar padrão</button>
      </div>
      <p class="a11y-status" role="status" aria-live="polite"></p>
    </section>`;
  document.body.appendChild(widget);

  const toggle = widget.querySelector('.a11y-toggle');
  const panel = widget.querySelector('.a11y-panel');
  const status = widget.querySelector('.a11y-status');

  function updateButtons() {
    widget.querySelector('[data-action="contrast"]')?.setAttribute('aria-pressed', String(prefs.contrast));
    widget.querySelector('[data-action="spacing"]')?.setAttribute('aria-pressed', String(prefs.spacing));
    widget.querySelector('[data-action="motion"]')?.setAttribute('aria-pressed', String(prefs.motion));
  }

  toggle.addEventListener('click', () => {
    const open = toggle.getAttribute('aria-expanded') !== 'true';
    toggle.setAttribute('aria-expanded', String(open));
    panel.hidden = !open;
    if (open) panel.querySelector('button')?.focus();
  });

  widget.addEventListener('click', (event) => {
    const button = event.target.closest('button[data-action]');
    if (!button) return;
    switch (button.dataset.action) {
      case 'text-down': prefs.text = Math.max(0, prefs.text - 1); status.textContent = 'Tamanho do texto reduzido.'; break;
      case 'text-up': prefs.text = Math.min(2, prefs.text + 1); status.textContent = 'Tamanho do texto aumentado.'; break;
      case 'contrast': prefs.contrast = !prefs.contrast; status.textContent = prefs.contrast ? 'Alto contraste ativado.' : 'Alto contraste desativado.'; break;
      case 'spacing': prefs.spacing = !prefs.spacing; status.textContent = prefs.spacing ? 'Espaçamento ampliado.' : 'Espaçamento padrão restaurado.'; break;
      case 'motion': prefs.motion = !prefs.motion; status.textContent = prefs.motion ? 'Animações reduzidas.' : 'Animações padrão restauradas.'; break;
      case 'reset': prefs = { ...defaults }; status.textContent = 'Preferências restauradas.'; break;
    }
    apply();
  });

  // Link para pular navegação repetitiva; requer um destino principal.
  const main = document.querySelector('main, .editor-container');
  if (main) {
    if (!main.id) main.id = 'conteudo-principal';
    const skip = document.createElement('a');
    skip.className = 'a11y-skip-link';
    skip.href = `#${main.id}`;
    skip.textContent = 'Pular para o conteúdo principal';
    document.body.prepend(skip);
    main.setAttribute('tabindex', '-1');
  }

  apply();

  // VLibras: carrega o widget oficial em todas as páginas que utilizam
  // este arquivo de acessibilidade. O próprio script inicializa o widget.
  if (!document.querySelector('script[data-vlibras-widget]')) {
    const vlibrasScript = document.createElement('script');
    vlibrasScript.src = 'https://vlibras.gov.br/app/vlibras-plugin.js';
    vlibrasScript.async = true;
    vlibrasScript.dataset.vlibrasWidget = 'true';
    vlibrasScript.onerror = () => {
      console.warn('Não foi possível carregar o widget VLibras. Verifique sua conexão.');
    };
    document.body.appendChild(vlibrasScript);
  }
})();
