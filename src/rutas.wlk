import cargas.*
import empresa.*

object ruta2 {

	method dejaCircular(transporte) {
		return transporte.cargas().all({ carga => carga.peligrosidad() <= 10 })
	}

}

