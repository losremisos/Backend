# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

index = 1
60.times do
    District.create(
        nombre: "Distrito Militar No" + index.to_s,
        direccion: Faker::Address.full_address,
        departamento: "Cundinamarca",
        ciudad: "Bogota",
        telefono: Faker::PhoneNumber.cell_phone,
        latitud: Float(3.63858) + Float(Faker::Number.between(-1,1)),
        longitud: Float(-73.0841) + Float(Faker::Number.between(-1,1))
    )
    index = index + 1
end
p "Se crearon #{District.count} distritos militares"

until User.count == 30 do
    name = Faker::Name.male_first_name
    pass = Faker::Internet.password(8, 15)
    User.create(
        nombre: name,
        primerApellido: Faker::Name.last_name,
        segundoApellido: Faker::Name.last_name,
        email: Faker::Internet.free_email(name + Faker::Number.between(10,200).to_s),
        password: "password",
        password_confirmation: "password",
        tipoDocumento: Faker::Number.between(0, 2),
        documento: Faker::Number.between(900000000, 1500000000000),
        fechaNacimiento: Faker::Date.birthday(16, 25),
        departamento: "Cundinamarca",
        ciudad: "Bogota",
        estadoProceso: Faker::Number.between(0, 2),
        tipoUsuario: 0,
        district_id: Faker::Number.between(1, District.count)
    )
end

User.create(
	nombre: 'John',
    primerApellido: 'Doe',
    segundoApellido: 'Doe',
    email: 'user@test.com',
    password: 'password',
    password_confirmation: 'password',
    tipoDocumento: Faker::Number.between(0, 2),
    documento: 123456789,
    fechaNacimiento: Faker::Date.birthday(16, 25),
    departamento: "Cundinamarca",
    ciudad: "Bogota",
    estadoProceso: Faker::Number.between(0, 2),
    tipoUsuario: 0,
    district_id: Faker::Number.between(1, District.count)
)
p "Se crearon #{User.count} usuarios"

users = User.count
index = 1
District.count.times do
    name = Faker::Name.male_first_name
    pass = Faker::Internet.password(8, 15)
    User.create(
        nombre: name,
        primerApellido: Faker::Name.last_name,
        segundoApellido: Faker::Name.last_name,
        email: Faker::Internet.free_email(name + Faker::Number.between(10,200).to_s),
        password: pass,
        password_confirmation: pass,
        tipoDocumento: Faker::Number.between(0, 2),
        documento: Faker::Number.between(900000000, 1500000000000),
        fechaNacimiento: Faker::Date.birthday(18, 50),
        departamento: "Cundinamarca",
        ciudad: "Bogota",
        estadoProceso: Faker::Number.between(0, 2),
        tipoUsuario: 1,
        district_id: index
    )
    index = index + 1
end
30.times do
    name = Faker::Name.male_first_name
    pass = Faker::Internet.password(8, 15)
    User.create(
        nombre: name,
        primerApellido: Faker::Name.last_name,
        segundoApellido: Faker::Name.last_name,
        email: Faker::Internet.free_email(name + Faker::Number.between(10,200).to_s),
        password: pass,
        password_confirmation: pass,
        tipoDocumento: Faker::Number.between(0, 2),
        documento: Faker::Number.between(900000000, 1500000000000),
        fechaNacimiento: Faker::Date.birthday(18, 50),
        departamento: "Cundinamarca",
        ciudad: "Bogota",
        estadoProceso: Faker::Number.between(0, 2),

        tipoUsuario: 1,
        district_id: Faker::Number.between(1, District.count)
    )
    index = index + 1
end
User.create(
	nombre: 'Admin',
    primerApellido: 'Admin',
    segundoApellido: 'Admin',
    email: 'admin@test.com',
    password: 'password',
    password_confirmation: 'password',
    tipoDocumento: Faker::Number.between(0, 2),
    documento: 98765432,
    fechaNacimiento: Faker::Date.birthday(18, 50),
    departamento: "Cundinamarca",
    ciudad: "Bogota",
    estadoProceso: Faker::Number.between(0, 2),
    tipoUsuario: 1,
    district_id: Faker::Number.between(1, District.count)
)
p "Se crearon #{User.count-users} administradores"

usuario = 1
users.times do
    documento = 1
    veces = Faker::Number.between(0, 5)
    veces.times do
        Document.create(
            nombre: "documento " + documento.to_s,
            user_id: usuario
        )
        documento = documento + 1
    end
    usuario = usuario + 1
end
p "Se crearon #{Document.count} documentos"

30.times do
    Appointment.create(
        fecha: Faker::Date.forward(Faker::Number.between(90,180)),
        nombre: "Citacion"
    )
end
p "Se crearon #{Appointment.count} citaciones"

usuario = 1
users.times do
    UserAppointment.create(
        user_id: usuario,
        appointment_id: Faker::Number.between(1, Appointment.count)
    )
end

Faker::UniqueGenerator.clear