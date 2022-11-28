import UIKit

class Persona {
    var nombres: String
    var apellidoPaterno: String
    var apellidoMaterno: String
    var fechaNacimiento: String!
    var nroDocumento: String
    var sexo: String
    var correo: String
    var cantidadHermanos: Int
    var usuario: String {
        print("correo")
        if let indexArroba = correo.firstIndex(of: "@") {
            print("correo")
            return String(correo[..<indexArroba])
        }else{
            return "nil"
        }
    }
    var edad: UInt8 {
//        let date = Date()
//        let fechaFormateada = DateFormatter()
//        fechaFormateada.dateFormat = "dd/mm/yyyy"
//        fechaFormateada.string(from: date)
//        var calendario = NSCalendar.currentCalendar()
        
        //fecha actual tipo date
        let fechaActual = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/mm/yyyy"
        //fecha nacimiento convertida a tipo date
        let fechaNacimientoDate = dateFormatter.date(from: fechaNacimiento)
        
        //obtenemos calendario
        let calendario = NSCalendar(calendarIdentifier: .gregorian)
        let ageComponents = calendario!.components(.year, from: fechaNacimientoDate!, to: fechaActual)
        let edad = ageComponents.year
        
        //hacemos casting a edad de Int a UInt8
        return UInt8(edad!)
    }
    
    init(nombres: String, apellidoPaterno: String, apellidoMaterno: String, fechaNacimiento: String, nroDocumento: String, sexo: String, correo: String, cantidadHermanos: Int ) {
        self.nombres = nombres
        self.apellidoPaterno = apellidoPaterno
        self.apellidoMaterno = apellidoMaterno
        self.fechaNacimiento = fechaNacimiento
        self.nroDocumento = nroDocumento
        self.sexo = sexo
        self.correo = correo
        self.cantidadHermanos = cantidadHermanos
    }
}

var personas: [Persona] = []
var hombres: [Persona] = []
var mujeres: [Persona] = []
var tienenHermanos: [Persona] = []

func crearUsuarios(){
    personas.append(Persona(nombres: "CARLOS JOSÉ", apellidoPaterno: "ROBLES", apellidoMaterno: "GOMES", fechaNacimiento: "06/08/1995", nroDocumento: "78451245", sexo: "M", correo: "carlos.roblesg@hotmail.com", cantidadHermanos: 2))
    personas.append(Persona(nombres: "MIGUEL ANGEL", apellidoPaterno: "QUISPE", apellidoMaterno: "OTERO", fechaNacimiento: "28/12/1995", nroDocumento: "79451654", sexo: "M", correo: "miguel.anguel@gmail.com", cantidadHermanos: 0))
    personas.append(Persona(nombres: "KARLA ALEXANDRA", apellidoPaterno: "FLORES", apellidoMaterno: "ROSAS", fechaNacimiento: "15/02/1997", nroDocumento: "77485812", sexo: "F", correo: "Karla.alexandra@hotmail.com", cantidadHermanos: 1))
    personas.append(Persona(nombres: "NICOLAS", apellidoPaterno: "QUISPE", apellidoMaterno: "ZEBALLOS", fechaNacimiento: "08/10/1990", nroDocumento: "71748552", sexo: "M", correo: "nicolas123@gmail.com", cantidadHermanos: 1))
    personas.append(Persona(nombres: "PEDRO ANDRE", apellidoPaterno: "PICASSO", apellidoMaterno: "BETANCUR", fechaNacimiento: "17/05/1994", nroDocumento: "74823157", sexo: "M", correo: "pedroandrepicasso@gmail.com", cantidadHermanos: 2))
    personas.append(Persona(nombres: "FABIOLA MARIA", apellidoPaterno: "PALACIO", apellidoMaterno: "VEGA", fechaNacimiento: "02/02/1992", nroDocumento: "76758254", sexo: "F", correo: "fabi@hotmail.com](mailto:fabi@hotmail.com", cantidadHermanos: 0))
}

func personaMayorYMenor(){
    var mayor: UInt8 = UInt8.min
    var menor: UInt8 = UInt8.max

    for persona in personas {
        mayor = persona.edad > mayor ? persona.edad : mayor
        menor = persona.edad < menor ? persona.edad : menor
    }
    print("mayor de todos -> \(mayor)")
    print("menor de todos -> \(menor)")
}

func separarSexos(){
    hombres = personas.filter { persona in
        return persona.sexo == "M"
    }
    mujeres = personas.filter { persona in
        return persona.sexo == "H"
    }
}

func separarPersonasConHermanos(cantidad_mayor hermanos: Int){
    tienenHermanos = personas.filter { persona in
        return persona.cantidadHermanos > hermanos
    }
}

func formatearDatosPersonales(persona: Persona ) -> String{
    var primerNombre = persona.nombres.capitalized
    if let indexEspacio = persona.nombres.firstIndex(of: " "){
        primerNombre = persona.nombres[..<indexEspacio].capitalized
    }
    let apellidoPaterno = persona.apellidoPaterno.capitalized
    let apellidoMaterno = persona.apellidoMaterno.capitalized
    return "\(primerNombre) \(apellidoPaterno) \(Array(apellidoMaterno)[0])."
}

func formatearUsuarios(){
    for persona in personas {
        print(formatearDatosPersonales(persona: persona))
    }
}

//mostrar
crearUsuarios()
print("Se muestra Mayor y Menor usuario:")
personaMayorYMenor()
print("Se muestran la cantidad de hombres y mujeres:")
separarSexos()
print("cantidad de hombres -> \(hombres.count)")
print("cantidad de mujeres -> \(mujeres.count)")
separarPersonasConHermanos(cantidad_mayor: 2)
print("cantidad de personas con hermanos mayores de 2 años de edad -> \(tienenHermanos.count)")
formatearUsuarios()
//formatearDatosPersonales(persona: personas[1])



//
//RETO SWIFT
//Teniendo ciertos datos de 6 personas, se crea una lista de personas que contenga datos como nombre, apellido paterno, apellido materno, fecha de nacimiento, nro de documento, sexo, correo, la cantidad de hermanos y usuario de cada persona.
//
//A partir de esta lista:
//
//- Obtener la persona con mayor y menor edad
//- Obtener dos listas más, una para hombres y otra mara mujeres e imprimir la cantidad de personas que hay en cada lista
//- Obtener una lista de todas las personas que tienen más de dos hermanos
//- Imprimir cada persona con este formato “Luis Inga M.” Solo primer nombre, ape pate completo y solo la inicial del ape mate más un punto. *Y EN CAPITALIZE* (primera letra de cada palabra en mayúscula y todo lo demás en minúscula)
//- Crear usuarios a todas las personas y guardar en la lista.
//
//NOTA
//
//No te vendrá el usuario de por sí, por lo que ese campo será nulo al inicio. Tendrás que obtenerlo a partir del correo. Si mi correo es luis.ingam@gmail.com, entonces mi usuario es  luis.ingam
//
//Lo obtengo con todo lo que hay antes de la arroba @
//
//Datos de entrada:
//
//CARLOS JOSÉ ROBLES GOMES, fecha de nacimiento: 06/08/1995, numero de documento 78451245, tiene 2 hermanos, carlos.roblesg@hotmail.com
//MIGUEL ANGEL QUISPE OTERO, fecha de nacimiento: 28/12/1995, numero de documento 79451654, no tiene hermanos, miguel.anguel@gmail.com
//KARLA ALEXANDRA FLORES ROSAS, fecha de nacimiento: 15/02/1997, numero de documento 77485812, tiene 1 hermanos, Karla.alexandra@hotmail.com
//NICOLAS QUISPE ZEBALLOS, fecha de nacimiento: 08/10/1990, numero de documento 71748552, tiene 1 hermanos, nicolas123@gmail.com
//PEDRO ANDRE PICASSO BETANCUR, fecha de nacimiento: 17/05/1994, numero de documento 74823157, tiene 2 hermanos, pedroandrepicasso@gmail.com
//FABIOLA MARIA PALACIO VEGA, fecha de nacimiento: 02/02/1992, numero de documento 76758254, no tiene hermanos, fabi@hotmail.com](mailto:fabi@hotmail.com
