<?php
/**
 * Esta página exibe uma lista de riscos do canibalismo.
 */

// Definir página ativa para o menu
$paginaAtiva = 'dicas';

// Título da página
$tituloPagina = 'Dicas do Chef — Cozinha de Lecter';

// Array com os riscos do canibalismo
// Cada risco tem: 'titulo' e 'descricao'
$riscos = [
    [
        'titulo'   => 'Kuru — A Doença do Riso',
        'descricao'=> 'Consumir o cérebro humano pode transmitir o Kuru, uma doença priônica fatal documentada entre o povo Fore da Papua-Nova Guiné, que praticava o canibalismo ritual. Os sintomas incluem tremores progressivos, perda de coordenação e, ironicamente, ataques de riso incontrolável — antes da morte. Não há tratamento ou cura conhecidos.'
    ],
    [
        'titulo'   => 'Doença de Creutzfeldt-Jakob (vDCJ)',
        'descricao'=> 'Além do Kuru, o consumo de tecido nervoso humano pode transmitir a variante da Doença de Creutzfeldt-Jakob, uma encefalopatia espongiforme que destrói progressivamente o tecido cerebral. O período de incubação pode durar décadas, o que significa que você pode estar incubando o problema sem saber. Os príons responsáveis resistem ao cozimento, congelamento e à maioria dos processos de esterilização.'
    ],
    [
        'titulo'   => 'Hipervitaminose A pelo Fígado',
        'descricao'=> 'O fígado humano, assim como o de outros grandes mamíferos, concentra quantidades extraordinárias de vitamina A. Uma única refeição com fígado humano pode causar hipervitaminose A aguda, cujos sintomas incluem náusea severa, dor de cabeça intensa, visão turva, descamação da pele e, em casos extremos, hipertensão intracraniana. Exploradores árticos que consumiram fígado de urso polar relataram os mesmos sintomas — e alguns não sobreviveram.'
    ],
    [
        'titulo'   => 'Risco de Transmissão de Patógenos',
        'descricao'=> 'O corpo humano é hospedeiro de inúmeros patógenos que podem ser transmitidos pelo consumo de tecidos: HIV, hepatite B e C, herpes, sífilis, entre outros. Ao contrário de animais criados para consumo, seres humanos não passam por inspeção sanitária. O cozimento pode eliminar alguns vírus, mas príons e esporos bacterianos resistem a temperaturas convencionais de preparo.'
    ],
    [
        'titulo'   => 'Toxicidade do Sangue em Grandes Quantidades',
        'descricao'=> 'O sangue humano, consumido em grandes quantidades, pode causar hipernatremia (excesso de sódio) e sobrecarga de ferro, levando a danos hepáticos e renais. Além disso, o sangue é um excelente meio de cultura para bactérias anaeróbias como Clostridium, que produzem toxinas potencialmente letais se o sangue não for consumido imediatamente após a coleta.'
    ],
    [
        'titulo'   => 'Síndrome de Windigo — O Custo Psicológico',
        'descricao'=> 'Diversas culturas indígenas norte-americanas documentaram a Síndrome de Windigo: após o consumo de carne humana (geralmente em situações de sobrevivência extrema), alguns indivíduos desenvolvem um desejo compulsivo e crescente por mais carne humana. Embora o status clínico da síndrome seja debatido, os registros históricos são numerosos. O Dr. Lecter, evidentemente, desenvolveu uma forma particularmente refinada desta condição.'
    ],
    [
        'titulo'   => 'Aspectos Legais — A Pena Não Vale o Prato',
        'descricao'=> 'Em praticamente todos os países do mundo, o canibalismo está associado a crimes de homicídio, profanação de cadáver e/ou violação de sepultura, com penas que variam de décadas de prisão à prisão perpétua. No Brasil, embora o canibalismo em si não seja tipificado como crime autônomo no Código Penal, os atos necessários para praticá-lo certamente são. O Dr. Lecter passou anos em uma instituição psiquiátrica de segurança máxima — e ele era o mais inteligente da sala.'
    ],
    [
        'titulo'   => 'Contaminação por Metais Pesados',
        'descricao'=> 'Seres humanos modernos acumulam ao longo da vida metais pesados como chumbo, mercúrio e cádmio nos tecidos — especialmente nos rins e no fígado. Consumir estes órgãos equivale a ingerir décadas de exposição ambiental concentrada em uma única refeição. A intoxicação por metais pesados causa danos neurológicos irreversíveis, insuficiência renal e uma série de complicações sistêmicas.'
    ],
    [
        'titulo'   => 'O Problema da Reciprocidade',
        'descricao'=> 'Do ponto de vista da teoria dos jogos, o canibalismo é uma estratégia evolutivamente instável: se todos os membros de uma população adotassem a prática, a população se extinguiria rapidamente. Hannibal Lecter resolve este problema sendo altamente seletivo — consumindo apenas aqueles que, em sua avaliação, são "rudes". Esta é, convenhamos, uma política de controle de qualidade bastante subjetiva.'
    ],
    [
        'titulo'   => 'Nota Final do Chef',
        'descricao'=> 'O Dr. Hannibal Lecter, MD, PhD, não endossa nenhuma das práticas descritas neste site. As receitas aqui apresentadas utilizam exclusivamente proteínas de origem animal convencional. Qualquer semelhança com cardápios de jantares reais servidos em Baltimore, Maryland, entre 2012 e 2015, é mera coincidência. Bon appétit.'
    ]
];
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Dicas gastronômicas — riscos de se consumir carne humana. Cozinha de Lecter.">
    
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
            <div class="pagina-dicas">

                <!-- ============================================================
                     CABEÇALHO DA PÁGINA
                     ============================================================ -->
                <h1>Dicas do Chef</h1>
                <div class="divisor" style="margin: 0.5rem 0 1.5rem 0;"></div>

                <!-- ============================================================
                     AVISO / DISCLAIMER
                     ============================================================ -->
                <div class="aviso-dicas">
                    <strong>Nota de responsabilidade:</strong> As informações abaixo são factualmente embasadas 
                    e têm caráter exclusivamente educativo e humorístico. Este site não incentiva, apoia ou 
                    romantiza qualquer forma de violência. O Dr. Lecter é um personagem fictício. 
                    Provavelmente.
                </div>

                <!-- ============================================================
                     LISTA DE RISCOS
                     ============================================================ -->
                <ul class="lista-riscos">
                    <?php foreach ($riscos as $index => $risco): ?>
                    <li>
                        <!-- Número do risco (01, 02, 03...) -->
                        <span class="risco-numero">
                            <?= str_pad($index + 1, 2, '0', STR_PAD_LEFT) ?>
                        </span>
                        
                        <!-- Conteúdo do risco -->
                        <div class="risco-conteudo">
                            <strong><?= htmlspecialchars($risco['titulo']) ?></strong>
                            <p><?= htmlspecialchars($risco['descricao']) ?></p>
                        </div>
                    </li>
                    <?php endforeach; ?>
                </ul>

                <!-- ============================================================
                     BOTÃO VOLTAR
                     ============================================================ -->
                <a href="index.php" class="btn-voltar" style="margin-top: 2rem; display: inline-flex;">
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
