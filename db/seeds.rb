# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Categorium.create([{
  nombre: "Nivel Basico" ,  
  imagen: "https://cdn.pixabay.com/photo/2013/07/12/19/19/linux-154544_960_720.png"
}, {
  nombre: "Nivel Intermedio",
  imagen: "https://i.imgur.com/amckVul.jpeg"
}, {
  nombre: "Nivel Avanzado",  
  imagen: "https://i.imgur.com/AD3MbBi.jpeg"
}, {
  nombre: "Nivel Pro",
  imagen: "https://i.imgur.com/5fEod96.png"
}])

  Producto.create([{
  nombre: "Conceptos basicos"  , 
  descripcion: "conceptos basicos del Idioma ingles", 
  imagen: "https://cdn.pixabay.com/photo/2013/07/12/19/19/linux-154544_960_720.png" ,
  precio: 8000,  
  categorium_id: Categorium.where(nombre: "Nivel Basico").first.id
}, {
  nombre: "Vocabulario y Lectura"  , 
  descripcion: "conceptos basicos del idioma ingles", 
  imagen: "https://cdn.pixabay.com/photo/2013/07/12/19/19/linux-154544_960_720.png" , 
  precio: 8000, 
  categorium_id: Categorium.where(nombre: "Nivel Basico").first.id
}, {
  nombre: "Conversación comunicacional"  , 
  descripcion: "enfocado en el mejoramiento de la fluidez" , 
  imagen: "https://i.imgur.com/amckVul.jpeg",
  precio: 13000,  
  categorium_id: Categorium.where(nombre: "Nivel Intermedio").first.id
}, {
  nombre: "Trabajos escritos y uso de diccionarios"  , 
  descripcion: "enfocado en el mejoramiento del uso de vocabulario" , 
  imagen: "https://i.imgur.com/amckVul.jpeg",
  precio: 10000,  
  categorium_id: Categorium.where(nombre: "Nivel Intermedio").first.id
}, {
  nombre: "Conversación y manejo de pronunciacion"  , 
  descripcion: "enfocado en el mejoramiento de la fonología inglesa" , 
  imagen: "https://i.imgur.com/AD3MbBi.jpeg",
  precio: 12000,  
  categorium_id: Categorium.where(nombre: "Nivel Avanzado").first.id
}, {
  nombre: "Escritura creativa"  , 
  descripcion: "enfocado en el mejoramiento de los modismos literarios" , 
  precio: 15000, 
  imagen: "https://i.imgur.com/AD3MbBi.jpeg", 
  categorium_id: Categorium.where(nombre: "Nivel Avanzado").first.id
}, {
  nombre: "Conversación y entrenamiento de entonación"  , 
  descripcion: "enfocado en el mejoramiento de la fluidez comunicacional" , 
  precio: 18000, 
  imagen:"https://i.imgur.com/5fEod96.png", 
  categorium_id: Categorium.last.id
}, {
  nombre: "Charlas y debates", 
  descripcion: "entrenamiento de instancias formales" , 
  precio: 20000, 
  imagen: "https://i.imgur.com/5fEod96.png", 
  categorium_id: Categorium.last.id
}])
