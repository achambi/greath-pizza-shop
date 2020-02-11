# README
Haga un bundle para instalar las dependencias 
* `bundle install`

El resultado del proyecto tiene tests para entidades y para los controladores
para poder ejectuar los tests de los modelos se debe ejecutar en consola:

* `bundle exec rspec spec/models`

Para poder ejecutar los tests para los controladores se debe ejectuar el siguiente codigo:

* `bundle exec rspec spec/requests`

los endpoints que se realizaron son los siguientes:

* Endpoint para poder llamar y adicionar tipos de pizza:
`http://localhost:3000/pizza_type`

* Endpoint para poder ver las diferentes caracteristicas de una pizza: 
`http://localhost:3000/option`
* End point para crear ordenes y listarlas
`http://localhost:3000/order`
