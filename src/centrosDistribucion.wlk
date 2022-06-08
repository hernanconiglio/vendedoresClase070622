import vendedores.*
import geografia.*

class Centro {
	var property ciudad
	var property vendedores = #{}
	
	method agregarVendedor(vendedor) { 
		if(vendedores.contains(vendedor)) { 
			self.error("El vendedor ya esta registrado en el centro de Distribucion")
		}
		vendedores.add(vendedor)
	}
	
	method vendedorEstrella() {
		return vendedores.max( { v=>v.puntajeTotalPorCertificaciones() } )
	}
	
	method puedeCubrirCiudad(unaCiudad) {
		return vendedores.any( { v=>v.puedeTrabajarEn(unaCiudad) } )
	}
	
	method vendedoresGenericos() {
		return vendedores.filter( { v=>v.esGenerico() } )
	}
	
	method esRobusto() {
		return vendedores.count( { v=>v.esFirme() } ) >= 3
	}
	
	method repartirCertificacion(unaCertif) {
		vendedores.forEach( { v=>v.agregarCertificacion(unaCertif) } )
	}
	
	
	
}
