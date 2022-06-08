import vendedores.*

class Ciudad {
	const property provincia
	
	method puedeTrabajar(vendedor) {
		return vendedor.puedeTrabajarEn(self)
	}
}

class Provincia {
	var property poblacion
}