<?php
/**
 * ============================================================
 * COZINHA DE LECTER — Página Inicial (index.php)
 * ============================================================
 * 
 * Esta página exibe:
 * - Um grid de cards com todas as receitas
 * - Filtro por categoria
 * - Links para cada receita individual
 */

// Incluir arquivo de conexão com o banco de dados
require 'php/conexao.php';

// Definir página ativa para o menu
$paginaAtiva = 'receitas';

// Obter a categoria selecionada (se houver)
$categoriaFiltro = isset($_GET['categoria']) ? $_GET['categoria'] : 'todas';

// Buscar todas as categorias do banco
$stmt = $pdo->query("SELECT DISTINCT categoria FROM receitas ORDER BY categoria");
$categorias = $stmt->fetchAll(PDO::FETCH_COLUMN);

// Buscar receitas (com filtro se necessário)
if ($categoriaFiltro === 'todas') {
    // Se "todas", buscar todas as receitas
    $stmt = $pdo->query("SELECT id, episodio, titulo, categoria, imagem FROM receitas ORDER BY id");
} else {
    // Se categoria específica, filtrar
    $stmt = $pdo->prepare("SELECT id, episodio, titulo, categoria, imagem FROM receitas WHERE categoria = ? ORDER BY id");
    $stmt->execute([$categoriaFiltro]);
}

$receitas = $stmt->fetchAll();

// Título da página
$tituloPagina = 'Receitas — Cozinha de Lecter';
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Receitas inspiradas na série Hannibal — análise cinematográfica e culinária.">
    
    <title><?= htmlspecialchars($tituloPagina) ?></title>
    
    <!-- Folha de estilos -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <!-- ============================================================
         MENU FIXO (Incluído de php/header.php)
         ============================================================ -->
    <?php include 'php/header.php'; ?>

    <!-- ============================================================
         CONTEÚDO PRINCIPAL
         ============================================================ -->
    <main class="conteudo-principal">
        <div class="container">

            <!-- ============================================================
                 HERO / CABEÇALHO DA PÁGINA
                 ============================================================ -->
            <section class="hero">
                <h1>A Mesa de Lecter</h1>
                <div class="divisor"></div>
                <p>
                    Dez pratos. Dez episódios. Uma análise gastronômica e cinematográfica 
                    das refeições mais perturbadoramente belas da televisão.
                </p>
            </section>

            <!-- ============================================================
                 FILTRO DE CATEGORIAS
                 ============================================================ -->
            <div class="filtro-categorias">
                <!-- Link para "Todas" -->
                <a href="index.php?categoria=todas" class="<?= ($categoriaFiltro === 'todas') ? 'ativo' : '' ?>">
                    🍽️ Todas as Receitas
                </a>

                <!-- Links para cada categoria (gerados dinamicamente) -->
                <?php foreach ($categorias as $cat): ?>
                    <a href="index.php?categoria=<?= urlencode($cat) ?>" 
                       class="<?= ($categoriaFiltro === $cat) ? 'ativo' : '' ?>">
                        <?php
                        // Ícone e label para cada categoria
                        $labels = [
                            'entradas' => '🥗 Entradas',
                            'sopas' => '🍲 Sopas & Caldos',
                            'pratos-principais' => '🥩 Pratos Principais',
                            'frutos-do-mar' => '🦪 Frutos do Mar',
                            'sobremesas' => '🍮 Sobremesas'
                        ];
                        echo $labels[$cat] ?? ucfirst($cat);
                        ?>
                    </a>
                <?php endforeach; ?>
            </div>

            <!-- ============================================================
                 GRID DE CARDS DE RECEITAS
                 ============================================================ -->
            <section class="grid-receitas">
                <?php if (count($receitas) > 0): ?>
                    <!-- Loop: Para cada receita, exibir um card -->
                    <?php foreach ($receitas as $receita): ?>
                        <a href="receita.php?id=<?= $receita['id'] ?>" class="card-receita">
                            
                            <!-- Imagem do card -->
                            <?php if ($receita['imagem']): ?>
                                <img src="<?= htmlspecialchars($receita['imagem']) ?>" 
                                     alt="<?= htmlspecialchars($receita['titulo']) ?>">
                            <?php else: ?>
                                <div class="card-img-placeholder">🍽️</div>
                            <?php endif; ?>
                            
                            <!-- Corpo do card -->
                            <div class="card-corpo">
                                <span class="card-episodio"><?= htmlspecialchars($receita['episodio']) ?></span>
                                <h3 class="card-titulo"><?= htmlspecialchars($receita['titulo']) ?></h3>
                                <span class="card-categoria">
                                    <?php
                                    // Converter slug em label legível
                                    $labels = [
                                        'entradas' => 'Entradas',
                                        'sopas' => 'Sopas & Caldos',
                                        'pratos-principais' => 'Pratos Principais',
                                        'frutos-do-mar' => 'Frutos do Mar',
                                        'sobremesas' => 'Sobremesas'
                                    ];
                                    echo $labels[$receita['categoria']] ?? ucfirst($receita['categoria']);
                                    ?>
                                </span>
                            </div>
                        </a>
                    <?php endforeach; ?>

                <?php else: ?>
                    <!-- Se não houver receitas, exibir mensagem -->
                    <p style="grid-column: 1/-1; text-align: center; color: var(--cor-texto-suave); padding: 2rem 0;">
                        Nenhuma receita encontrada nesta categoria.
                    </p>
                <?php endif; ?>
            </section>

        </div>
    </main>

    <!-- ============================================================
         RODAPÉ (Incluído de php/footer.php)
         ============================================================ -->
    <?php include 'php/footer.php'; ?>

</body>
</html>
