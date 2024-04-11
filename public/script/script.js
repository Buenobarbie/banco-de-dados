const toggleButtons = document.querySelectorAll('.toggleButton');

toggleButtons.forEach(button => {
    button.addEventListener('click', () => {
        const section = button.parentElement.parentElement;
        const content = section.querySelector('p');
        content.classList.toggle('hidden');
    });
});

const students = [
    { nome: "João", matricula: "20210001", anoIngresso: 2021 },
    { nome: "Maria", matricula: "20210002", anoIngresso: 2020 },
    { nome: "Pedro", matricula: "20210003", anoIngresso: 2021 },
    // Adicione mais alunos conforme necessário
];

const searchByNameInput = document.getElementById('searchByName');
const searchByMatriculaInput = document.getElementById('searchByMatricula');
const searchByAnoIngressoInput = document.getElementById('searchByAnoIngresso');
const searchResults = document.getElementById('searchResults');

function renderResults(results) {
    searchResults.innerHTML = '';

    if (results.length === 0) {
        searchResults.innerHTML = '<p>Nenhum resultado encontrado.</p>';
        return;
    }

    const ul = document.createElement('ul');
    results.forEach(result => {
        const li = document.createElement('li');
        li.textContent = `Nome: ${result.nome}, Matrícula: ${result.matricula}, Ano de Ingresso: ${result.anoIngresso}`;
        ul.appendChild(li);
    });

    searchResults.appendChild(ul);
}

function searchStudents() {
    const searchByName = searchByNameInput.value.toLowerCase();
    const searchByMatricula = searchByMatriculaInput.value.toLowerCase();
    const searchByAnoIngresso = parseInt(searchByAnoIngressoInput.value);

    const results = students.filter(student => {
        const nomeMatch = student.nome.toLowerCase().includes(searchByName);
        const matriculaMatch = student.matricula.toLowerCase().includes(searchByMatricula);
        const anoIngressoMatch = isNaN(searchByAnoIngresso) || student.anoIngresso === searchByAnoIngresso;

        return nomeMatch && matriculaMatch && anoIngressoMatch;
    });

    renderResults(results);
}

searchByNameInput.addEventListener('input', searchStudents);
searchByMatriculaInput.addEventListener('input', searchStudents);
searchByAnoIngressoInput.addEventListener('input', searchStudents);

// Exibir todos os alunos inicialmente
renderResults(students);
