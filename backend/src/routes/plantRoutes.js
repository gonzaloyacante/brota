const express = require("express");
const router = express.Router();
const { getPlants, addPlant } = require("../controllers/plantController");

// GET /plants -> Listar todas las plantas
router.get("/plants", getPlants);

// POST /plants -> Agregar una nueva planta
router.post("/plants", addPlant);

module.exports = router;
