Plan.create!(id: 1, nombre: "Gratis", porcentaje_comision: "0")
User.create!(email: "riveramoreira04@gmail.com", password: "prueba123", user: "orivera04", telefono: "87501549", plan_id: 1)

connection = ActiveRecord::Base.connection
connection.reset_pk_sequence!("plans")
connection.reset_pk_sequence!("users")
