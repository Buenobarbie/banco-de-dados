import pg from 'pg';
const { Client } = pg;

// Configurações de conexão com o banco de dados
const client = new Client({
  user: 'u_13684471',
  host: 'estagiosV2.pcs.usp.br',
  database: 'db_13684471',
  password: '13684471',
  port: '65432', // Por padrão, é 5432
});

export default client;
