import express from "express";
import path from "path";

const app = express();
const port = 3000;

// Define o diretório de arquivos estáticos
app.use(express.static(path.join(".", "public")));

// Define uma rota para renderizar sempre o index.html
app.get("*", (req, res) => {
  res.sendFile(path.join(".", "public", "index.html"));
});

// Inicia o servidor
app.listen(port, () => {
  console.log(`Server running at ${port}`);
});
