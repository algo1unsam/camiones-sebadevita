import empresa.*

object knightRider {

	const property peso = 500
	const property peligrosidad = 10

}

object bumblebee {

	const property peso = 800
	// TODO acá conderá usar objetos, uno que representa auto y otro robot
	// de forma de poder delegar la peligrosidad, y que quede toda la información
	// respectiva quede separada de este objeto
	var property modo = "auto"

	method peligrosidad() {
		if (modo == "auto") {
			return 15
		} else {
			return 30
		}
	}

}

object paqueteDeLadrillos {

	var property cantLadrillos = 1
	const property peligrosidad = 2

	method peso() = cantLadrillos * 2

}

object contenedorPortuario {

	var contenedor = []

	method cargar(carga) {
		contenedor.add(carga)
	}

	method descargar(carga) {
		contenedor.remove(carga)
	}

	method peso() {
		return contenedor.sum({ carga => carga.peso() }) + 100
	}

	method peligrosidad() {
		if (contenedor.size() != 0) {
			return contenedor.max({ carga => carga.peligrosidad() })
		} else {
			return 0
		}
	}

}

object embalaje {  //TUVE EN CUENTA QUE EL EMBALAJE SOLO PUEDE CUBRIR UNA COSA. // TODO es correcto

	var property cobertura = paqueteDeLadrillos

	
	method peso() {
		
		return cobertura.peso()
		
	}

	method peligrosidad() {
		return cobertura.peligrosidad()	}
		
	

}


	