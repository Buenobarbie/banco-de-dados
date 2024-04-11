import { consultarDepartamentos } from './consultas';

async function main() {
    // Consulta todos os departamentos
    const departamentos = await consultarDepartamentos();
    console.log('Departamentos encontrados:');
    console.table(departamentos);
    
    // Defina os valores para nome, nusp e anoIngresso conforme desejado
    const nome = 'João';
    const nusp = '123456';
    const anoIngresso = 2020;

    // Chame a função de consulta e aguarde sua conclusão
    const alunos = await consultarAlunosPorNomeNuspAnoIngresso(nome, nusp, anoIngresso);
    
    // Exiba os resultados no console
    console.log('Alunos encontrados:');
    console.table(alunos);
}

main();
