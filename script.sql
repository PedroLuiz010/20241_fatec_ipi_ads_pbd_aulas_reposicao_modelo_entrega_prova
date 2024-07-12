-- Active: 1712670277437@@127.0.0.1@5432@prova@public

-- ----------------------------------------------------------------
-- 1 Base de dados e criação de tabela
--escreva a sua solução aqui

create table tb_estudantes(
	id serial primary key,
	salario int, -- coluna 8
	eduMae int, -- coluna 11
	eduPai int, -- coluna 12
	estudaSo int, -- coluna 23
	preparo int, -- coluna 24
	aprovado int -- coluna 32
);

-- ----------------------------------------------------------------
-- 2 Resultado em função da formação dos pais
--escrev a a sua solução aqui

-- DO $$
--     DECLARE
--         --1.Declaração do CURSOR
--         cur_aprovado_phd REFCURSOR;
--         v_tupla RECORD;

--     BEGIN
--         --2. abertura do cursor
--         OPEN cur_aprovado_phd FOR
--             SELECT aprovado, eduMae, eduPai FROM
--             tb_estudantes;
        
--         LOOP
--             --3. recuperação dos dados de interesse
--             FETCH cur_aprovado_phd INTO v_tupla;
--             EXIT WHEN NOT FOUND;
--             IF v_tupla.aprovado > 0 THEN
--                 IF v_tupla.eduMae = 6 OR v_tupla.eduPai = 6 THEN
--                     RAISE NOTICE '%, pai: %, mae: %', v_tupla.aprovado, v_tupla.eduPai, v_tupla.eduMae;
--                 END IF;
                
--             END IF;
            
--         END LOOP;
--         --4. Fechamento do cursor
--         CLOSE cur_aprovado_phd;
--     END;
-- $$


-- ----------------------------------------------------------------
-- 3 Resultado em função dos estudos
--escreva a sua solução aqui

-- DO $$
--     DECLARE
--         --1.Declaração do CURSOR
--         cur_aprovado_solo REFCURSOR;
--         nome_tabela VARCHAR(200) := 'tb_estudantes';
--         contador INT;

--     BEGIN
--         --2. abertura do cursor
--         OPEN cur_aprovado_solo FOR EXECUTE
--         format(
--             '
--                 SELECT count(*) FROM %s WHERE aprovado > 0 AND estudaSo = 1         
--             ',
--             nome_tabela
--         );
--         LOOP
--             --3. recuperação dos dados de interesse
--             FETCH cur_aprovado_solo INTO contador;
--             EXIT WHEN NOT FOUND;
--             IF contador <= 0 THEN
--                 RAISE NOTICE '-1';
--             ELSE
--                 RAISE NOTICE '%', contador;
--             END IF;
--         END LOOP;
--         --4. Fechamento do cursor
--         CLOSE cur_aprovado_solo;
--     END;
-- $$

-- ----------------------------------------------------------------
-- 4 Salário versus estudos
--escreva a sua solução aqui

-- DO $$
--     DECLARE
--         --1.Declaração do CURSOR
--         cur_salario_freq CURSOR FOR
--         SELECT count(*) FROM tb_estudantes 
--         WHERE salario = 5 AND preparo = 2;
--         contador INT;

--     BEGIN
--         --2. abertura do cursor
--         OPEN cur_salario_freq;
--         LOOP
--             --3. recuperação dos dados de interesse
--             FETCH cur_salario_freq INTO contador;
--             EXIT WHEN NOT FOUND;
--             RAISE NOTICE '%', contador;
--         END LOOP;
--         --4. Fechamento do cursor
--         CLOSE cur_salario_freq;
--     END;
-- $$

-- ----------------------------------------------------------------
-- 5. Limpeza de valores NULL
--escreva a sua solução aqui

-- ----------------------------------------------------------------