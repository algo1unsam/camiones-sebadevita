import cargas.*
import rutas.*

object camion {

	var property cargas = []
	const property cargaMaxima = 1000

	method cargar(carga) {
		if (self.cargaDisponible() > carga.peso()) {
			cargas.add(carga)
		} else {
			error.throwWithMessage("El peso de la carga supera la capacidad maxima")
		}
	}

	method descargar(carga) {
		cargas.remove(carga)
	}

	method siTieneCargado(carga) {
		return cargas.contains(carga)
	}

	method cargaActual() {
		return cargas.sum({ carga => carga.peso() })
	}

	method cargaDisponible() {
		return cargaMaxima - self.cargaActual()
	}

	method cargaMasPeligrosa() {
		return cargas.max({ carga => carga.peligrosidad() })
	}

	method puedeCircular(ruta) {
		return ruta.dejaCircular(self)
	}

}

object motoneta {

	var property cargas = []
	const property cargaMaxima = 100

	method cargar(carga) {
		if ((self.cargaDisponible() > carga.peso()) and (carga.peligrosidad() <= 5)) {
			cargas.add(carga)
		} else {
			error.throwWithMessage("El peso de la carga supera la capacidad maxima o se supero la peligrosidad permitida")
		}
	}

	method cargaDisponible() {
		return cargaMaxima - self.cargaActual()
	}

	method cargaActual() {
		return cargas.sum({ carga => carga.peso() })
	}

	method descargar(carga) {
		cargas.remove(carga)
	}

}

object deposito {

	var property deposito = []

	method recibir(carga) {
		deposito.add(carga)
	}

	method llenarTransporte(transporte) {
		deposito.forEach({ carga =>
			deposito.remove(carga)
			transporte.cargar(carga)
		})
	}

}

