import client from './config.js';

// Função para consultar alunos por nome, nusp e ano de ingresso e retornar o número total de resultados
async function consultarAlunosPorNomeNuspAnoIngresso(nome, nusp, anoIngresso) {
  try {
      await client.connect(); // Conecta ao banco de dados
      
      // Consulta para obter os alunos
      const query = `
        SELECT *
        FROM aluno
        WHERE nome LIKE $1
        AND CAST(nusp AS TEXT) LIKE $2
        AND CAST(ano_ingresso AS TEXT) LIKE $3`;
      const result = await client.query(query, [`%${nome}%`, `${nusp}%`, `${anoIngresso}%`]);

      // Consulta para contar o número total de alunos
      const countQuery = `
          SELECT COUNT(*) AS total_alunos
          FROM aluno
          WHERE nome LIKE $1
          AND CAST(nusp AS TEXT) LIKE $2
          AND CAST(ano_ingresso AS TEXT) LIKE $3`;
      const countResult = await client.query(countQuery, [`%${nome}%`, `${nusp}%`, `${anoIngresso}%`]);
      const totalAlunos = parseInt(countResult.rows[0].total_alunos);

      return { alunos: result.rows, totalAlunos };
  } catch (error) {
      console.error('Erro ao executar a consulta:', error);
      return { alunos: [], totalAlunos: 0 };
  } finally {
      await client.end();
  }
}

// Função para consultar professores por nome e nusp e retornar o número total de resultados
async function consultarProfessorPorNomeNusp(nome, nusp) {
  try {
      await client.connect(); // Conecta ao banco de dados
      
      // Consulta para obter os professores
      const query = `
          SELECT *
          FROM professor
          WHERE nome LIKE '%$1%'
          AND CAST(nusp AS TEXT) LIKE '$2%'`;
      const result = await client.query(query, [`%${nome}%`, `%${nusp}%`]);

      // Consulta para contar o número total de professores
      const countQuery = `
          SELECT COUNT(*) AS total_professores
          FROM professor
          WHERE nome LIKE '%$1%'
          AND CAST(nusp AS TEXT) LIKE '$2%'`;
      const countResult = await client.query(countQuery, [`%${nome}%`, `%${nusp}%`]);
      const totalProfessores = parseInt(countResult.rows[0].total_professores);

      return { professores: result.rows, totalProfessores };
  } catch (error) {
      console.error('Erro ao executar a consulta:', error);
      return { professores: [], totalProfessores: 0 };
  } finally {
      await client.end();
  }
}


// Função para consultar disciplinas por sigla e nome
async function consultarDisciplinaporSiglaNome(sigla, nome) {
  try {
      await client.connect(); // Conecta ao banco de dados
      
      // Consulta para obter disciplinas
      const queryDisciplinas = `
          SELECT * 
          FROM disciplina 
          WHERE nome LIKE '%$1%' 
          AND sigla LIKE '%$2%'`;

      // Consulta para contar o número de disciplinas
      const queryCount = `
          SELECT COUNT(*) 
          FROM disciplina 
          WHERE nome LIKE '%$1%' 
          AND sigla LIKE '%$2%'`;

      // Executa a consulta para obter disciplinas
      const resultDisciplinas = await client.query(queryDisciplinas, [`%${sigla}%`, `%${nome}%`]);
      const disciplinas = resultDisciplinas.rows;

      // Executa a consulta para contar o número de disciplinas
      const resultCount = await client.query(queryCount, [`%${sigla}%`, `%${nome}%`]);
      const count = parseInt(resultCount.rows[0].count); // Converte a contagem para um número inteiro

      return { disciplinas, count };
  } catch (error) {
      console.error('Erro ao executar a consulta:', error);
      return { disciplinas: [], count: 0 };
  } finally {
      await client.end();
  }
}


// Função para consultar departanento por sigla e nome
async function consultarDepartamentoporSiglaNome(sigla, nome) {
  try {
      await client.connect(); // Conecta ao banco de dados
      
      const query = `
          SELECT * 
          FROM departamento 
          WHERE nome LIKE '%$1%' 
          AND sigla LIKE '%$2%'`;
      const result = await client.query(query, [`%${sigla}%`, `%${nome}%`]);
      
      return result.rows;
      
  } catch (error) {
      console.error('Erro ao executar a consulta:', error);
      return [];
  } finally {
      await client.end();
  }
}

// Função para exibir alunos que cursam uma disciplina
async function exibirAlunosPorDisciplina(siglaDisciplina) {
  try {
      await client.connect(); // Conecta ao banco de dados
      
      // Consulta para obter os alunos que cursam a disciplina
      const query = `
          SELECT a.nome, a.nusp
          FROM aluno a
          JOIN matricula m ON a.nusp = m.nusp
          WHERE m.sigla_disciplina = $1`;
      
      const result = await client.query(query, [siglaDisciplina]);

      return result.rows;
  } catch (error) {
      console.error('Erro ao executar a consulta:', error);
      return [];
  } finally {
      await client.end();
  }
}


// Função para exibir disciplinas que um aluno cursa
async function exibirDisciplinasPorAluno(nuspAluno) {
  try {
      await client.connect(); // Conecta ao banco de dados
      
      // Consulta para obter as disciplinas que o aluno cursa
      const query = `
          SELECT d.nome, d.sigla
          FROM disciplina d
          JOIN matricula m ON d.sigla = m.sigla_disciplina
          WHERE m.nusp = $1`;
      
      const result = await client.query(query, [nuspAluno]);

      return result.rows;
  } catch (error) {
      console.error('Erro ao executar a consulta:', error);
      return [];
  } finally {
      await client.end();
  }
}


// Função para retornar todas as disciplinas de um departamento
async function obterDisciplinasPorDepartamento(siglaDepartamento) {
    try {
        await client.connect(); // Conecta ao banco de dados
        
        // Consulta para obter as disciplinas do departamento
        const query = `
            SELECT *
            FROM disciplina
            WHERE sigla_departamento = $1`;
        
        const result = await client.query(query, [siglaDepartamento]);

        return result.rows;
    } catch (error) {
        console.error('Erro ao executar a consulta:', error);
        return [];
    } finally {
        await client.end();
    }
}

async function obterCoordenadorDepartamento(siglaDepartamento) {
  try {
      await client.connect(); // Conecta ao banco de dados
      
      // Consulta para obter o nome do coordenador do departamento
      const query = `
          SELECT f.nome
          FROM funcionario f
          JOIN departamento d ON f.nusp = d.coordenador
          WHERE d.sigla = $1`;
      
      const result = await client.query(query, [siglaDepartamento]);

      if (result.rows.length > 0) {
          return result.rows[0].nome; // Retorna o nome do coordenador
      } else {
          return 'Coordenador não encontrado';
      }
  } catch (error) {
      console.error('Erro ao executar a consulta:', error);
      return 'Erro ao buscar o coordenador';
  } finally {
      await client.end();
  }
}

// Função para retornar todas as disciplinas ministradas por um professor
async function obterDisciplinasPorProfessor(nuspProfessor) {
  try {
      await client.connect(); // Conecta ao banco de dados
      
      // Consulta para obter as disciplinas ministradas pelo professor
      const query = `
          SELECT d.*
          FROM disciplina d
          JOIN ministra m ON d.sigla = m.sigla_disciplina
          WHERE m.nusp_professor = $1`;
      
      const result = await client.query(query, [nuspProfessor]);

      return result.rows;
  } catch (error) {
      console.error('Erro ao executar a consulta:', error);
      return [];
  } finally {
      await client.end();
  }
}

// Função para retornar todos os professores que ministram uma disciplina
async function obterProfessoresPorDisciplina(siglaDisciplina) {
  try {
      await client.connect(); // Conecta ao banco de dados
      
      // Consulta para obter os professores que ministram a disciplina
      const query = `
          SELECT f.*
          FROM funcionario f
          JOIN ministra m ON f.nusp = m.nusp_professor
          WHERE m.sigla_disciplina = $1`;
      
      const result = await client.query(query, [siglaDisciplina]);

      return result.rows;
  } catch (error) {
      console.error('Erro ao executar a consulta:', error);
      return [];
  } finally {
      await client.end();
  }
}

// Função para listar os professores de um departamento e contar o número de professores
async function listarProfessoresPorDepartamento(siglaDepartamento) {
  try {
      await client.connect(); // Conecta ao banco de dados
      
      // Consulta para obter os professores do departamento
      const query = `
          SELECT nome, nusp
          FROM funcionario
          WHERE sigla_departamento = $1`;

      // Consulta para contar o número total de professores no departamento
      const countQuery = `
          SELECT COUNT(*) AS total_professores
          FROM funcionario
          WHERE sigla_departamento = $1`;

      const result = await client.query(query, [siglaDepartamento]);
      const countResult = await client.query(countQuery, [siglaDepartamento]);

      const professores = result.rows;
      const totalProfessores = parseInt(countResult.rows[0].total_professores);

      return { professores, totalProfessores };
  } catch (error) {
      console.error('Erro ao executar a consulta:', error);
      return { professores: [], totalProfessores: 0 };
  } finally {
      await client.end();
  }
}

// export default { 
//   consultarDepartamentoporSiglaNome, 
//   consultarProfessorPorNomeNusp,
//   consultarAlunosPorNomeNuspAnoIngresso,
//   consultarDisciplinaporSiglaNome,
//   exibirAlunosPorDisciplina,
//   exibirDisciplinasPorAluno,
//   obterDisciplinasPorDepartamento,
//   obterCoordenadorDepartamento,
//   obterDisciplinasPorProfessor,
//   obterProfessoresPorDisciplina,
//   listarProfessoresPorDepartamento
// };

export default consultarAlunosPorNomeNuspAnoIngresso;
