const express = require("express");
const cors = require("cors");
const { errorHandler } = require("./middlewares/errorMiddleware");
const plantRoutes = require("./routes/plantRoutes");

const app = express();
const port = process.env.PORT || 3000;

// Middlewares básicos
app.use(cors());
app.use(express.json()); // Permite recibir JSON en el body de las requests

// Rutas principales
app.use("/api", plantRoutes);

// Middleware de errores
app.use(errorHandler);

// Servidor escuchando
app.listen(port, () => {
  console.log(`Servidor de Brota corriendo en http://localhost:${port}`);
});
