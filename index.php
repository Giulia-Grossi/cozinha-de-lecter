<?php
/**
 * Exibe o grid de cards de receitas com filtro por categoria.
 * 
 * INTEGRAÇÃO COM BANCO DE DADOS (implementar futuramente):
 * - Substituir o array $receitas do JavaScript por uma query SQL
 * - Usar PDO ou MySQLi para buscar as receitas do banco
 * - Passar os dados como JSON para o JavaScript via php echo json_encode()
 * - Exemplo de estrutura da query:
 *     SELECT id, titulo, episodio, categoria, imagem FROM receitas ORDER BY id
 */

// Define a página ativa para o menu
$paginaAtiva = 'receitas';

// Título da página
$tituloPagina = 'Receitas — Cozinha de Lecter';
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Receitas inspiradas na série Hannibal — análise cinematográfica e culinária dos pratos que aparecem em cada episódio.">
    
    <title><?= htmlspecialchars($tituloPagina) ?></title>
    
    <!-- Folha de estilos principal -->
    <link rel="stylesheet" href="css/style.css">

    <!--
        FRAMEWORK W3.CSS (opcional, conforme solicitado)
        Descomente a linha abaixo para ativar o W3.CSS como complemento
    -->
    <!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
</head>
<body>

    <!-- ======================================================
         MENU FIXO — Incluído de php/header.php
         ====================================================== -->
    <?php include 'php/header.php'; ?>

    <!-- ======================================================
         CONTEÚDO PRINCIPAL
         ====================================================== -->
    <main class="conteudo-principal">
        <div class="container">

            <!-- Hero / Cabeçalho da página -->
            <section class="hero">
                <h1>A Mesa de Lecter</h1>
                <div class="divisor"></div>
                <p>
                    Dez pratos. Dez episódios. Uma análise gastronômica e cinematográfica 
                    das refeições mais perturbadoramente belas da televisão.
                </p>
            </section>

            <!-- Barra de filtro ativo (oculta por padrão, exibida pelo JS ) -->
            <div id="barra-filtro" class="barra-filtro" style="display: none;" aria-live="polite">
                <!-- Preenchida dinamicamente pelo JavaScript -->
            </div>

            <!-- Grid de cards de receitas -->
            <!-- Os cards são gerados pelo JavaScript (função renderizarGrid em main.js) -->
            <!-- Quando o banco for integrado, os dados virão de uma query PHP -->
            <section id="grid-receitas" class="grid-receitas" aria-label="Lista de receitas">
                
                <!-- 
                    PLACEHOLDER DE CARREGAMENTO
                    Este conteúdo é substituído pelo JavaScript ao carregar.
                    Quando o banco for integrado, pode ser substituído por um loop PHP:
                    
                    <?php foreach ($receitas as $receita): ?>
                        <article class="card-receita" data-categoria="<?= $receita['categoria'] ?>">
                            ...
                        </article>
                    <?php endforeach; ?>
                -->
                <p style="color: var(--cor-texto-suave); font-style: italic; padding: 2rem 0;">
                    Carregando receitas...
                </p>

            </section>

        </div>
    </main>

    <!-- ======================================================
         RODAPÉ
         ====================================================== -->
    <?php include 'php/footer.php'; ?>

    <!-- ======================================================
         SCRIPTS
         O script principal é carregado no final do body para
         garantir que o DOM já esteja disponível.
         ====================================================== -->
    <script src="js/main.js"></script>

</body>
</html>
