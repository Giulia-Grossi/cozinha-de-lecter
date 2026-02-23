<?php
/**
 * Este arquivo é incluído em todas as páginas com:
 *   <?php include 'php/header.php'; ?>
 */

// Define a página ativa se não foi definida antes do include. Valores aceitos: 'receitas', 'sobre', 'dicas'
if (!isset($paginaAtiva)) {
    $paginaAtiva = '';
}

// Determina o caminho base para os links (útil se o site estiver em subdiretório)
// Ajuste conforme necessário para o seu ambiente de hospedagem
$basePath = '';
?>

<!-- ============================================================
     MENU HORIZONTAL FIXO — Presente em todas as páginas
     ============================================================ -->
<header id="menu-topo">
    <div class="menu-inner">

        <!-- Nome / Logo do site -->
        <a href="<?= $basePath ?>index.php" class="logo">
            Cozinha de <span>Lecter</span>
        </a>

        <!-- Navegação principal -->
        <nav aria-label="Navegação principal">
            <ul>

                <!-- Item: Receitas (com submenu de categorias) -->
                <li class="tem-submenu <?= ($paginaAtiva === 'receitas') ? 'ativo' : '' ?>">
                    
                    <!-- O span abre/fecha o submenu via CSS hover e JS click -->
                    <span class="menu-link" 
                          onclick="toggleSubmenu(this)"
                          aria-haspopup="true"
                          aria-expanded="false"
                          role="button"
                          tabindex="0">
                        Receitas
                    </span>

                    <!-- Submenu de categorias — preenchido pelo JavaScript (main.js) -->
                    <ul class="submenu" id="submenu-categorias" aria-label="Categorias de receitas">
                        <!-- Os itens são gerados dinamicamente pelo JS -->
                        <!-- Veja a função inicializarSubmenu() em main.js -->
                    </ul>

                </li>

                <!-- Item: Sobre -->
                <li class="<?= ($paginaAtiva === 'sobre') ? 'ativo' : '' ?>">
                    <a href="<?= $basePath ?>sobre.php">Sobre</a>
                </li>

                <!-- Item: Dicas -->
                <li class="<?= ($paginaAtiva === 'dicas') ? 'ativo' : '' ?>">
                    <a href="<?= $basePath ?>dicas.php">Dicas</a>
                </li>

            </ul>
        </nav>

    </div>
</header>

<!-- Script inline para controle do submenu via clique (mobile) -->
<script>
    /**
     * Alterna a abertura do submenu via clique.
     * O hover já é tratado pelo CSS; este handler é para toque/clique.
     */
    function toggleSubmenu(el) {
        const li = el.closest('.tem-submenu');
        const isAberto = li.classList.contains('aberto');
        
        // Fecha todos os submenus abertos
        document.querySelectorAll('.tem-submenu.aberto').forEach(item => {
            item.classList.remove('aberto');
            item.querySelector('[aria-expanded]').setAttribute('aria-expanded', 'false');
        });
        
        // Abre o clicado (se estava fechado)
        if (!isAberto) {
            li.classList.add('aberto');
            el.setAttribute('aria-expanded', 'true');
        }
    }

    // Fecha o submenu ao clicar fora
    document.addEventListener('click', function(e) {
        if (!e.target.closest('.tem-submenu')) {
            document.querySelectorAll('.tem-submenu.aberto').forEach(item => {
                item.classList.remove('aberto');
            });
        }
    });
</script>
