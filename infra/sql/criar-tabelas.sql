
CREATE TABLE professores (
    ID SERIAL PRIMARY KEY,
    nusp INTEGER,
    Sigla_dept VARCHAR(3) DEFAULT 'PEA',
    Nome VARCHAR(100),
    telefone BIGINT,
    cpf BIGINT,
    data_nascimento DATE ,
    email VARCHAR(40)
);


INSERT INTO professores (Nome)
VALUES
('João Silva Santos'),
('Maria Oliveira Almeida'),
('Carlos Souza Lima'),
('Ana Pereira Fernandes'),
('Pedro Costa Rocha'),
('Luana Santos Ferreira'),
('Marcos Silva Oliveira'),
('Juliana Fernandes Almeida'),
('Rafael Lima Santos'),
('Fernanda Almeida Costa'),
('Gabriel Rodrigues Martins'),
('Camila Costa Rodrigues'),
('Lucas Fernandes Pereira'),
('Mariana Oliveira Alves'),
('Gustavo Almeida Lima'),
('Carolina Santos Silva'),
('Felipe Costa Oliveira'),
('Isabela Alves Fernandes'),
('Rodrigo Lima Costa'),
('Aline Fernandes Almeida'),
('Bruno Pereira Santos'),
('Tatiane Almeida Costa'),
('Ricardo Lima Oliveira'),
('Priscila Fernandes Alves'),
('Eduardo Costa Silva'),
('Larissa Almeida Lima'),
('Fábio Fernandes Oliveira'),
('Renata Silva Alves'),
('André Lima Santos'),
('Gabriela Alves Fernandes'),
('Diego Oliveira Costa'),
('Amanda Fernandes Lima'),
('Vinícius Santos Almeida');

-- Povoar a tabela professores com dados aleatórios
INSERT INTO professores (nusp, Sigla_dept, Nome, telefone, cpf, data_nascimento, email)
SELECT
    -- NUSP aleatório menor que 14000000
    trunc(random() * 14000000) AS nusp,
    'PEA' AS Sigla_dept,
    Nome,
    CAST(substring((119000000000 + trunc(random() * 10000000000))::text from 2 for 11) AS BIGINT) AS telefone,
    -- CPF aleatório de 11 dígitos
    trunc(10000000000 + random() * (99999999999 - 10000000000)) AS cpf,
    -- Data de nascimento aleatória garantindo no mínimo 27 anos de idade
    (CURRENT_DATE - interval '27 years' - interval '1 day' * trunc(random() * 365*60)) AS data_nascimento,
    -- Email baseado no nome
    lower(replace(replace(Nome, ' ', ''), 'á', 'a') || '@usp.br') AS email
FROM
    (SELECT DISTINCT Nome FROM professores) AS nomes;


DELETE FROM professores
WHERE 
    telefone IS NULL AND
    cpf IS NULL AND
    data_nascimento IS NULL AND
    email IS NULL;

ALTER TABLE professores DROP CONSTRAINT professores_pkey;

ALTER TABLE professores ADD PRIMARY KEY (nusp);

ALTER TABLE professores DROP COLUMN ID;








CREATE TABLE IF NOT EXISTS pea (
    Sigla VARCHAR(10) PRIMARY KEY,
    Nome VARCHAR(255)
);

INSERT INTO pea (Sigla, Nome) VALUES
('PEA3550', 'Acionamentos Elétricos Industriais'),
('PEA3513', 'Aplicação do Método dos Elementos Finitos em Problemas de Engenharia Elétrica'),
('PEA3413', 'Automação de Sistemas Industriais'),
('PEA3532', 'Avaliação de Recursos Eólicos'),
('PEA3450', 'Coleta e Armazenamento de Energia'),
('PEA3306', 'Conversão Eletromecânica de Energia'),
('PEA3399', 'Conversão Eletromecânica de Energia'),
('PEA3390', 'Eletricidade Aplicada I'),
('PEA2288', 'Eletricidade Geral'),
('PEA3294', 'Eletricidade Geral I'),
('PEA3201', 'Eletricidade Geral II'),
('PEA3392', 'Eletricidade Geral III'),
('PEA3388', 'Eletricidade Geral IV'),
('PEA3288', 'Eletricidade I'),
('PEA3391', 'Eletricidade II'),
('PEA3487', 'Eletrônica de Potência I'),
('PEA3489', 'Eletrônica de Potência I'),
('PEA3488', 'Eletrônica de Potência II'),
('PEA3490', 'Eletrônica de Potência II'),
('PEA3290', 'Eletrotécnica Aplicada I'),
('PEA3346', 'Eletrotécnica Geral'),
('PEA2395', 'Eletrotécnica Geral'),
('PEA3395', 'Eletrotécnica Geral'),
('PEA3396', 'Eletrotécnica Geral II'),
('PEA3496', 'Energia e Meio Ambiente: Sistemas Energéticos e seus Efeitos Ambientais'),
('PEA3100', 'Energia, Meio Ambiente e Sustentabilidade'),
('PEA3560', 'Engenharia de Energia Hidroelétrica'),
('PEA2450', 'Engenharia de Sistemas de Energia'),
('PEA3408', 'Estabilidade de Tensão em Sistemas de Transmissão de Energia Elétrica'),
('PEA3600', 'Estágio Supervisionado'),
('PEA2600', 'Estágio Supervisionado'),
('PEA3402', 'Instalações Elétricas'),
('PEA3411', 'Introdução à Automação de Sistemas Elétricos'),
('PEA2505', 'Introdução à Automação de Sistemas Industriais'),
('PEA3345', 'Introdução a Eletrotécnica Geral'),
('PEA3527', 'Introdução à Instrumentação Industrial'),
('PEA3523', 'Introdução à Operação e à Comercialização em Sistemas Elétricos'),
('PEA3301', 'Introdução aos Sistemas de Potência'),
('PEA3534', 'Introdução às Instalações Elétricas em Áreas Classificadas /'),
('PEA2509', 'Laboratório de Automação de Sistemas Elétricos'),
('PEA3418', 'Laboratório de Automação de Sistemas Industriais'),
('PEA3524', 'Laboratório de Automação e Proteção de Sistemas Elétricos'),
('PEA3509', 'Laboratório de Automação e Proteção de Sistemas Elétricos e Industriais'),
('PEA3311', 'Laboratório de Conversão Eletromecânica de Energia'),
('PEA3393', 'Laboratório de Eletricidade Geral I'),
('PEA3389', 'Laboratório de Eletricidade Geral II'),
('PEA3502', 'Laboratório de Eletrônica de Potência'),
('PEA2502', 'Laboratório de Eletrônica de Potência'),
('PEA3397', 'Laboratório de Eletrotécnica Geral'),
('PEA3380', 'Laboratório de Eletrotécnica I'),
('PEA3430', 'Laboratório de Energia'),
('PEA3530', 'Laboratório de Energia Elétrica'),
('PEA3401', 'Laboratório de Instalações Elétricas'),
('PEA3405', 'Laboratório de Máquinas Elétricas'),
('PEA2504', 'Laboratório de Máquinas Elétricas'),
('PEA2503', 'Laboratório de Qualidade de Energia'),
('PEA3504', 'Laboratório de Qualidade de Energia'),
('PEA3406', 'Laboratório de Sistemas de Potência'),
('PEA3404', 'Máquinas Elétricas e seus Acionamentos'),
('PEA3400', 'Máquinas Elétricas I'),
('PEA3414', 'Máquinas Elétricas II'),
('PEA3422', 'Métodos de Otimização Aplicados a Sistemas Elétricos'),
('PEA3515', 'Modelagem de Componentes de Sistemas Elétricos de Potência para Cálculos Elétricos'),
('PEA3420', 'Produção de Energia'),
('PEA3500', 'Projeto de Formatura I'),
('PEA2500', 'Projeto de Formatura I'),
('PEA3507', 'Projeto de Formatura II'),
('PEA2507', 'Projeto de Formatura II'),
('PEA3416', 'Proteção e Automação de Sistemas Elétricos de Potência I'),
('PEA3412', 'Proteção e Automação de Sistemas Elétricos de Potência I'),
('PEA3424', 'Proteção e Automação de Sistemas Elétricos de Potência II'),
('PEA3540', 'Proteção e Automação de Sistemas Elétricos de Potência II'),
('PEA3521', 'Qualidade e Regulação de Energia Elétrica'),
('PEA2521', 'Qualidade e Regulação de Energia Elétrica'),
('PEA3410', 'Sistemas de Potência I'),
('PEA3417', 'Sistemas de Potência II'),
('PEA3503', 'Subestações e Equipamentos'),
('PEA2522', 'Técnicas de Otimização em Engenharia de Potência'),
('PEA3536', 'Tópicos de Regulação do Setor Elétrico'),
('PEA3419', 'Tópicos de Sistemas Embarcados na Automação de Sistemas Elétricos Modernos'),
('PEA3455', 'Tópicos em Geração Distribuída'),

('PEA3511', 'Transporte de Energia Elétrica'),
('PEA2511', 'Transporte de Energia Elétrica'),
('PEA3440', 'Uso da Energia Elétrica'),
('PEA3520', 'Uso da Energia Elétrica'),
('PEA2520', 'Uso da Energia Elétrica'),
('PEA2597', 'Uso Racional de Energia Elétrica');

ALTER TABLE pea
ADD COLUMN Sigla_dept VARCHAR(3) DEFAULT 'PEA';

ALTER TABLE professores
ADD CONSTRAINT unique_nusp UNIQUE (nusp);

-- Passo 1: Criar a tabela de associação entre professores e disciplinas
CREATE TABLE IF NOT EXISTS professores_disciplinas (
    ID SERIAL PRIMARY KEY,
    nusp INTEGER,
    Sigla VARCHAR (10),
    FOREIGN KEY (nusp) REFERENCES professores(nusp),
    FOREIGN KEY (Sigla) REFERENCES pea(Sigla)
);

-- Passo 2: Gerar aleatoriamente o número de disciplinas para cada professor, garantindo no máximo 7
WITH RandomDisciplinas AS (
    SELECT 
        p.nusp AS nusp,
        trunc(random() * 7) + 1 AS Num_Disciplinas
    FROM professores p
)

-- Passo 3: Gerar aleatoriamente a lista de disciplinas para cada professor, limitando a um máximo de 7 disciplinas
INSERT INTO professores_disciplinas (nusp, Sigla)
SELECT
    rd.nusp AS nusp,
    c.Sigla AS Sigla_curso
FROM
    RandomDisciplinas rd
JOIN LATERAL (
    SELECT Sigla FROM pea ORDER BY random() LIMIT least(rd.Num_Disciplinas, 7)
) c ON TRUE;

-- Passo 4: Inserir os registros na tabela de associação
INSERT INTO professores_disciplinas (nusp, Sigla)
SELECT
    p.nusp AS nusp,
    c.Sigla AS Sigla_curso
FROM
    professores p
CROSS JOIN LATERAL (
    SELECT Sigla FROM pea ORDER BY random() LIMIT trunc(random() * 5) + 1
) c;




-- Criação da tabela professores_pcs
CREATE TABLE IF NOT EXISTS professores_pcs (
    ID SERIAL PRIMARY KEY,
    nusp INTEGER,
    Sigla_dept VARCHAR(3) DEFAULT 'PCS',
    Nome VARCHAR(100),
    telefone BIGINT,
    cpf BIGINT,
    data_nascimento DATE ,
    email VARCHAR(40)
);

-- Populando a tabela professores_pcs com 53 nomes diferentes
INSERT INTO professores_pcs (Nome)
VALUES
('Pedro Santos Silva'),
('Mariana Oliveira Lima'),
('Lucas Fernandes Costa'),
('Ana Lima Oliveira'),
('Juliana Rodrigues Silva'),
('Gustavo Almeida Santos'),
('Fernanda Pereira Lima'),
('Rafaela Costa Fernandes'),
('Marcos Oliveira Santos'),
('Carolina Lima Almeida'),
('Gabriel Fernandes Silva'),
('Camila Almeida Costa'),
('André Lima Fernandes'),
('Priscila Costa Oliveira'),
('Bruno Santos Lima'),
('Patrícia Almeida Silva'),
('Diego Fernandes Santos'),
('Amanda Lima Fernandes'),
('Vinícius Rodrigues Costa'),
('Mariana Alves Lima'),
('Daniel Costa Silva'),
('Renata Oliveira Fernandes'),
('Lucas Fernandes Lima'),
('Ana Rodrigues Almeida'),
('Felipe Oliveira Santos'),
('Tatiane Costa Lima'),
('Ricardo Lima Fernandes'),
('Larissa Almeida Silva'),
('Fábio Santos Lima'),
('Gabriela Oliveira Fernandes'),
('Marcos Costa Santos'),
('Juliana Lima Almeida'),
('Gustavo Almeida Fernandes'),
('Carolina Fernandes Lima'),
('Bruno Oliveira Almeida'),
('Patrícia Lima Costa'),
('Diego Alves Fernandes'),
('Rafaela Oliveira Santos'),
('Amanda Fernandes Lima'),
('Vinícius Rodrigues Costa'),
('Mariana Almeida Fernandes'),
('Daniel Santos Lima'),
('Renata Fernandes Almeida'),
('Lucas Lima Oliveira'),
('Ana Alves Costa'),
('Felipe Fernandes Santos'),
('Tatiane Oliveira Lima'),
('Ricardo Lima Almeida'),
('Larissa Fernandes Silva'),
('Fábio Almeida Lima'),
('Gabriela Santos Fernandes');

-- Povoar a tabela professores com dados aleatórios
INSERT INTO professores_pcs (nusp, Sigla_dept, Nome, telefone, cpf, data_nascimento, email)
SELECT
    -- NUSP aleatório menor que 14000000
    trunc(random() * 14000000) AS nusp,
    'PCS' AS Sigla_dept,
    Nome,
    CAST(substring((119000000000 + trunc(random() * 10000000000))::text from 2 for 11) AS BIGINT) AS telefone,
    -- CPF aleatório de 11 dígitos
    trunc(10000000000 + random() * (99999999999 - 10000000000)) AS cpf,
    -- Data de nascimento aleatória garantindo no mínimo 27 anos de idade
    (CURRENT_DATE - interval '27 years' - interval '1 day' * trunc(random() * 365*60)) AS data_nascimento,
    -- Email baseado no nome
    lower(replace(replace(Nome, ' ', ''), 'á', 'a') || '@usp.br') AS email
FROM
    (SELECT DISTINCT Nome FROM professores) AS nomes;


-- Removendo linhas com valores nulos, exceto o Nome
DELETE FROM professores_pcs
WHERE 
    telefone IS NULL AND
    cpf IS NULL AND
    data_nascimento IS NULL AND
    email IS NULL;

-- Removendo a chave primária atual e definindo o NUSP como nova chave primária
ALTER TABLE professores_pcs DROP CONSTRAINT professores_pcs_pkey;
ALTER TABLE professores_pcs ADD PRIMARY KEY (nusp);

-- Removendo a coluna ID
ALTER TABLE professores_pcs DROP COLUMN ID;



CREATE TABLE IF NOT EXISTS pcs (
    Sigla VARCHAR(10),
    Nome VARCHAR(200)
);

INSERT INTO pcs (Sigla, Nome) VALUES
('PCS3000', 'Acompanhamento de Pré-Mestrado em Engenharia de Computação'),
('PCS3110', 'Algoritmos e Estruturas de Dados para Engenharia Elétrica'),
('PCS3528', 'Análise de Desempenho de Sistemas Computacionais'),
('PCS3828', 'Análise de Desempenho de Sistemas Computacionais'),
('PCS3519', 'Aplicações e Tecnologias em Automação'),
('PCS3819', 'Aplicações e Tecnologias em Automação'),
('PCS3888', 'Aspectos Gerenciais e Estratégicos em Internet das Coisas'),
('PCS3589', 'Aspectos Legais em Tecnologia da Informação'),
('PCS3889', 'Aspectos Legais em Tecnologia da Informação'),
('PCS3623', 'Banco de Dados I'),
('PCS3899', 'Blockchain, Criptomoedas & Tecnologias Decentralizadas'),
('PCS3099', 'Computação Interativa'),
('PCS2038', 'Conceitos Gerais de Automação'),
('PCS2551', 'Conceitos Gerais de Automação'),
('PCS3529', 'Criação e Administração de Empresas de Computação'),
('PCS3829', 'Criação e Administração de Empresas de Computação'),
('PCS2060', 'Criação e Administração de Empresas de Computação'),
('PCS2590', 'Criação e Administração de Empresas de Computação'),
('PCS2530', 'Design e Programação de Games'),
('PCS3549', 'Design e Programação de Games'),
('PCS2554', 'Engenharia de Informação'),
('PCS2058', 'Engenharia de Informação'),
('PCS3818', 'Engenharia de Sistema de Computação'),
('PCS3213', 'Engenharia de Software'),
('PCS3413', 'Engenharia de Software e Banco de Dados'),
('PCS3617', 'Estágio Cooperativo I'),
('PCS2091', 'Estágio Cooperativo I'),
('PCS3727', 'Estágio Cooperativo II'),
('PCS2092', 'Estágio Cooperativo II'),
('PCS3737', 'Estágio Cooperativo III'),
('PCS2093', 'Estágio Cooperativo III'),
('PCS3847', 'Estágio Cooperativo IV'),
('PCS2094', 'Estágio Cooperativo IV'),
('PCS2095', 'Estágio Cooperativo V'),
('PCS3857', 'Estágio Cooperativo V'),
('PCS3567', 'Estágio Supervisionado I'),
('PCS2500', 'Estágio Supervisionado I'),
('PCS3577', 'Estágio Supervisionado II'),
('PCS2600', 'Estágio Supervisionado II'),
('PCS2190', 'Fundamentos de Computação I'),
('PCS2290', 'Fundamentos de Computação II'),
('PCS2408', 'Fundamentos de Engenharia de Software'),
('PCS2476', 'Fundamentos de Redes de Computadores'),
('PCS2426', 'Fundamentos de Sistemas de Tempo Real'),
('PCS3563', 'Gerência e Qualidade de Software'),
('PCS3863', 'Gerência e Qualidade de Software'),
('PCS2053', 'Gerência, Qualidade e Tecnologia de Software'),
('PCS2511', 'Gerência, Qualidade e Tecnologia de Software'),
('PCS3579', 'Inovação, Tecnologia, Estratégia de Negócio e a Sociedade'),
('PCS3879', 'Inovação, Tecnologia, Estratégias de Negócio e a Sociedade'),
('PCS3438', 'Inteligência Artificial'),
('PCS3838', 'Inteligência Artificial'),
('PCS2059', 'Inteligência Artificial'),
('PCS2428', 'Inteligência Artificial'),
('PCS3573', 'Interação Humano-Computador'),
('PCS3873', 'Interação Humano-Computador'),
('PCS3100', 'Introdução à Engenharia de Computação'),
('PCS2529', 'Introdução aos Processadores'),
('PCS3443', 'Laboratório de Engenharia de Software I'),
('PCS3643', 'Laboratório de Engenharia de Software I'),
('PCS3553', 'Laboratório de Engenharia de Software II'),
('PCS3853', 'Laboratório de Engenharia de Software II'),
('PCS2044', 'Laboratório de Engenharia de Software II'),
('PCS3432', 'Laboratório de Processadores'),
('PCS3732', 'Laboratório de Processadores'),
('PCS2498', 'Laboratório de Processadores II'),
('PCS3111', 'Laboratório de Programação Orientada a Objetos para Engenharia Elétrica'),
('PCS3434', 'Laboratório de Redes de Computadores'),
('PCS3734', 'Laboratório de Redes de Computadores'),
('PCS3558', 'Laboratório de Sistemas Embarcados'),
('PCS3858', 'Laboratório de Sistemas Embarcados'),
('PCS3335', 'Laboratório Digital A'),
('PCS3345', 'Laboratório Digital B'),
('PCS2305', 'Laboratório Digital I'),
('PCS3635', 'Laboratório Digital I'),
('PCS3645', 'Laboratório Digital II'),
('PCS3021', 'Linguagem Computacional'),
('PCS2056', 'Linguagens e Compiladores'),
('PCS3566', 'Linguagens e Compiladores'),
('PCS3866', 'Linguagens e Compiladores'),
('PCS2046', 'Lógica Computacional'),
('PCS3556', 'Lógica Computacional'),
('PCS3856', 'Lógica Computacional'),
('PCS2039', 'Modelagem e Simulação de Sistemas Computacionais'),
('PCS2401', 'Modelagem e Simulação de Sistemas Computacionais'),
('PCS2057', 'Multimídia e Hipermídia'),
('PCS2510', 'Multimídia e Hipermídia'),
('PCS2045', 'Negócios em Tempo Real'),
('PCS2581', 'Negócios em Tempo Real'),
('PCS2477', 'Organização de Computadores'),
('PCS3412', 'Organização e Arquitetura de Computadores I'),
('PCS3612', 'Organização e Arquitetura de Computadores I'),
('PCS3422', 'Organização e Arquitetura de Computadores II'),
('PCS3722', 'Organização e Arquitetura de Computadores II'),
('PCS2040', 'Projeto de Formatura I'),
('PCS2501', 'Projeto de Formatura I'),
('PCS3550', 'Projeto de Formatura I'),
('PCS3850', 'Projeto de Formatura I'),
('PCS2502', 'Projeto de Formatura II'),
('PCS3560', 'Projeto de Formatura II'),
('PCS3860', 'Projeto de Formatura II'),
('PCS2050', 'Projeto de Formatura II'),
('PCS2390', 'Projeto e Engenharia do Produto IV'),
('PCS0210', 'Redes de Computadores'),
('PCS2025', 'Redes de Computadores'),
('PCS3414', 'Redes de Computadores I'),
('PCS3614', 'Redes de Computadores I'),
('PCS3424', 'Redes de Computadores II'),
('PCS3724', 'Redes de Computadores II'),
('PCS2049', 'Requisitos de Sistemas Computacionais'),
('PCS2055', 'Segurança da Informação'),
('PCS2582', 'Segurança da Informação'),
('PCS3544', 'Segurança da Informação'),
('PCS3844', 'Segurança da Informação'),
('PCS3568', 'Sistemas de Computação de Alto Desempenho'),
('PCS3868', 'Sistemas de Computação de Alto Desempenho'),
('PCS3569', 'Sistemas de Informação para Engenharia'),
('PCS3869', 'Sistemas de Informação para Engenharia'),
('PCS3216', 'Sistemas de Programação'),
('PCS3616', 'Sistemas de Programação'),
('PCS3115', 'Sistemas Digitais I'),
('PCS3225', 'Sistemas Digitais II'),
('PCS3548', 'Sistemas Embarcados'),
('PCS3848', 'Sistemas Embarcados'),
('PCS3446', 'Sistemas Operacionais'),
('PCS3746', 'Sistemas Operacionais'),
('PCS3578', 'Sistemas Tolerantes a Falhas'),
('PCS3878', 'Sistemas Tolerantes a Falhas'),
('PCS2520', 'Tecnologia de Computação Gráfica'),
('PCS3539', 'Tecnologia de Computação Gráfica'),
('PCS3559', 'Tecnologias para Aplicações Interativas'),
('PCS3859', 'Tecnologias para Aplicações Interativas'),
('PCS2478', 'Tópicos de Programação');


ALTER TABLE pcs
ADD COLUMN Sigla_dept VARCHAR(3) DEFAULT 'PCS';



ALTER TABLE professores_pcs
ADD CONSTRAINT unique_nusp_pcs UNIQUE (nusp);

ALTER TABLE pcs
ADD CONSTRAINT unique_sigla_pcs UNIQUE (Sigla);

-- Passo 1: Criar a tabela de associação entre professores e disciplinas
CREATE TABLE IF NOT EXISTS professores_disciplinas_pcs (
    ID SERIAL PRIMARY KEY,
    nusp INTEGER,
    Sigla VARCHAR (10),
    FOREIGN KEY (nusp) REFERENCES professores_pcs(nusp),
    FOREIGN KEY (Sigla) REFERENCES pcs(Sigla)
);

-- Passo 2: Gerar aleatoriamente o número de disciplinas para cada professor, garantindo no máximo 7
WITH RandomDisciplinas AS (
    SELECT 
        p.nusp AS nusp,
        trunc(random() * 7) + 1 AS Num_Disciplinas
    FROM professores_pcs p
)

-- Passo 3: Gerar aleatoriamente a lista de disciplinas para cada professor, limitando a um máximo de 7 disciplinas
INSERT INTO professores_disciplinas_pcs (nusp, Sigla)
SELECT
    rd.nusp AS nusp,
    c.Sigla AS Sigla_curso
FROM
    RandomDisciplinas rd
JOIN LATERAL (
    SELECT Sigla FROM pcs ORDER BY random() LIMIT least(rd.Num_Disciplinas, 7)
) c ON TRUE;

-- Passo 4: Inserir os registros na tabela de associação
INSERT INTO professores_disciplinas_pcs (nusp, Sigla)
SELECT
    p.nusp AS nusp,
    c.Sigla AS Sigla_curso
FROM
    professores_pcs p
CROSS JOIN LATERAL (
    SELECT Sigla FROM pcs ORDER BY random() LIMIT trunc(random() * 5) + 1
) c;








































-- Criação da tabela professores_psi
CREATE TABLE IF NOT EXISTS professores_psi (
    ID SERIAL PRIMARY KEY,
    nusp INTEGER,
    Sigla_dept VARCHAR(3) DEFAULT 'PSI',
    Nome VARCHAR(100),
    telefone BIGINT,
    cpf BIGINT,
    data_nascimento DATE ,
    email VARCHAR(40)
);

INSERT INTO professores_psi (Nome)
VALUES
('José Almeida Rodrigues'),
('Marcela Lima Pereira'),
('Carlos Fernandes Oliveira'),
('Patrícia Santos Alves'),
('Luciano Costa Rodrigues'),
('Fernanda Oliveira Silva'),
('Roberto Lima Almeida'),
('Natália Silva Fernandes'),
('Thiago Alves Costa'),
('Ana Paula Fernandes Lima'),
('Leandro Oliveira Santos'),
('Renata Costa Almeida'),
('André Santos Lima'),
('Luiza Almeida Rodrigues'),
('Rafaela Costa Alves'),
('Gustavo Lima Fernandes'),
('Carolina Almeida Santos'),
('Felipe Fernandes Lima'),
('Isadora Costa Oliveira'),
('Rodrigo Alves Pereira'),
('Aline Lima Fernandes'),
('Bruno Oliveira Rodrigues'),
('Tatiana Santos Costa'),
('Ricardo Almeida Silva'),
('Priscila Fernandes Lima');



-- Povoar a tabela professores com dados aleatórios
INSERT INTO professores_psi (nusp, Sigla_dept, Nome, telefone, cpf, data_nascimento, email)
SELECT
    -- NUSP aleatório menor que 14000000
    trunc(random() * 14000000) AS nusp,
    'PSI' AS Sigla_dept,
    Nome,
    CAST(substring((119000000000 + trunc(random() * 10000000000))::text from 2 for 11) AS BIGINT) AS telefone,
    -- CPF aleatório de 11 dígitos
    trunc(10000000000 + random() * (99999999999 - 10000000000)) AS cpf,
    -- Data de nascimento aleatória garantindo no mínimo 27 anos de idade
    (CURRENT_DATE - interval '27 years' - interval '1 day' * trunc(random() * 365*60)) AS data_nascimento,
    -- Email baseado no nome
    lower(replace(replace(Nome, ' ', ''), 'á', 'a') || '@usp.br') AS email
FROM
    (SELECT DISTINCT Nome FROM professores) AS nomes;


-- Removendo linhas com valores nulos, exceto o Nome
DELETE FROM professores_psi
WHERE 
    telefone IS NULL AND
    cpf IS NULL AND
    data_nascimento IS NULL AND
    email IS NULL;

-- Removendo a chave primária atual e definindo o NUSP como nova chave primária
ALTER TABLE professores_psi DROP CONSTRAINT professores_psi_pkey;
ALTER TABLE professores_psi ADD PRIMARY KEY (nusp);

-- Removendo a coluna ID
ALTER TABLE professores_psi DROP COLUMN ID;






CREATE TABLE IF NOT EXISTS psi (
    Sigla VARCHAR(10),
    Nome VARCHAR(100)
);

INSERT INTO psi (Sigla, Nome) VALUES
('PSI3482', 'Antenas, Micro-ondas e Óptica Moderna'),
('PSI3260', 'Aplicações de Álgebra Linear'),
('PSI3441', 'Arquitetura de Sistemas Embarcados'),
('PSI3581', 'Circuitos de Micro-Ondas'),
('PSI3211', 'Circuitos Elétricos I'),
('PSI3213', 'Circuitos Elétricos II'),
('PSI2618', 'Circuitos Eletrônicos Automotivos'),
('PSI3572', 'Computação Visual'),
('PSI3472', 'Concepção e Implementação de Sistemas Eletrônicos Inteligentes'),
('PSI3024', 'Eletrônica'),
('PSI3561', 'Eletrônica Automotiva'),
('PSI2461', 'Eletrônica de Controle Industrial'),
('PSI3321', 'Eletrônica I'),
('PSI3322', 'Eletrônica II'),
('PSI3421', 'Eletrônica III'),
('PSI3593', 'Estágio Supervisionado'),
('PSI2593', 'Estágio Supervisionado'),
('PSI3532', 'Filtragem Adaptativa e Aplicações'),
('PSI3262', 'Fundamentos de Circuitos Eletrônicos Digitais e Analógicos'),
('PSI3471', 'Fundamentos de Sistemas Eletrônicos Inteligentes'),
('PSI2617', 'Inovação em Engenharia'),
('PSI3465', 'Inovação em Engenharia'),
('PSI3031', 'Laboratório de Circuitos Elétricos'),
('PSI3212', 'Laboratório de Circuitos Elétricos'),
('PSI3460', 'Laboratório de Circuitos Eletrônicos'),
('PSI2316', 'Laboratório de Eletricidade II'),
('PSI3032', 'Laboratório de Eletrônica I'),
('PSI3323', 'Laboratório de Eletrônica I'),
('PSI3463', 'Laboratório de Fabricação de Circuitos Integrados'),
('PSI2643', 'Laboratório de Fabricação de Dispositivos em Microeletrônica'),
('PSI3214', 'Laboratório de Instrumentação Elétrica'),
('PSI3261', 'Laboratório de Projetos de Eletricidade e Eletrônica'),
('PSI3422', 'Laboratório de Sistemas Eletrônicos'),
('PSI2653', 'Meios Eletrônicos Interativos I'),
('PSI2654', 'Meios Eletrônicos Interativos II'),
('PSI3461', 'Métodos Matriciais em Reconhecimento de Padrões'),
('PSI3483', 'Ondas Eletromagnéticas em Meios Guiados'),
('PSI3563', 'Óptica Integrada e Dispositivos Ópticos'),
('PSI3568', 'Pesquisa em Eletronica e Sistemas I'),
('PSI3569', 'Pesquisa em Eletronica e Sistemas II'),
('PSI3263', 'Práticas de Eletricidade e Eletrônica'),
('PSI3571', 'Práticas em Reconhecimento de Padrões, Modelagem e Inteligência Computacional'),
('PSI2672', 'Práticas em Reconhecimento de Padrões, Modelagem e Neurocomputação'),
('PSI3432', 'Processamento de Áudio e Imagem'),
('PSI3531', 'Processamento de Sinais Aplicado'),
('PSI3501', 'Processamento de Voz e Aprendizagem de Máquina'),
('PSI3431', 'Processamento Estatístico de Sinais'),
('PSI3552', 'Processos e Caracterização de Dispositivos Nanoeletrônicos'),
('PSI2613', 'Projeto de Circuitos Híbridos e Módulos Eletrônicos'),
('PSI3452', 'Projeto de Circuitos Integrados Digitais e Analógicos'),
('PSI3451', 'Projeto de Circuitos Lógicos Integrados'),
('PSI3591', 'Projeto de Formatura I'),
('PSI2591', 'Projeto de Formatura I'),
('PSI3592', 'Projeto de Formatura II'),
('PSI2594', 'Projeto de Formatura II'),
('PSI3442', 'Projeto de Sistemas Embarcados'),
('PSI3551', 'Projeto de Sistemas Embarcados em Chips'),
('PSI2553', 'Projeto de Sistemas Integrados'),
('PSI3502', 'Realidade Virtual'),
('PSI3464', 'Sensores: da Automação Industrial à IoT'),
('PSI3560', 'Sistemas Cognitivos'),
('PSI3582', 'Sistemas DWDM e Redes Ópticas de Transporte'),
('PSI3541', 'Sistemas Embarcados Distribuídos'),
('PSI3542', 'Sistemas Embarcados para IoT'),
('PSI3481', 'Sistemas Ópticos e de Micro-ondas'),
('PSI2634', 'Técnicas de Controle em Finanças Quantitativas Aplicadas'),
('PSI3462', 'Técnicas de Controle em Finanças Quantitativas Aplicadas'),
('PSI3562', 'Veículos Inteligentes');


ALTER TABLE psi
ADD COLUMN Sigla_dept VARCHAR(3) DEFAULT 'PSI';


ALTER TABLE professores_psi
ADD CONSTRAINT unique_nusp_psi UNIQUE (nusp);

ALTER TABLE psi
ADD CONSTRAINT unique_sigla_psi UNIQUE (Sigla);

-- Passo 1: Criar a tabela de associação entre professores e disciplinas
CREATE TABLE IF NOT EXISTS professores_disciplinas_psi (
    ID SERIAL PRIMARY KEY,
    nusp INTEGER,
    Sigla VARCHAR (10),
    FOREIGN KEY (nusp) REFERENCES professores_psi(nusp),
    FOREIGN KEY (Sigla) REFERENCES psi(Sigla)
);

-- Passo 2: Gerar aleatoriamente o número de disciplinas para cada professor, garantindo no máximo 7
WITH RandomDisciplinas AS (
    SELECT 
        p.nusp AS nusp,
        trunc(random() * 7) + 1 AS Num_Disciplinas
    FROM professores_psi p
)

-- Passo 3: Gerar aleatoriamente a lista de disciplinas para cada professor, limitando a um máximo de 7 disciplinas
INSERT INTO professores_disciplinas_psi (nusp, Sigla)
SELECT
    rd.nusp AS nusp,
    c.Sigla AS Sigla_curso
FROM
    RandomDisciplinas rd
JOIN LATERAL (
    SELECT Sigla FROM psi ORDER BY random() LIMIT least(rd.Num_Disciplinas, 7)
) c ON TRUE;

-- Passo 4: Inserir os registros na tabela de associação
INSERT INTO professores_disciplinas_psi (nusp, Sigla)
SELECT
    p.nusp AS nusp,
    c.Sigla AS Sigla_curso
FROM
    professores_psi p
CROSS JOIN LATERAL (
    SELECT Sigla FROM psi ORDER BY random() LIMIT trunc(random() * 5) + 1
) c;































-- Criação da tabela professores_ptc
CREATE TABLE IF NOT EXISTS professores_ptc (
    ID SERIAL PRIMARY KEY,
    nusp INTEGER,
    Sigla_dept VARCHAR(3) DEFAULT 'PTC',
    Nome VARCHAR(100),
    telefone BIGINT,
    cpf BIGINT,
    data_nascimento DATE ,
    email VARCHAR(40)
);

INSERT INTO professores_ptc (Nome)
VALUES
('Renato Almeida Pereira'),
('Mariana Costa Santos'),
('Diego Oliveira Fernandes'),
('Amanda Rodrigues Lima'),
('Vinícius Lima Alves'),
('Jéssica Fernandes Costa'),
('Felipe Almeida Rodrigues'),
('Carla Lima Alves'),
('Gabriel Santos Oliveira'),
('Isabela Fernandes Silva'),
('Roberto Alves Costa'),
('Natália Lima Fernandes'),
('Thiago Oliveira Almeida'),
('Ana Paula Costa Lima'),
('Leandro Fernandes Santos'),
('Rafaela Almeida Rodrigues'),
('Gustavo Lima Pereira'),
('Carolina Fernandes Alves'),
('Fernando Almeida Oliveira'),
('Isadora Lima Costa'),
('Rogério Santos Almeida'),
('Alice Costa Fernandes'),
('Lucas Almeida Silva'),
('Mariana Fernandes Lima'),
('Pedro Oliveira Alves'),
('Bruna Lima Santos'),
('Tatiana Almeida Fernandes'),
('Ricardo Fernandes Costa'),
('Priscila Alves Lima'),
('Renato Costa Silva'),
('Camila Lima Almeida'),
('Daniel Fernandes Oliveira'),
('Marina Almeida Costa'),
('Diego Lima Fernandes'),
('Amanda Alves Santos');


-- Populando a tabela professores_ptc com dados aleatórios
-- Povoar a tabela professores com dados aleatórios
INSERT INTO professores_ptc (nusp, Sigla_dept, Nome, telefone, cpf, data_nascimento, email)
SELECT
    -- NUSP aleatório menor que 14000000
    trunc(random() * 14000000) AS nusp,
    'PTC' AS Sigla_dept,
    Nome,
    CAST(substring((119000000000 + trunc(random() * 10000000000))::text from 2 for 11) AS BIGINT) AS telefone,
    -- CPF aleatório de 11 dígitos
    trunc(10000000000 + random() * (99999999999 - 10000000000)) AS cpf,
    -- Data de nascimento aleatória garantindo no mínimo 27 anos de idade
    (CURRENT_DATE - interval '27 years' - interval '1 day' * trunc(random() * 365*60)) AS data_nascimento,
    -- Email baseado no nome
    lower(replace(replace(Nome, ' ', ''), 'á', 'a') || '@usp.br') AS email
FROM
    (SELECT DISTINCT Nome FROM professores) AS nomes;


-- Removendo linhas com valores nulos, exceto o Nome
DELETE FROM professores_ptc
WHERE 
    telefone IS NULL AND
    cpf IS NULL AND
    data_nascimento IS NULL AND
    email IS NULL;

-- Removendo a chave primária atual e definindo o NUSP como nova chave primária
ALTER TABLE professores_ptc DROP CONSTRAINT professores_ptc_pkey;
ALTER TABLE professores_ptc ADD PRIMARY KEY (nusp);

-- Removendo a coluna ID
ALTER TABLE professores_ptc DROP COLUMN ID;




CREATE TABLE IF NOT EXISTS ptc (
    Sigla VARCHAR(10),
    Nome VARCHAR(100)
);

INSERT INTO ptc (Sigla, Nome) VALUES
('PTC3444', 'Antenas e Propagação'),
('PTC3527', 'Anteprojeto de Formatura em Telecomunicações'),
('PTC2620', 'Automação da Manufatura'),
('PTC3520', 'Automação da Manufatura'),
('PTC3536', 'Bases para a Engenharia Neural'),
('PTC3567', 'Ciência dos Dados em Automação e Engenharia'),
('PTC3565', 'Ciência, Tecnologia e Sociedade'),
('PTC3547', 'Codificação e Transmissão Multimídia'),
('PTC3414', 'Controle de Processos Industriais'),
('PTC3419', 'Controle Digital'),
('PTC3413', 'Controle Multivariável'),
('PTC3417', 'Controle Não Linear'),
('PTC3572', 'Dinâmica e Controle em Tempo Discreto'),
('PTC3575', 'Dinâmica não Linear'),
('PTC3213', 'Eletromagnetismo'),
('PTC3570', 'Engenharia Clínica'),
('PTC3019', 'Engenharia de Comunicações'),
('PTC2359', 'Engenharia de Comunicações'),
('PTC3101', 'Engenho e Arte do Controle Automático'),
('PTC3501', 'Estágio Supervisionado'),
('PTC3502', 'Estágio Supervisionado'),
('PTC2601', 'Estágio Supervisionado'),
('PTC2501', 'Estágio Supervisionado'),
('PTC3577', 'Fundamentos de Segurança Computacional para Sistemas Nucleares'),
('PTC3421', 'Instrumentação Industrial'),
('PTC3548', 'Introdução à Compatibilidade Eletromagnética'),
('PTC2669', 'Introdução à Inteligência Computacional'),
('PTC3569', 'Introdução à Inteligência Computacional'),
('PTC3360', 'Introdução a Redes e Comunicações'),
('PTC3361', 'Introdução ao Processamento Digital de Sinais'),
('PTC3470', 'Introdução ao Projeto de Sistemas de Controle Robustos'),
('PTC3467', 'Introdução aos Algoritmos em Automação'),
('PTC3540', 'Laboratório de Antenas e Microondas'),
('PTC2440', 'Laboratório de Antenas e Microondas'),
('PTC2619', 'Laboratório de Automação'),
('PTC3418', 'Laboratório de Automação'),
('PTC2429', 'Laboratório de Circuitos de Comunicações'),
('PTC3429', 'Laboratório de Circuitos de Comunicações'),
('PTC2527', 'Laboratório de Comunicações: Ante-projeto de Formatura'),
('PTC2528', 'Laboratório de Comunicações: Projeto de Formatura'),
('PTC3260', 'Laboratório de Conectividade'),
('PTC2512', 'Laboratório de Controle'),
('PTC3312', 'Laboratório de Controle'),
('PTC3546', 'Laboratório de Processamento Digital de Sinais'),
('PTC2530', 'Laboratório de Projeto de Automação e Controle I'),
('PTC3530', 'Laboratório de Projeto de Automação e Controle I'),
('PTC2531', 'Laboratório de Projeto de Automação e Controle II'),
('PTC3531', 'Laboratório de Projeto de Automação e Controle II'),
('PTC3441', 'Modelagem e Controle de Manipuladores Robóticos'),
('PTC3415', 'Modelagem e Simulação'),
('PTC3422', 'Modelos de Sistemas Biológicos'),
('PTC3440', 'Modelos Probabilísticos'),
('PTC3314', 'Ondas e Linhas'),
('PTC2584', 'Planejamento de Sistemas de Comunicações'),
('PTC3471', 'Práticas de Projeto de Sistemas de Controle'),
('PTC3492', 'Princípios da Formação e Processamento de Imagens Médicas'),
('PTC3435', 'Princípios de Instrumentação Biomédica'),
('PTC2547', 'Princípios de Televisão Digital'),
('PTC3456', 'Processamento de Sinais Biomédicos'),
('PTC3424', 'Processamento Digital de Sinais'),
('PTC3545', 'Processamento Digital de Sinais II'),
('PTC3451', 'Processamento Estatístico e Adaptativo'),
('PTC3405', 'Processos Estocásticos'),
('PTC3420', 'Programação Matemática Aplicada a Controle'),
('PTC3528', 'Projeto de Formatura em Telecomunicações'),
('PTC3611', 'Projeto de Pesquisa em Engenharia de Sistemas I'),
('PTC3612', 'Projeto de Pesquisa em Engenharia de Sistemas II'),
('PTC3613', 'Projeto de Pesquisa em Telecomunicações I'),
('PTC3614', 'Projeto de Pesquisa em Telecomunicações II'),
('PTC3214', 'Realidade e Probabilidade: Simulações para Compreender o Mundo'),
('PTC3450', 'Redes de Comunicação'),
('PTC2550', 'Redes de Comunicação de Dados e Transporte Multimídia'),
('PTC3578', 'Segurança e licenciamento de instalações nucleares'),
('PTC2459', 'Sistemas de Comunicação'),
('PTC3449', 'Sistemas de Comunicação'),
('PTC3020', 'Sistemas de Controle'),
('PTC3313', 'Sistemas de Controle'),
('PTC3568', 'Sistemas Digitais em Controle de Processos'),
('PTC3007', 'Sistemas e Sinais'),
('PTC3307', 'Sistemas e Sinais'),
('PTC2549', 'Sistemas Telefônicos'),
('PTC3452', 'Teoria da Informação e Codificação'),
('PTC3432', 'Teoria das Comunicações'),
('PTC2666', 'Tópicos de Controle Avançado'),
('PTC3566', 'Tópicos de Controle Avançado');


ALTER TABLE ptc
ADD COLUMN Sigla_dept VARCHAR(3) DEFAULT 'PTC';


ALTER TABLE professores_ptc
ADD CONSTRAINT unique_nusp_ptc UNIQUE (nusp);

ALTER TABLE ptc
ADD CONSTRAINT unique_sigla_ptc UNIQUE (Sigla);

-- Passo 1: Criar a tabela de associação entre professores e disciplinas
CREATE TABLE IF NOT EXISTS professores_disciplinas_ptc (
    ID SERIAL PRIMARY KEY,
    nusp INTEGER,
    Sigla VARCHAR (10),
    FOREIGN KEY (nusp) REFERENCES professores_ptc(nusp),
    FOREIGN KEY (Sigla) REFERENCES ptc(Sigla)
);

-- Passo 2: Gerar aleatoriamente o número de disciplinas para cada professor, garantindo no máximo 7
WITH RandomDisciplinas AS (
    SELECT 
        p.nusp AS nusp,
        trunc(random() * 7) + 1 AS Num_Disciplinas
    FROM professores_ptc p
)

-- Passo 3: Gerar aleatoriamente a lista de disciplinas para cada professor, limitando a um máximo de 7 disciplinas
INSERT INTO professores_disciplinas_ptc (nusp, Sigla)
SELECT
    rd.nusp AS nusp,
    c.Sigla AS Sigla_curso
FROM
    RandomDisciplinas rd
JOIN LATERAL (
    SELECT Sigla FROM ptc ORDER BY random() LIMIT least(rd.Num_Disciplinas, 7)
) c ON TRUE;

-- Passo 4: Inserir os registros na tabela de associação
INSERT INTO professores_disciplinas_ptc (nusp, Sigla)
SELECT
    p.nusp AS nusp,
    c.Sigla AS Sigla_curso
FROM
    professores_ptc p
CROSS JOIN LATERAL (
    SELECT Sigla FROM ptc ORDER BY random() LIMIT trunc(random() * 5) + 1
) c;








INSERT INTO departamento (sigla_departamento, nome, nusp_coordenador)
SELECT * FROM (
    -- Selecionar dados da Tabela 1
    (SELECT 'PEA' AS sigla_departamento, 'Departamento de Energia e Meio Ambiente' AS nome, nusp_coordenador
    FROM professores
    LIMIT 1)
    UNION ALL
    -- Selecionar dados da Tabela 2
    (SELECT 'PCS' AS sigla_departamento, 'Departamento de Computação e Sistemas Digitais' AS nome, nusp_coordenador
    FROM professores_pcs
    LIMIT 1)
    UNION ALL
    -- Selecionar dados da Tabela 3
    (SELECT 'PSI' AS sigla_departamento, 'Departamento de Sistemas Integrados' AS nom, nusp_coordenador
    FROM professores_psi
    LIMIT 1)
    UNION ALL
    -- Selecionar dados da Tabela 4
    (SELECT 'PTC' AS sigla_departamento, 'Departamento de Telecomunicações' AS nome, nusp_coordenador
    FROM professores_ptc
    LIMIT 1)
) AS TabelaResultante;



INSERT INTO disciplina
SELECT * FROM (
-- Selecionar dados da Tabela 1
SELECT Sigla, Sigla_dept, Nome
FROM pea
UNION ALL
-- Selecionar dados da Tabela 2
SELECT Sigla, Sigla_dept, Nome
FROM pcs
UNION ALL
-- Selecionar dados da Tabela 3
SELECT Sigla, Sigla_dept, Nome
FROM psi
UNION ALL
-- Selecionar dados da Tabela 4
SELECT Sigla, Sigla_dept, Nome
FROM ptc
) AS TabelaResultante;



INSERT INTO professor
SELECT * FROM (
-- Selecionar dados da Tabela 1
SELECT nusp, Sigla_dept, Nome, telefone, cpf, data_nascimento, email
FROM professores
UNION ALL
-- Selecionar dados da Tabela 2
SELECT nusp, Sigla_dept, Nome, telefone, cpf, data_nascimento, email
FROM professores_pcs
UNION ALL
-- Selecionar dados da Tabela 3
SELECT nusp, Sigla_dept, Nome, telefone, cpf, data_nascimento, email
FROM professores_psi
UNION ALL
-- Selecionar dados da Tabela 4
SELECT nusp, Sigla_dept, Nome, telefone, cpf, data_nascimento, email
FROM professores_ptc
) AS TabelaResultante;



INSERT INTO ministra (id_ministra, sigla_disciplina, nusp_professor)
SELECT row_number() over() AS id_ministra, * FROM (
    -- Selecionar dados da Tabela 1
    SELECT sigla AS sigla_disciplina, nusp AS nusp_professor
    FROM professores_disciplinas
    UNION ALL
    -- Selecionar dados da Tabela 2
    SELECT sigla AS sigla_disciplina, nusp AS nusp_professor
    FROM professores_disciplinas_pcs
    UNION ALL
    -- Selecionar dados da Tabela 3
    SELECT sigla AS sigla_disciplina, nusp AS nusp_professor
    FROM professores_disciplinas_psi
    UNION ALL
    -- Selecionar dados da Tabela 4
    SELECT sigla AS sigla_disciplina, nusp AS nusp_professor
    FROM professores_disciplinas_ptc
) AS TabelaResultante;


-- Drop the table if it already exists
DROP TABLE IF EXISTS matricula;

-- Create a new table for matricula
CREATE TABLE matricula (
    id_matricula SERIAL PRIMARY KEY,
    sigla_disciplina VARCHAR(50) NOT NULL,
    nusp_aluno INT NOT NULL
);

-- Insert data into matricula table
INSERT INTO matricula (sigla_disciplina, nusp_aluno)
SELECT sigla_disciplina, nusp_aluno
FROM (
    SELECT d.sigla_disciplina, a.nusp,
           ROW_NUMBER() OVER (PARTITION BY a.nusp ORDER BY random()) AS row_num
    FROM disciplina d
    CROSS JOIN (
        SELECT nusp FROM aluno
    ) a
) subquery
WHERE subquery.row_num <= 10
ORDER BY random()
LIMIT (SELECT COUNT(*) FROM disciplina) * 10; -- Limita o número total de matrículas





DROP TABLE professores_disciplinas;

DROP TABLE professores;

DROP TABLE pea;

DROP TABLE professores_disciplinas_pcs;

DROP TABLE professores_pcs;

DROP TABLE pcs;

DROP TABLE professores_disciplinas_psi;

DROP TABLE professores_psi;

DROP TABLE psi;

DROP TABLE professores_disciplinas_ptc;

DROP TABLE professores_ptc;

DROP TABLE ptc;
