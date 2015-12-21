#E-Vader

####Instalación
Se asume que se encuentra instalada alguna versión de Ruby 1.9.2 o superior con la gema Bundler.  
Posicionarse en el directorio donde se clonó o descargó la aplicación y ejecutar el comando:
`bundle install`

####Creación de la base de datos
Para la base de datos se asume que se trabaja con el motor SQLite3.  
Para crear la base de datos y cargar los datos del archivo `seeds.rb` debe ejecutar el comando:
`bundle exec rake db:setup`

####Ejecución
Para poner en marcha la aplicación debe ejecutar el comando: `bundle exec rails s`  
En caso de que se corra la aplicación en una máquina virtual se deberá ejecutar la variante: `bundle exec rails s -b 0.0.0.0`

####Testeo
Para correr los tests que se encuentran en la aplicación debe ejecutar el comando: `bundle exec rake test`
