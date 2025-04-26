const getPlants = (req, res) => {
  res.json({ message: "Lista de plantas" });
};

const addPlant = (req, res) => {
  const { name, type } = req.body;
  res.json({ message: `Planta ${name} de tipo ${type} agregada` });
};

module.exports = {
  getPlants,
  addPlant,
};
