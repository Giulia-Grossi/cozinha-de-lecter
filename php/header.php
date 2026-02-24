<?php
/**
 * Este arquivo contém o menu que aparece em TODAS as páginas.
 * Ele é incluído com: <?php include 'php/header.php'; ?>
 * 
 * A variável $paginaAtiva define qual item do menu fica destacado.
 * Valores: 'receitas', 'sobre', 'dicas'
 */

// Se $paginaAtiva não foi definida, usa valor padrão
if (!isset($paginaAtiva)) {
    $paginaAtiva = '';
}
?>

<!-- ============================================================
     MENU FIXO NO TOPO
     ============================================================ -->
<header id="menu-topo">
    <div class="menu-inner">
        
        <!-- Logo / Nome do site -->
        <a href="index.php" class="logo">
            Cozinha de <span>Lecter</span>
        </a>

        <!-- Navegação principal -->
        <nav>
            <ul>
                <!-- Link: Receitas -->
                <li class="<?= ($paginaAtiva === 'receitas') ? 'ativo' : '' ?>">
                    <a href="index.php">Receitas</a>
                </li>

                <!-- Link: Sobre -->
                <li class="<?= ($paginaAtiva === 'sobre') ? 'ativo' : '' ?>">
                    <a href="sobre.php">Sobre</a>
                </li>

                <!-- Link: Dicas -->
                <li class="<?= ($paginaAtiva === 'dicas') ? 'ativo' : '' ?>">
                    <a href="dicas.php">Dicas</a>
                </li>
            </ul>
        </nav>

    </div>
</header>
