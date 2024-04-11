import { consultarAlunosPorNomeNuspAnoIngresso } from './back/consultas';

async function main() {

    
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
