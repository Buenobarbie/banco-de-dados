import consultarAlunosPorNomeNuspAnoIngresso from './consultas.js';


async function main() {

    
    // Defina os valores para nome, nusp e anoIngresso conforme desejado
    const nome = '';
    const nusp = '';
    const anoIngresso = '';

    // Chame a função de consulta e aguarde sua conclusão
    const {alunos, total} = await consultarAlunosPorNomeNuspAnoIngresso(nome, nusp, anoIngresso);
    
    // Exiba os resultados no console
    console.log('Alunos encontrados:');
    console.table(alunos);
    console.log(total)
}

main();
