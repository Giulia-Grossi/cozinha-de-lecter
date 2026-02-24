<?php
/**
 * Esta página apresenta informações sobre o projeto.
 */

// Definir página ativa para o menu
$paginaAtiva = 'sobre';

// Título da página
$tituloPagina = 'Sobre o Projeto — Cozinha de Lecter';
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Sobre o projeto Cozinha de Lecter — análise gastronômica e cinematográfica da série Hannibal">
    
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
            <div class="pagina-sobre">

                <!-- ============================================================
                     CABEÇALHO DA PÁGINA
                     ============================================================ -->
                <h1>Sobre o Projeto</h1>
                <p class="subtitulo">A gastronomia como linguagem cinematográfica</p>
                <div class="divisor"></div>

                <!-- ============================================================
                     PLACEHOLDER — EDITE AQUI
                     ============================================================ -->
                <div class="placeholder-texto">
                    <p>
                        Este projeto nasce da interseção entre gastronomia e linguagem audiovisual. Inspirado na série Hannibal, o site propõe uma análise da culinária como ferramenta narrativa, explorando como pratos clássicos da gastronomia internacional são utilizados como elementos simbólicos na construção estética e psicológica da obra.
                        Ao longo da série, os episódios recebem nomes de pratos reais — muitos deles pertencentes à tradição francesa, japonesa e italiana. Mais do que meras referências culinárias, esses nomes reforçam temas como refinamento, ritual, controle, identidade e transformação.
                        Este projeto não reproduz o contexto ficcional original das preparações exibidas na série. Em vez disso, apresenta:
                    </p>
                    <p>A receita tradicional real de cada prato</br>
                        Uma análise estética das cenas culinárias</br>
                        Uma reflexão sobre o papel da comida como linguagem visual</br>
                        Notas culturais sobre a origem e significado histórico das preparações</br>
                    </p>
                    <p>
                        A comida, na narrativa audiovisual, pode transcender sua função material e tornar-se símbolo. A forma como um prato é filmado — enquadramento, iluminação, textura, ritmo de montagem — comunica tanto quanto diálogos e trilha sonora.
                        A série transforma o ato de cozinhar em performance visual. O espectador é conduzido por imagens elegantes, composições simétricas e iluminação dramática que evocam pinturas barrocas e fotografias de alta gastronomia. Nesse contexto, o alimento torna-se instrumento de contraste: beleza formal versus tensão psicológica.
                    </p>
                </div>

                <!-- ============================================================
                     BOTÃO VOLTAR
                     ============================================================ -->
                <a href="index.php" class="btn-voltar" style="margin-top: 1rem; display: inline-flex;">
                    ← Voltar às receitas
                </a>

            </div>
        </div>
    </main>

    <!-- ============================================================
         RODAPÉ (Incluído de php/footer.php)
         ============================================================ -->
    <?php include 'php/footer.php'; ?>

</body>
</html>
