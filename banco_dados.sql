-- Este script cria o banco de dados, as tabelas e insere
-- as 10 receitas com seus ingredientes e passos de preparo.
-- 
-- RECEITAS ATUALIZADAS CONFORME SOLICITADO:
-- T1EP1 - Aperitif: Beef Bourguignonne
-- T1EP2 - Amuse-Bouche: Amuse-Bouche
-- T1EP4 - Oeuf: Eggs with Sausages
-- T1EP6 - Entree: Wine Jelly
-- T1EP8 - Fromage: Paella on the Rocks
-- T1EP9 - Trou Normand: Tenderloin and Lotus
-- T1EP10 - Buffet Froid: Jamon Iberico
-- T1EP11 - Roti: Curried Chitterlings
-- T1EP12 - Releves: Silkie Soup
-- T3EP13 - The Wrath of The Lamb: Grand Fruit and Flower Garnished Kalua-Roast Leg

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
CREATE TABLE IF NOT EXISTS receitas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    episodio VARCHAR(100) NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    imagem VARCHAR(255),
    descricao LONGTEXT NOT NULL,
    curiosidade LONGTEXT NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- TABELA: INGREDIENTES
-- ============================================================
CREATE TABLE IF NOT EXISTS ingredientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    receita_id INT NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    ordem INT NOT NULL,
    FOREIGN KEY (receita_id) REFERENCES receitas(id) ON DELETE CASCADE
);

-- ============================================================
-- TABELA: PASSOS_PREPARO
-- ============================================================
CREATE TABLE IF NOT EXISTS passos_preparo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    receita_id INT NOT NULL,
    descricao TEXT NOT NULL,
    ordem INT NOT NULL,
    FOREIGN KEY (receita_id) REFERENCES receitas(id) ON DELETE CASCADE
);

-- ============================================================
-- INSERIR RECEITAS
-- ============================================================

-- RECEITA 1: Beef Bourguignonne
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T1EP1 — Aperitif',
    'Beef Bourguignonne',
    'pratos-principais',
    NULL,
    'No episódio piloto "Aperitif", Hannibal Lecter é apresentado ao espectador não como um monstro, mas como um chef de talento excepcional. A primeira cena em que o vemos cozinhando estabelece o tom para toda a série: a câmera se move lentamente enquanto Hannibal prepara um Beef Bourguignonne com precisão cirúrgica. Este é um prato clássico da culinária francesa, que requer paciência, técnica e uma compreensão profunda dos sabores. O vinho tinto, a carne macia, os legumes caramelizados — tudo é uma metáfora para a sofisticação de Hannibal, que mascara algo muito mais sinistro por baixo.',
    'Beef Bourguignonne é um prato clássico da região de Borgonha, na França, que remonta ao século XVI. Historicamente, era um prato de camponeses que aproveitava cortes de carne menos nobres e os transformava em algo extraordinário através de cozimento lento e vinho. A técnica de braising (cozimento em molho) permite que a carne se torne extremamente macia enquanto absorve os sabores do vinho, das ervas e dos legumes. O prato ganhou fama internacional através do livro "Mastering the Art of French Cooking" de Julia Child, publicado em 1961.'
);

-- Ingredientes da receita 1
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(1, '1,5kg de carne de vaca (chuck ou brisket), cortada em cubos', 1),
(1, '200g de bacon, cortado em cubos', 2),
(1, '3 cenouras médias, cortadas em bastões', 3),
(1, '2 cebolas médias, cortadas em quartos', 4),
(1, '250g de cogumelos inteiros', 5),
(1, '4 dentes de alho, minados', 6),
(1, '750ml de vinho tinto de qualidade', 7),
(1, '500ml de caldo de carne', 8),
(1, '2 colheres de sopa de pasta de tomate', 9),
(1, '2 folhas de louro', 10),
(1, '3 ramos de tomilho fresco', 11),
(1, '2 colheres de sopa de azeite', 12),
(1, 'Sal, pimenta-do-reino e farinha de trigo a gosto', 13);

-- Passos da receita 1
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(1, 'Pré-aqueça o forno a 160°C.', 1),
(1, 'Em uma panela grande, frite o bacon até ficar crocante. Retire e reserve.', 2),
(1, 'Na mesma panela com a gordura do bacon, sele a carne em lotes até ficar dourada de todos os lados. Retire e reserve.', 3),
(1, 'Adicione as cebolas e cenouras à panela. Refogue até ficarem ligeiramente caramelizadas, cerca de 5 minutos.', 4),
(1, 'Adicione o alho e a pasta de tomate. Mexa bem e cozinhe por 2 minutos.', 5),
(1, 'Polvilhe farinha sobre os legumes e mexa para criar um roux (pasta espessante).', 6),
(1, 'Despeje o vinho tinto e raspe os sucos caramelizados do fundo da panela com uma colher de madeira.', 7),
(1, 'Adicione o caldo de carne, a carne reservada, o bacon, as folhas de louro e o tomilho.', 8),
(1, 'Leve a fogo alto até ferver, depois cubra e coloque no forno por 2,5 a 3 horas, até a carne estar muito macia.', 9),
(1, 'Retire do forno e adicione os cogumelos. Cozinhe no forno por mais 30 minutos.', 10),
(1, 'Tempere com sal e pimenta. Sirva quente com batatas ou pão fresco.', 11);

-- ============================================================

-- RECEITA 2: Amuse-Bouche
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T1EP2 — Amuse-Bouche',
    'Amuse-Bouche',
    'entradas',
    NULL,
    'Em "Amuse-Bouche", Hannibal prepara um pequeno apertivo — uma entrada que é tanto uma demonstração de técnica quanto um convite para o que está por vir. O amuse-bouche é um conceito francês que significa literalmente "diversão para a boca" — um pequeno prato servido antes do menu principal, projetado para despertar o paladar e estabelecer o tom para a refeição. Para Hannibal, é também um ato de sedução, uma forma de ganhar a confiança de seus convidados através da culinária.',
    'O amuse-bouche é uma tradição da alta culinária francesa que ganhou popularidade no século XX. É um prato que não aparece no menu — é uma surpresa oferecida pelo chef. O objetivo é criar uma primeira impressão memorável, demonstrando a criatividade e a técnica do chef. Um verdadeiro amuse-bouche é pequeno (geralmente apenas um ou dois bocados), visualmente impressionante, e oferece uma explosão de sabor. Para Hannibal, o amuse-bouche é uma metáfora perfeita: pequeno, refinado, e potencialmente perigoso.'
);

-- Ingredientes da receita 2
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(2, '100g de foie gras de qualidade premium', 1),
(2, '50g de geleia de porto', 2),
(2, '4 fatias finas de pão de centeio tostado', 3),
(2, '30g de trufas negras raladas', 4),
(2, '20ml de azeite trufa', 5),
(2, 'Flor de sal e pimenta-do-reino a gosto', 6),
(2, 'Microgreens para decoração', 7);

-- Passos da receita 2
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(2, 'Retire o foie gras do refrigerador 15 minutos antes de servir para que fique ligeiramente macio.', 1),
(2, 'Coloque uma pequena quantidade de geleia de porto no centro de cada fatia de pão tostado.', 2),
(2, 'Coloque uma pequena quantidade de foie gras sobre a geleia, usando uma colher aquecida.', 3),
(2, 'Polvilhe trufas negras raladas sobre o foie gras.', 4),
(2, 'Regue com azeite trufa e finalize com flor de sal e pimenta-do-reino.', 5),
(2, 'Decore com microgreens. Sirva imediatamente.', 6);

-- ============================================================

-- RECEITA 3: Eggs with Sausages
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T1EP4 — Oeuf',
    'Eggs with Sausages',
    'entradas',
    NULL,
    'Em "Oeuf" (Ovo), Hannibal prepara um prato que é simultaneamente simples e sofisticado: ovos com salsichas. O episódio marca um ponto de virada na série, onde os crimes de Hannibal começam a se tornar mais evidentes. O prato é um contraste interessante — ovos são símbolos de pureza e novo começo, enquanto as salsichas sugerem algo mais terreno e potencialmente sinistro. Para Hannibal, é um prato que captura essa dualidade: beleza e horror entrelaçados.',
    'Ovos e salsichas são uma combinação clássica que aparece em culinarias de todo o mundo. Em França, as salsichas de qualidade (como a saucisse de Toulouse) são frequentemente servidas com ovos preparados de várias formas. A qualidade das salsichas é crucial — uma boa salsicha deve ter uma proporção equilibrada de carne, gordura e temperos. Hannibal, é claro, insistiria em salsichas de qualidade excepcional, preparadas com precisão e servidas com técnica impecável.'
);

-- Ingredientes da receita 3
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(3, '4 ovos frescos', 1),
(3, '4 salsichas de qualidade premium (Toulouse ou similar)', 2),
(3, '2 colheres de sopa de manteiga', 3),
(3, '1 colher de sopa de azeite', 4),
(3, '2 dentes de alho, minados', 5),
(3, '50g de cogumelos fatiados', 6),
(3, 'Sal, pimenta-do-reino e ervas frescas a gosto', 7);

-- Passos da receita 3
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(3, 'Aqueça uma frigideira em fogo médio-alto. Adicione as salsichas e cozinhe até ficarem douradas de todos os lados, cerca de 8-10 minutos. Reserve.', 1),
(3, 'Na mesma frigideira, derreta 1 colher de sopa de manteiga. Refogue os cogumelos com alho até ficarem macios, cerca de 4 minutos. Reserve.', 2),
(3, 'Adicione o restante da manteiga à frigideira. Quebre os ovos cuidadosamente e cozinhe até o ponto desejado (frito, sunny-side up, etc.).', 3),
(3, 'Tempere os ovos com sal e pimenta. Coloque as salsichas e cogumelos ao redor dos ovos.', 4),
(3, 'Decore com ervas frescas (salsa, cebolinha) e sirva imediatamente em um prato quente.', 5);

-- ============================================================

-- RECEITA 4: Wine Jelly
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T1EP6 — Entree',
    'Wine Jelly',
    'sobremesas',
    NULL,
    'Em "Entree", Hannibal prepara uma geleia de vinho — um prato que é tanto uma sobremesa quanto uma obra de arte. A geleia de vinho é translúcida, delicada, e captura a essência do vinho em forma sólida. O episódio marca um momento em que Hannibal começa a revelar mais de sua verdadeira natureza, e a geleia de vinho é uma metáfora perfeita: algo que parece frágil na superfície, mas que possui uma estrutura interna complexa e bem definida.',
    'A geleia de vinho é um prato clássico da culinária francesa que remonta ao século XVIII. Historicamente, era feita com gelatina animal (caldo de ossos reduzido) e vinho, criando um prato que era tanto uma demonstração de técnica quanto de riqueza — pois gelatina era cara e trabalhosa de produzir. A geleia de vinho é frequentemente servida como uma sobremesa elegante em jantares refinados, e é um prato que requer precisão e paciência.'
);

-- Ingredientes da receita 4
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(4, '500ml de vinho tinto de qualidade', 1),
(4, '200ml de caldo de carne (para gelatina)', 2),
(4, '100g de açúcar', 3),
(4, '1 pau de canela', 4),
(4, '3 cravos-da-índia', 5),
(4, '2 folhas de gelatina (ou 1 colher de chá de gelatina em pó)', 6),
(4, 'Suco de 1 limão', 7),
(4, 'Frutas vermelhas para decoração (opcional)', 8);

-- Passos da receita 4
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(4, 'Se usar gelatina em folhas, hidrate em água fria por 5 minutos. Se usar em pó, reserve.', 1),
(4, 'Em uma panela, combine o vinho tinto, caldo de carne, açúcar, canela e cravos. Leve ao fogo e deixe ferver por 5 minutos.', 2),
(4, 'Retire do fogo e deixe esfriar ligeiramente. Coe para remover a canela e os cravos.', 3),
(4, 'Adicione a gelatina hidratada ao vinho morno, mexendo bem até dissolver completamente.', 4),
(4, 'Adicione o suco de limão. Despeje em taças ou formas.', 5),
(4, 'Refrigere por pelo menos 4 horas até ficar firme.', 6),
(4, 'Se desejar, decore com frutas vermelhas frescas. Sirva gelado.', 7);

-- ============================================================

-- RECEITA 5: Paella on the Rocks
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T1EP8 — Fromage',
    'Paella on the Rocks',
    'pratos-principais',
    NULL,
    'Em "Fromage" (Queijo), Hannibal prepara uma paella em pedras — um prato que combina a culinária espanhola com uma técnica teatral. O uso de pedras quentes para cozinhar é uma técnica antiga que adiciona um elemento de drama e espetáculo à apresentação. A paella em si é um prato de abundância e comunidade, mas quando preparada por Hannibal, torna-se uma declaração de seu domínio absoluto sobre a culinária e sobre aqueles ao seu redor.',
    'A paella é um prato tradicional da região de Valência, na Espanha, que remonta ao século XVIII. Historicamente, era um prato de camponeses que aproveitava ingredientes locais — arroz, legumes, frutos do mar. A paella ganhou fama internacional e é agora considerada um símbolo da culinária espanhola. A técnica de cozinhar em pedras quentes é uma variação moderna que adiciona um elemento de espetáculo e dramaticidade à apresentação. O prato é frequentemente servido em jantares de grupo, o que o torna perfeito para Hannibal — uma forma de reunir suas vítimas em torno de uma mesa.'
);

-- Ingredientes da receita 5
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(5, '300g de arroz bomba ou paella', 1),
(5, '200g de frutos do mar mistos (camarão, mexilhão, lula)', 2),
(5, '150g de frango, cortado em cubos', 3),
(5, '100g de pimentão vermelho, cortado em tiras', 4),
(5, '100g de ervilha fresca', 5),
(5, '1 cebola média, picada', 6),
(5, '4 dentes de alho, minados', 7),
(5, '750ml de caldo de frango ou peixe', 8),
(5, '100ml de vinho branco', 9),
(5, '1 colher de chá de açafrão', 10),
(5, '3 colheres de sopa de azeite', 11),
(5, 'Sal, pimenta e limão a gosto', 12);

-- Passos da receita 5
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(5, 'Aqueça o caldo em uma panela separada. Dissolva o açafrão no caldo quente.', 1),
(5, 'Em uma panela grande (paellera), aqueça o azeite em fogo médio-alto. Refogue o frango até ficar dourado. Retire e reserve.', 2),
(5, 'Na mesma panela, refogue a cebola e o alho até ficarem macios, cerca de 3 minutos.', 3),
(5, 'Adicione o arroz e mexa bem para cobrir com o azeite. Cozinhe por 2 minutos.', 4),
(5, 'Despeje o vinho branco e deixe reduzir quase completamente.', 5),
(5, 'Adicione o caldo de açafrão gradualmente, mexendo ocasionalmente. O arroz deve absorver o líquido lentamente.', 6),
(5, 'Quando o arroz estiver quase cozido, adicione o frango reservado, os frutos do mar, o pimentão e a ervilha.', 7),
(5, 'Cozinhe até que o arroz esteja macio, os frutos do mar estejam cozidos e o líquido tenha sido absorvido, cerca de 5-7 minutos.', 8),
(5, 'Tempere com sal, pimenta e suco de limão. Sirva diretamente da panela.', 9);

-- ============================================================

-- RECEITA 6: Tenderloin and Lotus
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T1EP9 — Trou Normand',
    'Tenderloin and Lotus',
    'pratos-principais',
    NULL,
    'Em "Trou Normand" (Buraco Normando), Hannibal prepara um filé mignon com raiz de lótus — um prato que combina a culinária francesa com influências asiáticas. O "trou normand" é tradicionalmente um interlúdio gelado (como um sorbet) servido entre pratos em um jantar de múltiplos cursos para "limpar o palato". Mas aqui, Hannibal subverte a tradição, criando um prato que é tanto uma homenagem quanto uma reinterpretação. O filé mignon é um corte nobre, e a raiz de lótus adiciona um elemento de exotismo e sofisticação.',
    'O filé mignon é considerado o corte mais nobre da carne vermelha, conhecido por sua maciez e sabor delicado. A raiz de lótus (Nelumbo nucifera) é um ingrediente tradicional na culinária asiática, particularmente na culinária chinesa e japonesa. Tem um sabor ligeiramente adocicado e uma textura crocante quando cozida corretamente. A combinação de filé mignon com raiz de lótus é uma fusão criativa que demonstra a sofisticação culinária de Hannibal e sua disposição em explorar ingredientes de diferentes culturas.'
);

-- Ingredientes da receita 6
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(6, '2 filés mignon (200g cada)', 1),
(6, '300g de raiz de lótus fresca', 2),
(6, '3 colheres de sopa de manteiga', 3),
(6, '2 dentes de alho, minados', 4),
(6, '100ml de vinho tinto', 5),
(6, '100ml de caldo de carne', 6),
(6, '1 colher de chá de gengibre fresco ralado', 7),
(6, '1 colher de chá de molho de soja', 8),
(6, 'Sal, pimenta-do-reino e óleo de gergelim a gosto', 9);

-- Passos da receita 6
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(6, 'Descasque a raiz de lótus e corte em fatias finas. Cozinhe em água com um pouco de vinagre por 5 minutos até ficar ligeiramente macia mas ainda crocante. Escorra.', 1),
(6, 'Tempere os filés mignon com sal e pimenta. Aqueça uma frigideira em fogo alto com 1 colher de sopa de manteiga.', 2),
(6, 'Sele os filés na frigideira por 3-4 minutos de cada lado (para carne média-rara). Retire e reserve.', 3),
(6, 'Na mesma frigideira, derreta o restante da manteiga. Refogue o alho e o gengibre por 1 minuto.', 4),
(6, 'Despeje o vinho tinto e raspe os sucos caramelizados do fundo. Deixe reduzir pela metade.', 5),
(6, 'Adicione o caldo de carne e o molho de soja. Cozinhe por 2 minutos.', 6),
(6, 'Retorne os filés à frigideira com a raiz de lótus. Cozinhe por mais 2 minutos.', 7),
(6, 'Finalize com um fio de óleo de gergelim. Sirva quente.', 8);

-- ============================================================

-- RECEITA 7: Jamon Iberico
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T1EP10 — Buffet Froid',
    'Jamon Iberico',
    'entradas',
    NULL,
    'Em "Buffet Froid" (Bufê Frio), Hannibal prepara presunto ibérico — um prato que é tão simples quanto sofisticado. O presunto ibérico é um ingrediente de qualidade excepcional que requer pouca preparação além de uma fatiação perfeita e uma apresentação elegante. O episódio marca um ponto em que Hannibal começa a revelar sua verdadeira natureza de forma mais aberta, e o presunto ibérico é uma metáfora perfeita: algo que parece simples na superfície, mas que possui uma complexidade e profundidade extraordinárias.',
    'O presunto ibérico é um dos presuntos mais refinados do mundo, produzido a partir de porcos ibéricos criados em liberdade na Península Ibérica. O processo de cura pode levar de 2 a 10 anos, dependendo da qualidade desejada. O presunto ibérico de "pata negra" (feito de porcos com cascos pretos) é considerado o mais premium e é frequentemente servido em fatias ultrafinas como entrada em jantares refinados. A qualidade do presunto ibérico é tão alta que requer pouca preparação — apenas uma fatiação perfeita e uma apresentação elegante.'
);

-- Ingredientes da receita 7
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(7, '200g de presunto ibérico de pata negra, fatiado ultrafino', 1),
(7, '100g de melão fresco (opcional)', 2),
(7, 'Pão tostado de qualidade', 3),
(7, 'Azeite extra virgem premium', 4),
(7, 'Flor de sal', 5);

-- Passos da receita 7
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(7, 'Se o presunto foi refrigerado, retire 15 minutos antes de servir para que chegue à temperatura ambiente.', 1),
(7, 'Disponha as fatias de presunto em um prato branco, dobradas elegantemente.', 2),
(7, 'Se usar melão, corte em fatias finas e disponha ao lado do presunto.', 3),
(7, 'Regue levemente com azeite extra virgem premium.', 4),
(7, 'Polvilhe flor de sal sobre o presunto.', 5),
(7, 'Sirva com pão tostado fresco. A apresentação visual é tão importante quanto o sabor.', 6);

-- ============================================================

-- RECEITA 8: Curried Chitterlings
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T1EP11 — Roti',
    'Curried Chitterlings',
    'pratos-principais',
    NULL,
    'Em "Roti" (Assado), Hannibal prepara chitterlings (tripas) ao curry — um prato que é tanto uma demonstração de técnica quanto um desafio aos preconceitos culinários. Chitterlings são um ingrediente que muitos consideram desagradável, mas quando preparadas corretamente, podem ser extraordinariamente saborosas. Para Hannibal, é um prato que fala sobre transformação e refinamento — a capacidade de elevar algo que é frequentemente descartado para algo verdadeiramente notável. O curry adiciona uma camada de sofisticação e exotismo.',
    'Chitterlings (tripas de porco) são um ingrediente tradicional em muitas culinarias ao redor do mundo, particularmente na culinaria africana, caribenha e do sul dos Estados Unidos. Historicamente, eram um alimento de sobrevivência — uma forma de aproveitar todas as partes do animal. Quando preparadas corretamente, chitterlings podem ser extremamente saborosas. O curry é uma mistura de especiarias que remonta à culinária indiana e é agora usada em culinarias de todo o mundo. A combinação de chitterlings com curry é uma fusão criativa que demonstra a sofisticação culinária de Hannibal.'
);

-- Ingredientes da receita 8
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(8, '500g de chitterlings (tripas de porco), limpas e cortadas', 1),
(8, '3 colheres de sopa de pó de curry', 2),
(8, '1 cebola grande, picada', 3),
(8, '4 dentes de alho, minados', 4),
(8, '1 colher de sopa de gengibre fresco ralado', 5),
(8, '400ml de leite de coco', 6),
(8, '200ml de caldo de carne', 7),
(8, '2 tomates, picados', 8),
(8, '2 colheres de sopa de azeite', 9),
(8, 'Sal, pimenta e suco de limão a gosto', 10);

-- Passos da receita 8
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(8, 'Limpe bem os chitterlings em água fria. Cozinhe em água fervendo com um pouco de vinagre por 30 minutos até ficarem macios. Escorra e corte em pedaços pequenos.', 1),
(8, 'Em uma panela grande, aqueça o azeite em fogo médio. Refogue a cebola, alho e gengibre até ficarem aromáticos, cerca de 3 minutos.', 2),
(8, 'Adicione o pó de curry e mexa bem para cobrir a cebola. Cozinhe por 1 minuto.', 3),
(8, 'Adicione os chitterlings já cozidos e mexa bem para cobrir com o curry.', 4),
(8, 'Despeje o leite de coco e o caldo de carne. Adicione os tomates picados.', 5),
(8, 'Deixe fervir, depois reduza o fogo e cozinhe em fogo baixo por 20-30 minutos até que o molho fique espesso e saboroso.', 6),
(8, 'Tempere com sal, pimenta e suco de limão. Sirva quente com arroz ou pão.', 7);

-- ============================================================

-- RECEITA 9: Silkie Soup
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T1EP12 — Releves',
    'Silkie Soup',
    'sopas',
    NULL,
    'Em "Releves" (Mudanças), Hannibal prepara uma sopa de Silkie — uma sopa tradicional da culinária chinesa feita com galinha Silkie, uma raça de galinha conhecida por sua carne preta e sua reputação medicinal. O episódio marca um ponto de virada na série, onde Hannibal começa a se envolver mais diretamente com Will Graham. A sopa é um prato que é tanto nutritivo quanto reconfortante, mas quando preparada por Hannibal, torna-se algo muito mais — uma oferenda que mascara intenções muito mais sinistras.',
    'A galinha Silkie é uma raça de galinha originária da Ásia, particularmente da China, que é conhecida por sua carne preta e sua reputação medicinal. Na culinária tradicional chinesa, a sopa de Silkie é considerada um tônico de saúde e é frequentemente servida para fortalecer o corpo e melhorar o bem-estar geral. A sopa é tipicamente feita com galinha Silkie, cogumelos medicinais, ginseng e outras ervas. O prato é um exemplo da filosofia culinária chinesa de que a comida é medicina.'
);

-- Ingredientes da receita 9
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(9, '1 galinha Silkie inteira (ou 800g de carne de Silkie)', 1),
(9, '10 cogumelos shiitake secos', 2),
(9, '5 datas vermelhas chinesas (jujubas)', 3),
(9, '1 raiz de ginseng (ou 1 colher de chá de pó de ginseng)', 4),
(9, '6 talos de goji berries', 5),
(9, '6 fatias de raiz de gengibre fresco', 6),
(9, '2 litros de água filtrada', 7),
(9, 'Sal a gosto', 8);

-- Passos da receita 9
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(9, 'Limpe a galinha Silkie em água fria. Corte em pedaços grandes.', 1),
(9, 'Hidrate os cogumelos shiitake em água morna por 20 minutos. Reserve a água.', 2),
(9, 'Em uma panela grande, leve a água a fervir. Adicione a galinha e deixe fervir por 2 minutos. Retire a galinha e descarte a água (isso remove as impurezas).', 3),
(9, 'Coloque a galinha em uma panela limpa com 2 litros de água fresca. Leve a fervir.', 4),
(9, 'Adicione o gengibre, os cogumelos shiitake, as datas, a raiz de ginseng e as goji berries.', 5),
(9, 'Reduza o fogo e deixe cozinhar em fogo baixo por 2-3 horas até que a galinha esteja muito macia e o caldo tenha absorvido todos os sabores.', 6),
(9, 'Tempere com sal a gosto. Sirva quente em tigelas.', 7);

-- ============================================================

-- RECEITA 10: Grand Fruit and Flower Garnished Kalua-Roast Leg
INSERT INTO receitas (episodio, titulo, categoria, imagem, descricao, curiosidade) VALUES (
    'T3EP13 — The Wrath of The Lamb',
    'Grand Fruit and Flower Garnished Kalua-Roast Leg',
    'pratos-principais',
    NULL,
    'No episódio final da série, "The Wrath of the Lamb" (A Ira do Cordeiro), Hannibal prepara um prato final e magnífico: uma perna de cordeiro kalua assada e decorada com frutas e flores. Este é o auge de sua arte culinária — um prato que é tanto uma celebração quanto um ato de desafio. O título do episódio é uma referência bíblica ao Cordeiro de Deus, e o prato é carregado de simbolismo: inocência, sacrifício, redenção, e a recusa de Hannibal em aceitar qualquer uma dessas noções. A decoração com frutas e flores adiciona um elemento de beleza quase irreal, transformando o prato em uma obra de arte que transcende a culinária.',
    'O kalua é um método tradicional de cozimento havaiano que envolve cozinhar carne em um forno subterrâneo chamado imu. A carne cozida desta forma fica extremamente macia e absorve os sabores da fumaça e das ervas. Quando preparada em um forno convencional, a técnica kalua envolve cozimento longo e lento em fogo baixo. A decoração com frutas e flores é uma técnica moderna que transforma o prato em uma obra de arte visual. O prato final é uma celebração da culinária, da beleza, e da criatividade — e, para Hannibal, uma afirmação final de seu domínio absoluto sobre a arte culinária.'
);

-- Ingredientes da receita 10
INSERT INTO ingredientes (receita_id, descricao, ordem) VALUES
(10, '1 perna de cordeiro (cerca de 2kg)', 1),
(10, '6 dentes de alho, fatiados', 2),
(10, '3 colheres de sopa de sal marinho', 3),
(10, '2 colheres de sopa de pimenta-do-reino', 4),
(10, '2 colheres de sopa de alecrim fresco picado', 5),
(10, '2 colheres de sopa de tomilho fresco picado', 6),
(10, '100ml de azeite extra virgem', 7),
(10, '200ml de vinho branco', 8),
(10, '300ml de caldo de carne', 9),
(10, 'Frutas variadas para decoração (maçã, pera, uva, romã)', 10),
(10, 'Flores comestíveis para decoração (rosas, violetas, calêndula)', 11),
(10, 'Microgreens e ervas frescas para finalizar', 12);

-- Passos da receita 10
INSERT INTO passos_preparo (receita_id, descricao, ordem) VALUES
(10, 'Pré-aqueça o forno a 160°C.', 1),
(10, 'Com uma faca pequena, faça pequenos cortes na pele do cordeiro e insira os fatias de alho nos cortes.', 2),
(10, 'Esfregue o cordeiro com sal, pimenta, alecrim e tomilho, cobrindo toda a superfície.', 3),
(10, 'Coloque o cordeiro em uma assadeira. Regue com azeite extra virgem.', 4),
(10, 'Asse por 3-4 horas (para carne bem cozida) ou 2,5-3 horas (para carne média), regando ocasionalmente com o suco da assadeira.', 5),
(10, 'Retire o cordeiro do forno e deixe descansar por 15 minutos.', 6),
(10, 'Coloque a assadeira no fogão em fogo médio. Despeje o vinho branco e raspe os sucos caramelizados.', 7),
(10, 'Adicione o caldo de carne e deixe reduzir por 5 minutos. Tempere com sal e pimenta.', 8),
(10, 'Fatia o cordeiro. Disponha em um prato grande e elegante.', 9),
(10, 'Decore o prato com frutas variadas (maçã, pera, uva, romã) e flores comestíveis, criando uma composição visual impressionante.', 10),
(10, 'Finalize com microgreens e ervas frescas. Sirva o molho à parte.', 11),
(10, 'Sirva este prato final como um ato de criação e defiance.', 12);