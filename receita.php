<?php
/**
 * ============================================================
 * COZINHA DE LECTER — Página Individual de Receita (receita.php)
 * ============================================================
 * 
 * Esta página exibe os detalhes completos de uma receita:
 * - Análise cinematográfica
 * - Ingredientes
 * - Modo de preparo
 * - Curiosidade cultural
 * 
 * Acesso: receita.php?id=1 (onde 1 é o ID da receita)
 */

// Incluir arquivo de conexão com o banco de dados
require 'php/conexao.php';

// Definir página ativa para o menu
$paginaAtiva = 'receitas';

// Obter o ID da receita da URL
// intval() converte para inteiro por segurança
$idReceita = isset($_GET['id']) ? intval($_GET['id']) : 0;

// Buscar a receita no banco de dados
$stmt = $pdo->prepare("SELECT * FROM receitas WHERE id = ?");
$stmt->execute([$idReceita]);
$receita = $stmt->fetch();

// Se a receita não existir, exibir erro
if (!$receita) {
    $tituloPagina = 'Receita não encontrada';
    $receita = null;
} else {
    $tituloPagina = $receita['titulo'] . ' — Cozinha de Lecter';
}

// Buscar ingredientes (se receita existe)
$ingredientes = [];
if ($receita) {
    $stmt = $pdo->prepare("SELECT descricao FROM ingredientes WHERE receita_id = ? ORDER BY ordem");
    $stmt->execute([$idReceita]);
    $ingredientes = $stmt->fetchAll(PDO::FETCH_COLUMN);
}

// Buscar passos do preparo (se receita existe)
$passos = [];
if ($receita) {
    $stmt = $pdo->prepare("SELECT descricao FROM passos_preparo WHERE receita_id = ? ORDER BY ordem");
    $stmt->execute([$idReceita]);
    $passos = $stmt->fetchAll(PDO::FETCH_COLUMN);
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Receita detalhada com análise cinematográfica — Cozinha de Lecter">
    
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

            <?php if ($receita): ?>
                <!-- ============================================================
                     RECEITA ENCONTRADA - EXIBIR DETALHES
                     ============================================================ -->

                <!-- Botão voltar -->
                <a href="index.php" class="btn-voltar">← Voltar às receitas</a>

                <!-- Página da receita -->
                <article class="pagina-receita">
                    
                    <!-- ============================================================
                         CABEÇALHO DA RECEITA
                         ============================================================ -->
                    <header class="receita-header">
                        <span class="episodio"><?= htmlspecialchars($receita['episodio']) ?></span>
                        <h1><?= htmlspecialchars($receita['titulo']) ?></h1>
                        <span class="categoria">
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
                    </header>

                    <!-- ============================================================
                         IMAGEM PRINCIPAL
                         ============================================================ -->
                    <?php if ($receita['imagem']): ?>
                        <img src="<?= htmlspecialchars($receita['imagem']) ?>" 
                             alt="<?= htmlspecialchars($receita['titulo']) ?>" 
                             class="receita-img-principal">
                    <?php else: ?>
                        <div class="receita-img-placeholder">🍽️</div>
                    <?php endif; ?>

                    <!-- ============================================================
                         SEÇÃO: ANÁLISE CINEMATOGRÁFICA
                         ============================================================ -->
                    <section class="receita-secao">
                        <h2>Análise da Cena</h2>
                        <p><?= nl2br(htmlspecialchars($receita['descricao'])) ?></p>
                    </section>

                    <!-- ============================================================
                         SEÇÃO: INGREDIENTES
                         ============================================================ -->
                    <section class="receita-secao">
                        <h2>Ingredientes</h2>
                        <?php if (count($ingredientes) > 0): ?>
                            <ul class="lista-ingredientes">
                                <?php foreach ($ingredientes as $ingrediente): ?>
                                    <li><?= htmlspecialchars($ingrediente) ?></li>
                                <?php endforeach; ?>
                            </ul>
                        <?php else: ?>
                            <p style="color: var(--cor-texto-suave);">Nenhum ingrediente cadastrado.</p>
                        <?php endif; ?>
                    </section>

                    <!-- ============================================================
                         SEÇÃO: MODO DE PREPARO
                         ============================================================ -->
                    <section class="receita-secao">
                        <h2>Modo de Preparo</h2>
                        <?php if (count($passos) > 0): ?>
                            <ol class="lista-passos">
                                <?php foreach ($passos as $passo): ?>
                                    <li><?= htmlspecialchars($passo) ?></li>
                                <?php endforeach; ?>
                            </ol>
                        <?php else: ?>
                            <p style="color: var(--cor-texto-suave);">Nenhum passo cadastrado.</p>
                        <?php endif; ?>
                    </section>

                    <!-- ============================================================
                         SEÇÃO: CURIOSIDADE CULTURAL
                         ============================================================ -->
                    <section class="receita-secao">
                        <h2>Nota Cultural</h2>
                        <div class="bloco-curiosidade">
                            <strong>Você sabia?</strong>
                            <?= nl2br(htmlspecialchars($receita['curiosidade'])) ?>
                        </div>
                    </section>

                </article>

            <?php else: ?>
                <!-- ============================================================
                     RECEITA NÃO ENCONTRADA
                     ============================================================ -->
                <div style="text-align: center; padding: 3rem 0;">
                    <h1>❌ Receita não encontrada</h1>
                    <p style="color: var(--cor-texto-suave); margin-top: 1rem;">
                        Desculpe, a receita que você procura não existe.
                    </p>
                    <a href="index.php" class="btn-voltar" style="margin-top: 1.5rem; display: inline-flex;">
                        ← Voltar às receitas
                    </a>
                </div>
            <?php endif; ?>

        </div>
    </main>

    <!-- ============================================================
         RODAPÉ (Incluído de php/footer.php)
         ============================================================ -->
    <?php include 'php/footer.php'; ?>

</body>
</html>
