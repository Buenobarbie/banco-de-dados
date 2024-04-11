import readline from 'readline';
// import consultarAlunosPorNomeNuspAnoIngresso from './consultas.js';

// FUNÇÕES --------------------------------------------------------------------------------------------
const babs = 1;
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
      console.log("------- Alunos encontrados -------")
      console.log(result.rows);
      console.log("Total de alunos encontrados: ", totalAlunos)
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
          WHERE nome LIKE $1
          AND CAST(nusp AS TEXT) LIKE $2`;
      const result = await client.query(query, [`%${nome}%`, `%${nusp}%`]);

      // Consulta para contar o número total de professores
      const countQuery = `
          SELECT COUNT(*) AS total_professores
          FROM professor
          WHERE nome LIKE $1
          AND CAST(nusp AS TEXT) LIKE $2`;
      const countResult = await client.query(countQuery, [`%${nome}%`, `%${nusp}%`]);
      const totalProfessores = parseInt(countResult.rows[0].total_professores);

      console.log("------- Professores encontrados -------")
      console.log(result.rows);
      console.log("Total de professores encontrados: ", totalProfessores)

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
          WHERE nome LIKE $1
          AND sigla_disciplina LIKE $2`;

      // Consulta para contar o número de disciplinas
      const queryCount = `
          SELECT COUNT(*) 
          FROM disciplina 
          WHERE nome LIKE $1
          AND sigla_disciplina LIKE $2`;

      // Executa a consulta para obter disciplinas
      const resultDisciplinas = await client.query(queryDisciplinas, [`%${nome}%`, `%${sigla}%`]);
      const disciplinas = resultDisciplinas.rows;

      // Executa a consulta para contar o número de disciplinas
      const resultCount = await client.query(queryCount, [`%${nome}%`, `%${sigla}%`]);
      const count = parseInt(resultCount.rows[0].count); // Converte a contagem para um número inteiro
      console.log("------- Disciplinas encontradas -------")
      console.log(resultDisciplinas.rows);
      console.log("Total de disciplinas encontrados: ", count)
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
          WHERE nome LIKE $1 
          AND sigla_departamento LIKE $2`;
      const result = await client.query(query, [`%${nome}%`, `%${sigla}%`]);
      console.log("------- Departamentos encontrados -------")
      console.log(result.rows);
      
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
          JOIN matricula m ON a.nusp = m.nusp_aluno
          WHERE m.sigla_disciplina = $1`;
      
      const result = await client.query(query, [siglaDisciplina]);
      console.log("------- Alunos da disciplina -------")
      console.log(result.rows);
      console.log("Total de alunos encontrados: ", result.rows.length)
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
          SELECT d.nome, d.sigla_disciplina
          FROM disciplina d
          JOIN matricula m ON d.sigla_disciplina = m.sigla_disciplina
          WHERE m.nusp_aluno = $1`;
      
      const result = await client.query(query, [nuspAluno]);
      console.log("------- Disciplinas do Aluno -------")
      console.log(result.rows);
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
        // Total de disciplinas encontradas
        
        console.log("------- Disciplinas do departamento -------")
        console.log(result.rows);
        console.log("Total de disciplinas encontradas: ", result.rows.length)
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
      FROM professor f
      JOIN departamento d ON CAST(f.nusp as TEXT) = d.nusp_coordenador
      WHERE d.sigla_departamento = $1`;
    
      
      const result = await client.query(query, [siglaDepartamento]);
      console.log("------- Coordenador do departamento -------")
      console.log(result.rows);
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
          JOIN ministra m ON d.sigla_disciplina = m.sigla_disciplina
          WHERE m.nusp_professor = $1`;
      
      const result = await client.query(query, [nuspProfessor]);
      console.log("------- Disciplinas do Professor -------")
      console.log(result.rows);
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
      SELECT p.nome, p.nusp
      FROM ministra m
      JOIN professor p ON m.nusp_professor = p.nusp
      WHERE m.sigla_disciplina = $1`;
      
      
      const result = await client.query(query, [siglaDisciplina]);
      console.log("------- Professores da disciplina -------")
      console.log(result.rows);
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
          FROM professor
          WHERE sigla_departamento = $1`;

      // Consulta para contar o número total de professores no departamento
      const countQuery = `
          SELECT COUNT(*) AS total_professores
          FROM professor
          WHERE sigla_departamento = $1`;

      const result = await client.query(query, [siglaDepartamento]);
      const countResult = await client.query(countQuery, [siglaDepartamento]);

      const professores = result.rows;
      const totalProfessores = parseInt(countResult.rows[0].total_professores);
      console.log("------- Professores do Departamento -------")
      console.log(result.rows);
      console.log("Total de professores encontrados: ", totalProfessores)
      return { professores, totalProfessores };
  } catch (error) {
      console.error('Erro ao executar a consulta:', error);
      return { professores: [], totalProfessores: 0 };
  } finally {
      await client.end();
  }
}
// FIM -----------------------------------------------------------------------------------------------

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Função para exibir o menu de opções
function exibirMenu() {
  console.log('Selecione a pesquisa que deseja fazer:');
  console.log('1. Consultar alunos por nome, NUSP e ano de ingresso');
  console.log('2. Consultar professores por nome e NUSP');
  console.log('3. Consultar disciplinas por sigla e nome');
  console.log('4. Consultar departamento por sigla e nome');
  console.log('5. Exibir alunos de uma disciplina');
  console.log('6. Exibir disciplinas de um aluno');
  console.log('7. Obter disciplinas de um departamento');
  console.log('8. Obter coordenador de um departamento');
  console.log('9. Obter disciplinas de um professor');
  console.log('10. Obter professores de uma disciplina');
  console.log('11. Listar professores de um departamento');

}

// Função para realizar a pesquisa de acordo com a opção selecionada
async function realizarPesquisa(opcao) {
  switch (opcao) {
    case '1':
      const nomeAluno = await perguntar('Digite o nome do aluno: ');
      const nuspAluno = await perguntar('Digite o NUSP do aluno: ');
      const anoIngresso = await perguntar('Digite o ano de ingresso do aluno: ');
      const {resultadoAlunos, count} = await consultarAlunosPorNomeNuspAnoIngresso(nomeAluno, nuspAluno, anoIngresso);
      
      break;
    case '2':
      // Lógica para consultar professores
      const nomeProfessor = await perguntar('Digite o nome do professor: ');
      const nuspProfessor = await perguntar('Digite o NUSP do professor: ');
      const {resultadoProfessores, countProfessores} = await consultarProfessorPorNomeNusp(nomeProfessor, nuspProfessor);
      break;

    case '3':
      // Lógica para consultar disciplinas
      const siglaDisciplina = await perguntar('Digite a sigla da disciplina: ');
      const nomeDisciplina = await perguntar('Digite o nome da disciplina: ');
      const {resultadoDisciplinas, countDisciplinas} = await consultarDisciplinaporSiglaNome(siglaDisciplina, nomeDisciplina);
      break;
    case '4':
      // Lógica para consultar departamentos
      const siglaDepartamento = await perguntar('Digite a sigla do departamento: ');
      const nomeDepartamento = await perguntar('Digite o nome do departamento: ');
      const resultadoDepartamentos = await consultarDepartamentoporSiglaNome(siglaDepartamento, nomeDepartamento);
      break;
    
    case '5':
      // Lógica para exibir alunos de uma disciplina
      const siglaDisciplinaAlunos = await perguntar('Digite a sigla da disciplina: ');
      const alunosDisciplina = await exibirAlunosPorDisciplina(siglaDisciplinaAlunos);
      break;
    
    case '6':
      // Lógica para exibir disciplinas de um aluno
      const nuspAlunoDisciplinas = await perguntar('Digite o NUSP do aluno: ');
      const disciplinasAluno = await exibirDisciplinasPorAluno(nuspAlunoDisciplinas);
      break;

    case '7':
      // Lógica para obter disciplinas de um departamento
      const siglaDepartamentoDisciplinas = await perguntar('Digite a sigla do departamento: ');
      const disciplinasDepartamento = await obterDisciplinasPorDepartamento(siglaDepartamentoDisciplinas);
      break;
    
    case '8':
      // Lógica para obter coordenador de um departamento
      const siglaDepartamentoCoordenador = await perguntar('Digite a sigla do departamento: ');
      const coordenadorDepartamento = await obterCoordenadorDepartamento(siglaDepartamentoCoordenador);
      break;
    
    case '9':
      // Lógica para obter disciplinas de um professor
      const nuspProfessorDisciplinas = await perguntar('Digite o NUSP do professor: ');
      const disciplinasProfessor = await obterDisciplinasPorProfessor(nuspProfessorDisciplinas);
      break;

    case '10':
      // Lógica para obter professores de uma disciplina
      const siglaDisciplinaProfessores = await perguntar('Digite a sigla da disciplina: ');
      const professoresDisciplina = await obterProfessoresPorDisciplina(siglaDisciplinaProfessores);
      break;
    
    case '11':
      // Lógica para listar professores de um departamento
      const siglaDepartamentoProfessores = await perguntar('Digite a sigla do departamento: ');
      const {resultadoProfessor, totalProfessores} = await listarProfessoresPorDepartamento(siglaDepartamentoProfessores);
      break;

    default:
      console.log('Opção inválida!');
      break;
  }
}

// Função para fazer uma pergunta ao usuário
function perguntar(pergunta) {
  return new Promise((resolve, reject) => {
    rl.question(pergunta, (resposta) => {
      resolve(resposta);
    });
  });
}

// Função principal para iniciar o programa
async function iniciarPrograma() {
  exibirMenu();
  const opcao = await perguntar('Opção: ');
  await realizarPesquisa(opcao);
  rl.close();
}

// Inicia o programa
iniciarPrograma();
