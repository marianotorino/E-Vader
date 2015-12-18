# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

clients = Client.create([{ name: "Joaquin", surname: "Gonzalez", birthdate: "1970-03-23", dni: 19354678, cuit: "20-19354678-9", gender: "M" }, 
                         { name: "Maria", surname: "Perez", birthdate: "1983-06-16", dni: 25876543, cuit: "24-25876543-7", gender: "F" }, 
                         { name: "Sergio", surname: "Gutierrez", birthdate: "1974-10-30", dni: 22345678, cuit: "23-22345678-4", gender: "M" }, 
                         { name: "Mario", surname: "Martinez", birthdate: "1986-08-09", dni: 30876321, cuit: "20-30876321-0", gender: "M" }, 
                         { name: "Juliana", surname: "Lopez", birthdate: "1979-04-24", dni: 24778943, cuit: "27-24778943-8", gender: "F" }])

people = Person.create([{ name: "Eduardo Casas", cuit: "24-16270743-9" }, 
                        { name: "La Serenisima", cuit: "30-17463843-2" }, 
                        { name: "Nestle", cuit: "33-21734548-7" }, 
                        { name: "Armando Barreda", cuit: "20-16543769-5" }, 
                        { name: "Agustina Suarez", cuit: "23-25243746-1" }])

contacts = Contact.create([{ kind: "E-Mail", data: "jgonzalez@gmail.com", client: clients.first }, 
                           { kind: "Teléfono", data: "02214294753", client: clients.last }, 
                           { kind: "Teléfono celular", data: "155168184", client: clients[2] }, 
                           { kind: "Skype", data: "joacogonzalez", client: clients.first }])

bills = Bill.create([{ amount: 3000, description: "Materiales para construccion", date: "2014-06-24", person: people.first, client: clients.first }, 
                     { amount: 1202.45, description: "Insumos para aulas", date: "2014-08-30", person: people[3], client: clients.first }, 
                     { amount: 2400, description: "Cajas de carton", date: "2015-05-19", person: people[2], client: clients[2] }, 
                     { amount: 3000, description: "Frascos de vidrio", date: "2015-06-21", person: people[2], client: clients[1] }, 
                     { amount: 30000, description: "Container con juguetes y adornos de Navidad", date: "2015-12-14", person: people.last, client: clients.last }])
