-- ============================================================
-- Este script cria o banco de dados, as tabelas e insere
-- as 10 receitas com seus ingredientes e passos de preparo.
-- ============================================================

-- Criar banco de dados
CREATE DATABASE IF NOT EXISTS cozinha_lecter 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

-- Usar o banco de dados
USE cozinha_lecter;

-- ============================================================
-- TABELA: RECEITAS
-- ============================================================
-- Armazena as informações principais de cada receita
CREATE TABLE IF NOT EXISTS receitas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    episodio VARCHAR(100) NOT NULL,          -- Ex: "T1E01 — Apéritif"
    titulo VARCHAR(200) NOT NULL,            -- Nome da receita
    categoria VARCHAR(50) NOT NULL,          -- Categoria (entradas, sopas, etc)
    imagem VARCHAR(255),                     -- Caminho da imagem (pode ser NULL)
    descricao LONGTEXT NOT NULL,             -- Análise cinematográfica
    curiosidade LONGTEXT NOT NULL,           -- Nota cultural/histórica
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- TABELA: INGREDIENTES
-- ============================================================
-- Armazena os ingredientes de cada receita
CREATE TABLE IF NOT EXISTS ingredientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    receita_id INT NOT NULL,                 -- ID da receita (referência)
    descricao VARCHAR(255) NOT NULL,         -- Descrição do ingrediente
    ordem INT NOT NULL,                      -- Ordem de exibição
    FOREIGN KEY (receita_id) REFERENCES receitas(id) ON DELETE CASCADE
);

-- ============================================================
-- TABELA: PASSOS_PREPARO
-- ============================================================
-- Armazena os passos do modo de preparo de cada receita
CREATE TABLE IF NOT EXISTS passos_preparo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    receita_id INT NOT NULL,                 -- ID da receita (referência)
    descricao TEXT NOT NULL,                 -- Descrição do passo
    ordem INT NOT NULL,                      -- Ordem de exibição
    FOREIGN KEY (receita_id) REFERENCES receitas(id) ON DELETE CASCADE
);

-- ============================================================
-- INSERIR RECEITAS
-- ============================================================

-- RECEITA 1: Ovo Escalfado com Aspargos e Presunto de Parma
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T1E01 — Apéritif',
    'Ovo Escalfado com Aspargos e Presunto de Parma',
    'entradas',
    NULL,
    'No episódio piloto da série, Hannibal Lecter é apresentado ao espectador não como um monstro, mas como um anfitrião refinado e um chef de talento excepcional. A primeira cena em que o vemos cozinhando estabelece o tom para toda a série: a câmera se move lentamente enquanto Hannibal prepara um ovo escalfado com precisão cirúrgica, cada movimento deliberado e elegante. O ovo, com sua gema intacta e tremulante, representa a fragilidade e a beleza que Hannibal vê em seus pratos — e, por extensão, em suas vítimas. O episódio "Apéritif" (Aperitivo) é um convite para entrar no mundo de Hannibal, e este prato é o primeiro gosto daquilo que está por vir.',
    'O ovo escalfado (ou poché) é uma técnica francesa que data do século XV, originalmente desenvolvida para preservar ovos sem casca em períodos de escassez. A técnica requer precisão: a água deve estar na temperatura exata (entre 80-90°C), e o ovo deve ser deslizado delicadamente para evitar que a clara se disperse. O presunto de Parma, com sua história de 2000 anos, é considerado um dos presuntos mais refinados do mundo, curado naturalmente com ar das montanhas de Emília-Romanha. A combinação de ovo escalfado com presunto é um clássico da culinária francesa, frequentemente servido em brunch elegantes.'
);

-- Ingredientes da receita 1
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(1, '4 ovos frescos', 1),
(1, '8 talos de aspargo verde', 2),
(1, '4 fatias de presunto de Parma', 3),
(1, '2 colheres de sopa de vinagre branco', 4),
(1, '1 colher de sopa de manteiga', 5),
(1, 'Sal e pimenta-do-reino a gosto', 6),
(1, 'Água filtrada (1 litro)', 7);

-- Passos da receita 1
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(1, 'Aqueça uma panela funda com água e o vinagre branco até quase ferver (80-90°C). O vinagre ajuda a coagular a clara do ovo.', 1),
(1, 'Enquanto isso, grelhe os aspargos em frigideira com manteiga até ficarem ligeiramente macios, cerca de 4-5 minutos. Tempere com sal e pimenta.', 2),
(1, 'Quebre cada ovo individualmente em uma xícara pequena ou tigela. Isso facilita o deslizamento suave na água.', 3),
(1, 'Crie um redemoinho suave na água com uma colher. Deslize o ovo no centro do redemoinho — a clara se enrolará ao redor da gema.', 4),
(1, 'Cozinhe por 3-4 minutos, até que a clara fique opaca mas a gema permaneça mole. Retire com escumadeira.', 5),
(1, 'Monte o prato: disponha os aspargos, sobreponha o presunto de Parma em dobras elegantes e coloque o ovo escalfado no topo.', 6),
(1, 'Finalize com uma pitada de sal, pimenta-do-reino moída na hora e um fio de azeite extra virgem.', 7);

-- ============================================================

-- RECEITA 2: Potage de Raízes com Creme Fraîche
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T1E03 — Potage',
    'Potage de Raízes com Creme Fraîche',
    'sopas',
    NULL,
    'O episódio "Potage" marca um ponto de virada na série, onde Hannibal começa a tecer sua teia ao redor de Will Graham. A sopa que ele prepara é uma metáfora visual para a complexidade e profundidade do personagem: camadas de sabor, texturas que se complementam, e uma elegância que mascara algo mais sinistro. A câmera se detém nos ingredientes sendo cortados com precisão, cada fatia uma obra de arte. A sopa fumegante, servida em uma tigela branca imaculada, é tanto um convite quanto uma ameaça — um gesto de hospitalidade que oculta intenções muito mais sombrias.',
    'O potage é uma categoria de sopas francesas que remonta ao século XVII, quando era considerado um prato de elite. A palavra vem do francês "pot" (panela), sugerindo que era cozido em um único recipiente. Historicamente, o potage era feito com legumes da estação, caldo e, frequentemente, carne. A adição de creme fraîche não apenas enriquece o sabor, mas também adiciona uma textura aveludada que era altamente valorizada na culinária clássica francesa. Raízes como cenoura, nabo e batata são símbolos de rusticidade e terra — uma ironia interessante quando preparadas por alguém tão refinado quanto Hannibal.'
);

-- Ingredientes da receita 2
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(2, '3 cenouras médias, descascadas e cortadas em cubos', 1),
(2, '2 nabos médios, descascados e cortados em cubos', 2),
(2, '2 batatas médias, descascadas e cortadas em cubos', 3),
(2, '1 cebola grande, picada', 4),
(2, '4 dentes de alho, minados', 5),
(2, '1 litro de caldo de legumes (ou água)', 6),
(2, '200ml de creme fraîche', 7),
(2, '2 colheres de sopa de manteiga', 8),
(2, 'Sal, pimenta-do-reino e noz-moscada a gosto', 9);

-- Passos da receita 2
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(2, 'Derreta a manteiga em uma panela grande. Refogue a cebola e o alho até ficarem macios e aromáticos, cerca de 3 minutos.', 1),
(2, 'Adicione os cubos de cenoura, nabo e batata. Mexa bem para cobrir com a manteiga. Cozinhe por 5 minutos.', 2),
(2, 'Despeje o caldo de legumes. Leve a fogo alto até ferver, depois reduza para fogo médio.', 3),
(2, 'Cozinhe por 20-25 minutos, até que todos os legumes estejam muito macios.', 4),
(2, 'Retire do fogo e deixe esfriar ligeiramente. Usando um liquidificador ou processador, bata a sopa até ficar completamente suave.', 5),
(2, 'Retorne a sopa à panela. Aquça em fogo baixo e adicione o creme fraîche, mexendo constantemente.', 6),
(2, 'Tempere com sal, pimenta-do-reino e uma pitada de noz-moscada. Cozinhe por mais 2 minutos.', 7),
(2, 'Sirva quente, com um fio de azeite extra virgem e talvez um pouco de creme fraîche fresco no topo.', 8);

-- ============================================================

-- RECEITA 3: Vieiras Gratinadas à Saint-Jacques
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T1E05 — Coquilles',
    'Vieiras Gratinadas à Saint-Jacques',
    'frutos-do-mar',
    NULL,
    'Em "Coquilles" (Conchas), Hannibal prepara um prato que é tanto uma celebração da culinária francesa quanto uma declaração de sua sofisticação. As vieiras, com sua textura delicada e sabor sutil, são apresentadas em suas conchas naturais — um toque teatral que Hannibal adora. A câmera captura o dourado perfeito do gratim, o vapor subindo das conchas, a precisão com que o prato é montado. É um momento de pura beleza culinária, mas também de tensão: sabemos que por trás dessa elegância há algo muito mais perturbador. O prato é um espelho da própria natureza de Hannibal: belo, refinado, e potencialmente mortal.',
    'As vieiras (Pecten maximus) têm sido consideradas um iguaria desde a Idade Média, quando os peregrinos que viajavam para Santiago de Compostela as usavam como símbolo de sua jornada. A concha da vieira tornou-se um ícone religioso e culinário. O prato "Coquilles Saint-Jacques" (Vieiras de São Tiago) é um clássico francês que combina vieiras com um molho cremoso, frequentemente gratinado com pão ralado e queijo. A técnica de grelhar vieiras requer precisão: cozimento excessivo as torna borrachudas, enquanto cozimento insuficiente deixa a textura desagradável. É um prato que separa os chefs amadores dos profissionais.'
);

-- Ingredientes da receita 3
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(3, '12 vieiras grandes, limpas', 1),
(3, '100g de manteiga', 2),
(3, '3 dentes de alho, minados', 3),
(3, '200ml de vinho branco seco', 4),
(3, '200ml de caldo de peixe', 5),
(3, '100ml de creme de leite', 6),
(3, '50g de pão ralado', 7),
(3, '50g de queijo parmesão ralado', 8),
(3, 'Sal, pimenta-do-reino e suco de limão a gosto', 9);

-- Passos da receita 3
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(3, 'Pré-aqueça o forno a 200°C. Limpe as conchas das vieiras com água fria e seque bem com papel toalha.', 1),
(3, 'Em uma panela, derreta 50g de manteiga e refogue o alho até ficar aromático, cerca de 1 minuto.', 2),
(3, 'Adicione o vinho branco e deixe reduzir pela metade, cerca de 3 minutos.', 3),
(3, 'Despeje o caldo de peixe e cozinhe por mais 5 minutos. Adicione o creme de leite e mexa bem.', 4),
(3, 'Tempere a mistura com sal, pimenta e suco de limão. Reserve.', 5),
(3, 'Coloque as vieiras em uma assadeira. Distribua o molho sobre cada vieira.', 6),
(3, 'Em uma tigela, misture o pão ralado, queijo parmesão e o restante da manteiga derretida.', 7),
(3, 'Polvilhe a mistura de pão sobre cada vieira. Asse por 12-15 minutos, até que o topo fique dourado.', 8),
(3, 'Sirva imediatamente, enquanto ainda está quente e o gratim está crocante.', 9);

-- ============================================================

-- RECEITA 4: Sorbet de Limão-Siciliano com Hortelã
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T1E07 — Sorbet',
    'Sorbet de Limão-Siciliano com Hortelã',
    'sobremesas',
    NULL,
    'O episódio "Sorbet" é um interlúdio de leveza em uma série cada vez mais sombria. Hannibal prepara um sorbet — um palato limpador tradicional da culinária francesa — que é tanto uma demonstração de técnica quanto um momento de respiro. A câmera captura os cristais de gelo se formando, a cor amarela vibrante do limão, a frescura da hortelã. É um prato que representa a dualidade de Hannibal: refinado e sofisticado na superfície, mas com uma frieza subjacente. O sorbet, afinal, é feito de gelo — e há algo de gelado no coração de Hannibal que nenhuma quantidade de culinária refinada pode aquecer.',
    'O sorbet é uma sobremesa gelada que remonta ao século XVI, quando era um luxo exclusivo da realeza europeia. Originalmente feito com neve das montanhas, o sorbet era um símbolo de status e riqueza. O sorbet de limão é particularmente tradicional na Sicília, onde o limão-siciliano (Citrus limon) é cultivado há séculos. O limão-siciliano é conhecido por sua acidez equilibrada e seu aroma intenso. Historicamente, o sorbet era servido entre pratos em jantares de múltiplos cursos para "limpar o palato" — uma função que persiste até hoje na culinária refinada.'
);

-- Ingredientes da receita 4
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(4, '6 limões-sicilianos grandes', 1),
(4, '200g de açúcar', 2),
(4, '500ml de água filtrada', 3),
(4, '30ml de xarope simples (açúcar + água)', 4),
(4, 'Folhas de hortelã fresca', 5),
(4, 'Sal a gosto', 6);

-- Passos da receita 4
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(4, 'Esprema os limões para obter 300ml de suco fresco. Reserve também as cascas para decoração.', 1),
(4, 'Em uma panela, combine a água e o açúcar. Leve ao fogo e mexa até o açúcar dissolver completamente.', 2),
(4, 'Deixe o xarope esfriar completamente (cerca de 30 minutos).', 3),
(4, 'Misture o suco de limão fresco com o xarope resfriado. Adicione uma pitada de sal.', 4),
(4, 'Se tiver uma sorveteira, siga as instruções do fabricante. Caso contrário, despeje a mistura em uma assadeira rasa e coloque no congelador.', 5),
(4, 'A cada 30 minutos, retire do congelador e misture com um garfo para quebrar os cristais. Repita 3-4 vezes até obter uma textura cremosa.', 6),
(4, 'Sirva em taças geladas, decorado com folhas de hortelã fresca e, se desejar, uma fatia fina de limão.', 7);

-- ============================================================

-- RECEITA 5: Kaiseki — Menu Degustação Japonês
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T2E01 — Kaiseki',
    'Kaiseki — Menu Degustação Japonês',
    'pratos-principais',
    NULL,
    'Na segunda temporada, Hannibal leva a culinária a um novo nível com um menu Kaiseki — a forma mais elevada da culinária tradicional japonesa. O episódio "Kaiseki" é uma celebração visual da precisão, do equilíbrio e da harmonia — valores centrais tanto do Kaiseki quanto da filosofia de Hannibal. Cada prato é apresentado com reverência, cada movimento é calculado, cada sabor é uma declaração. A câmera se move lentamente através de cada curso, capturando a beleza de cada prato. É um momento em que a série transcende o crime e se torna uma meditação sobre a arte, a beleza e a obsessão.',
    'O Kaiseki é a forma mais refinada da culinária tradicional japonesa, desenvolvida durante a era Edo (1603-1868) como acompanhamento para a cerimônia do chá. A palavra "Kaiseki" significa literalmente "pedra no peito" — referindo-se à prática de monges budistas de colocar pedras quentes em seus peitos para aliviar a fome durante meditações prolongadas. Um menu Kaiseki típico consiste de 8-12 cursos, cada um preparado com ingredientes sazonais e apresentado com cuidado extremo. Cada prato é uma obra de arte, tanto visualmente quanto no paladar. A filosofia do Kaiseki enfatiza o equilíbrio, a harmonia e o respeito pelos ingredientes — valores que, ironicamente, Hannibal compartilha, mesmo que de forma distorcida.'
);

-- Ingredientes da receita 5 (Simplificado - um curso representativo)
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(5, '200g de peixe branco fresco (como robalo ou linguado)', 1),
(5, '100g de legumes sazonais (cenoura, abóbora, broto de bambu)', 2),
(5, '50ml de molho dashi (caldo de peixe japonês)', 3),
(5, '1 colher de chá de mirin (vinho de arroz adoçado)', 4),
(5, '1 colher de chá de shoyu (molho de soja)', 5),
(5, 'Wasabi e gengibre em conserva para acompanhamento', 6),
(5, 'Alga nori para decoração', 7);

-- Passos da receita 5
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(5, 'Prepare o dashi aquecendo água com kombu (alga) e bonito seco. Coe e reserve.', 1),
(5, 'Corte o peixe em fatias finas e precisas. A apresentação é tão importante quanto o sabor.', 2),
(5, 'Cozinhe os legumes no dashi com mirin e shoyu até ficarem macios mas ainda com textura.', 3),
(5, 'Disponha o peixe em um prato de cerâmica branca, cercado pelos legumes e seu caldo.', 4),
(5, 'Decore com alga nori cortada em tiras finas e uma pequena quantidade de wasabi.', 5),
(5, 'Sirva imediatamente, em temperatura adequada, com reverência e atenção aos detalhes visuais.', 6);

-- ============================================================

-- RECEITA 6: Takiawase — Legumes Cozidos em Dashi
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T2E04 — Takiawase',
    'Takiawase — Legumes Cozidos em Dashi',
    'pratos-principais',
    NULL,
    'O episódio "Takiawase" continua a exploração de Hannibal pela culinária japonesa, focando em um prato de legumes que é, à primeira vista, simples. Mas como tudo em Hannibal, há profundidade sob a superfície. O Takiawase é um exercício de contenção e controle — apenas os ingredientes mais finos, preparados com a técnica mais pura. A câmera captura o vapor subindo dos legumes, a cor vibrante de cada ingrediente, a perfeição da apresentação. É um prato que fala sobre a beleza encontrada na simplicidade, e sobre o controle absoluto que Hannibal exerce sobre tudo ao seu redor.',
    'Takiawase é um prato tradicional do Kaiseki que consiste em legumes cozidos separadamente em dashi e depois apresentados juntos em um prato. A palavra "takiawase" significa literalmente "cozido junto", mas a técnica envolve cozinhar cada ingrediente individualmente para preservar seus sabores e texturas únicas. Cada legume é escolhido pela estação e pela sua representação simbólica. O Takiawase é um exercício de minimalismo e precisão — não há espaço para erro, não há lugar para esconder técnica inadequada. É a culinária no seu nível mais puro e mais desafiador.'
);

-- Ingredientes da receita 6
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(6, '100g de cenoura, cortada em formas decorativas', 1),
(6, '100g de abóbora, cortada em cubos', 2),
(6, '100g de broto de bambu, cortado em tiras', 3),
(6, '100g de raiz de lótus, fatiada', 4),
(6, '500ml de dashi (caldo de peixe japonês)', 5),
(6, '2 colheres de sopa de mirin', 6),
(6, '2 colheres de sopa de shoyu', 7),
(6, 'Sal a gosto', 8);

-- Passos da receita 6
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(6, 'Prepare o dashi fresco aquecendo água com kombu e bonito seco. Coe e reserve.', 1),
(6, 'Em uma panela pequena, combine o dashi com mirin e shoyu. Leve ao fogo.', 2),
(6, 'Cozinhe a cenoura primeiro (cerca de 5 minutos), depois retire e reserve.', 3),
(6, 'Na mesma panela, cozinhe a abóbora (cerca de 5 minutos), depois retire e reserve.', 4),
(6, 'Cozinhe o broto de bambu (cerca de 3 minutos), depois retire e reserve.', 5),
(6, 'Cozinhe a raiz de lótus (cerca de 4 minutos), depois retire e reserve.', 6),
(6, 'Disponha todos os legumes em um prato de cerâmica, cada um em seu próprio espaço. Despeje um pouco do caldo sobre cada ingrediente.', 7),
(6, 'Sirva em temperatura adequada, com a apresentação visual sendo tão importante quanto o sabor.', 8);

-- ============================================================

-- RECEITA 7: Carpaccio de Filé Mignon
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T2E10 — Naka-Choko',
    'Carpaccio de Filé Mignon',
    'entradas',
    NULL,
    'Em "Naka-Choko", Hannibal prepara um carpaccio — carne crua, fatiada finamente, apresentada com elegância. O prato é uma afirmação de confiança e controle: apenas a carne mais fina, preparada com a técnica mais pura. A câmera captura as fatias translúcidas de carne, o brilho do azeite, a cor vibrante dos acompanhamentos. É um prato que existe na fronteira entre a culinária refinada e algo mais perturbador — carne crua, servida com elegância, é tanto um prato sofisticado quanto um ato de violência contida. Para Hannibal, essa ambiguidade é precisamente o ponto.',
    'O carpaccio é um prato italiano que remonta ao século XV, quando foi criado em Veneza. Originalmente feito com carne de carne vermelha fatiada finamente e servida crua com azeite, limão e sal, o carpaccio é um exercício de confiança — confiança na qualidade da carne, na higiene, na técnica. O prato foi nomeado em homenagem ao pintor renascentista Vittore Carpaccio, cujas pinturas apresentavam cores vermelhas e brancas vibrantes que lembravam o prato. Um verdadeiro carpaccio requer carne de qualidade excepcional, congelada ligeiramente para facilitar o corte em fatias ultrafinas, e apresentada com acompanhamentos mínimos que não ofusquem o sabor da carne.'
);

-- Ingredientes da receita 7
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(7, '300g de filé mignon de qualidade excepcional, congelado ligeiramente', 1),
(7, '100ml de azeite extra virgem de qualidade premium', 2),
(7, '2 limões frescos', 3),
(7, '50g de queijo parmesão em lascas', 4),
(7, '50g de rúcula fresca', 5),
(7, 'Sal marinho e pimenta-do-reino a gosto', 6),
(7, 'Alcaparras e azeitonas para acompanhamento (opcional)', 7);

-- Passos da receita 7
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(7, 'Congele o filé mignon por 1-2 horas até ficar ligeiramente firme, mas não completamente congelado.', 1),
(7, 'Com uma faca muito afiada, corte o filé em fatias ultrafinas (cerca de 2-3mm). A técnica é crucial.', 2),
(7, 'Disponha as fatias em um prato de porcelana branca, sobrepondo-as ligeiramente.', 3),
(7, 'Regue com azeite extra virgem de qualidade premium. Esprema suco de limão fresco sobre a carne.', 4),
(7, 'Tempere com sal marinho e pimenta-do-reino moída na hora.', 5),
(7, 'Distribua lascas de queijo parmesão sobre a carne. Adicione rúcula fresca em torno do prato.', 6),
(7, 'Se desejar, adicione alcaparras ou azeitonas como acompanhamento.', 7),
(7, 'Sirva imediatamente, enquanto a carne ainda está fria.', 8);

-- ============================================================

-- RECEITA 8: Antipasto della Casa
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T3E01 — Antipasto',
    'Antipasto della Casa',
    'entradas',
    NULL,
    'Na terceira temporada, Hannibal retorna com um antipasto — uma seleção de ingredientes italianos preparados com cuidado extremo. O episódio "Antipasto" é um retorno às origens, uma reafirmação de que Hannibal continua sendo o mestre absoluto da culinária. O antipasto é apresentado como um convite, uma promessa de prazeres culinários que estão por vir. Cada ingrediente é escolhido com precisão, cada apresentação é calculada. É um prato que fala sobre abundância e controle simultâneos — uma profusão de ingredientes, mas cada um em seu lugar exato.',
    'Antipasto significa literalmente "antes do pasto" em italiano, referindo-se aos pratos servidos antes do prato principal em uma refeição italiana tradicional. O antipasto pode incluir uma variedade de ingredientes: carnes curadas, queijos, legumes em conserva, azeitonas, peixes em conserva, e muito mais. Historicamente, o antipasto era uma forma de aproveitar ingredientes preservados durante o inverno, transformando-os em um prato elegante e sofisticado. Um verdadeiro antipasto della casa é uma expressão da identidade culinária do chef — cada seleção reflete seu gosto, sua herança, e sua compreensão da harmonia de sabores.'
);

-- Ingredientes da receita 8
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(8, '100g de presunto de Parma, fatiado finamente', 1),
(8, '100g de mortadela, fatiada', 2),
(8, '100g de salame italiano, fatiado', 3),
(8, '100g de queijo parmesão em lascas', 4),
(8, '100g de mozzarella fresca', 5),
(8, '100g de azeitonas mistas (pretas e verdes)', 6),
(8, '100g de legumes em conserva (pimentão, cebola, cenoura)', 7),
(8, '100g de peperoncini (pimentas em conserva)', 8),
(8, '50ml de azeite extra virgem', 9),
(8, 'Pão tostado para acompanhamento', 10);

-- Passos da receita 8
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(8, 'Organize todos os ingredientes em um grande prato ou tábua de madeira.', 1),
(8, 'Dispon ha o presunto, mortadela e salame em dobras elegantes.', 2),
(8, 'Coloque os queijos em grupos separados, com as lascas de parmesão em um monte.', 3),
(8, 'Distribua as azeitonas, legumes em conserva e peperoncini em pequenas tigelas ou grupos.', 4),
(8, 'Regue tudo com azeite extra virgem de qualidade premium.', 5),
(8, 'Sirva com pão tostado fresco. A apresentação é tão importante quanto os ingredientes.', 6);

-- ============================================================

-- RECEITA 9: Panna Cotta com Calda de Frutas Vermelhas
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T3E06 — Dolce',
    'Panna Cotta com Calda de Frutas Vermelhas',
    'sobremesas',
    NULL,
    'Em "Dolce" (Doce), Hannibal prepara uma panna cotta — um prato que é ao mesmo tempo simples e profundamente sofisticado. A panna cotta é branca, pura, quase imaculada — até que a calda de frutas vermelhas é despejada sobre ela, criando um contraste visual que é simultaneamente belo e perturbador. A câmera captura a cor vermelha escura da calda se espalhando pela panna cotta branca, criando padrões que lembram sangue em neve. É uma imagem que captura a essência de Hannibal: beleza e horror entrelaçados, elegância e violência coexistindo em perfeita harmonia.',
    'Panna cotta significa literalmente "creme cozido" em italiano, e é um prato que remonta ao século XVI. A panna cotta tradicional é feita com creme de leite, açúcar e gelatina, cozida em banho-maria até ficar cremosa e suave. O prato é notável por sua simplicidade — apenas três ingredientes principais — e sua elegância. A panna cotta é frequentemente servida com frutas frescas ou caldas de frutas, criando um contraste de texturas e sabores. A cor vermelha das frutas vermelhas contra a brancura da panna cotta é um clássico da culinária italiana, e é precisamente esse contraste visual que torna o prato tão memorável.'
);

-- Ingredientes da receita 9
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(9, '500ml de creme de leite integral', 1),
(9, '100g de açúcar', 2),
(9, '1 colher de chá de extrato de baunilha', 3),
(9, '2 folhas de gelatina (ou 1 colher de chá de gelatina em pó)', 4),
(9, '300g de frutas vermelhas mistas (morango, framboesa, amora)', 5),
(9, '100g de açúcar para a calda', 6),
(9, '50ml de água', 7);

-- Passos da receita 9
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(9, 'Se usar gelatina em folhas, hidrate em água fria por 5 minutos. Se usar em pó, dissolva em 3 colheres de sopa de água morna.', 1),
(9, 'Em uma panela, combine o creme de leite com 100g de açúcar e o extrato de baunilha. Aquça até quase ferver, mas não deixe fervir.', 2),
(9, 'Retire do fogo e adicione a gelatina hidratada, mexendo bem até dissolver completamente.', 3),
(9, 'Despeje a mistura em taças ou formas de panna cotta. Deixe esfriar até temperatura ambiente.', 4),
(9, 'Refrigere por pelo menos 4 horas (ou durante a noite) até ficar firme.', 5),
(9, 'Para a calda: combine as frutas vermelhas com 100g de açúcar e 50ml de água em uma panela. Cozinhe em fogo médio por 10 minutos, mexendo ocasionalmente.', 6),
(9, 'Coe a calda para remover as sementes, se desejar uma textura mais suave.', 7),
(9, 'Desenforme a panna cotta em um prato ou sirva na própria taça. Despeje a calda de frutas vermelhas sobre a panna cotta.', 8),
(9, 'Sirva gelado, com a calda vermelha criando um contraste visual impressionante.', 9);

-- ============================================================

-- RECEITA 10: Agneau Rôti — Cordeiro Assado com Ervas Provençais
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T3E13 — The Wrath of the Lamb',
    'Agneau Rôti — Cordeiro Assado com Ervas Provençais',
    'pratos-principais',
    NULL,
    'No episódio final da série, "The Wrath of the Lamb" (A Ira do Cordeiro), Hannibal prepara um cordeiro assado — um retorno aos clássicos, mas elevado a um nível de perfeição que apenas Hannibal pode alcançar. O título do episódio é uma referência bíblica, e o cordeiro é um símbolo carregado de significado: inocência, sacrifício, redenção. Mas em Hannibal, o cordeiro é também um ato final de desafio — uma reafirmação de que Hannibal permanece o mestre absoluto de sua arte, mesmo quando tudo ao seu redor desaba. A câmera captura o cordeiro dourado, as ervas aromáticas, o vapor subindo do prato. É um momento de beleza pura, um último ato de criação antes do caos final.',
    'O cordeiro assado com ervas provençais é um clássico da culinária francesa, particularmente associado à região da Provença, no sul da França. As ervas provençais — tomilho, alecrim, manjerona, sálvia — crescem selvagens nas colinas rochosas da Provença e têm sido usadas na culinária local por séculos. O cordeiro, com sua carne delicada e sabor distinto, é considerado uma iguaria em toda a Europa. O prato "Agneau Rôti" é uma celebração da culinária clássica francesa, uma demonstração de técnica e compreensão dos sabores. Para Hannibal, é também um ato de defiance — uma afirmação de que, não importa o que aconteça, ele permanece um artista.'
);

-- Ingredientes da receita 10
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(10, '1 perna de cordeiro (cerca de 1,5kg)', 1),
(10, '6 dentes de alho, fatiados', 2),
(10, '3 colheres de sopa de ervas provençais secas (ou 6 colheres de sopa frescas)', 3),
(10, '100ml de azeite extra virgem', 4),
(10, '200ml de vinho tinto', 5),
(10, '200ml de caldo de carne', 6),
(10, '2 cebolas médias, cortadas em quartos', 7),
(10, '500g de batatas pequenas', 8),
(10, 'Sal, pimenta-do-reino e suco de limão a gosto', 9);

-- Passos da receita 10
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(10, 'Pré-aqueça o forno a 200°C.', 1),
(10, 'Com uma faca pequena, faça pequenos cortes na pele do cordeiro e insira os fatias de alho nos cortes.', 2),
(10, 'Esfregue o cordeiro com as ervas provençais, sal, pimenta e azeite, cobrindo toda a superfície.', 3),
(10, 'Coloque o cordeiro em uma assadeira. Distribua as cebolas e batatas ao redor.', 4),
(10, 'Asse por 20 minutos a 200°C, depois reduza a temperatura para 180°C e continue assando por mais 1 hora (para carne média-rara).', 5),
(10, 'Retire o cordeiro do forno e deixe descansar por 10 minutos (isso permite que os sucos se redistribuam).', 6),
(10, 'Coloque a assadeira no fogão em fogo médio. Despeje o vinho tinto e raspe os sucos caramelizados do fundo.', 7),
(10, 'Adicione o caldo de carne e deixe reduzir por 5 minutos. Tempere com sal, pimenta e suco de limão.', 8),
(10, 'Fatia o cordeiro e sirva com as batatas, cebolas e o molho reduzido.', 9),
(10, 'Sirva quente, com um copo de vinho tinto de qualidade.', 10);