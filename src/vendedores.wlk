import geografia.*

class Vendedor {
	const property certificaciones = []
	
	method esVersatil() {
		return certificaciones.size() >= 3
		and certificaciones.any( { c=>c.esSobreProductos() } )
		and certificaciones.any( { c=>not c.esSobreProductos() } )
	}
	

	method esFirme() {
		return certificaciones.sum( { c=>c.puntos() } ) >= 30	
	}
	
	method esInfluyente() //para que sea clase abstracta
	
	method puntajeTotalPorCertificaciones() {
		return certificaciones.sum( { c=>c.puntos() } )
	}
	
	method esGenerico() {
		return certificaciones.any( { c=> not c.esSobreProductos() } )
	}
	
	method agregarCertificacion(certif) {
		certificaciones.add(certif)
	}
	
	method removerCertificacion(certif) {
		certificaciones.remove(certif)
	}
	
	method puedeTrabajarEn(unaCiudad)
	
	method tieneAfinidadCon(unCentro) {
		return self.puedeTrabajarEn(unCentro.ciudad())
	}
	
	method esCandidato(unCentro) = self.esVersatil() and self.tieneAfinidadCon(unCentro)
}


class VendedorFijo inherits Vendedor {
	var property ciudadDondeVive
	
	override method puedeTrabajarEn(unaCiudad) {
		return self.ciudadDondeVive() == unaCiudad
	}
	
	override method esInfluyente() = false
}

class Viajante inherits Vendedor {
	var property provinciasHabilitadas = #{}
	
	override method puedeTrabajarEn(unaCiudad) {
		return provinciasHabilitadas.contains(unaCiudad.provincia())
	}
	
	override method esInfluyente() {
		return provinciasHabilitadas.sum( { p=>p.poblacion() } ) >= 10000000
	}
}

class ComercioCorresponsal inherits Vendedor {
	var property ciudadesConSucursales = #{} 
	
	override method puedeTrabajarEn(unaCiudad) {
		return ciudadesConSucursales.contains(unaCiudad)
	}
	
	override method esInfluyente() {
		return ciudadesConSucursales.size() >=5 
		or self.provinciasDeCiudades().size() >= 3
	}
	
	method provinciasDeCiudades() = ciudadesConSucursales.map( { c=>c.provincia() } ).asSet()
	
 	
	override method tieneAfinidadCon(unCentro) {
		return super(unCentro)
		and ciudadesConSucursales.any( { ciudad=> not unCentro.puedeCubrirCiudad(ciudad) } )
		
	}
}


class Certificaciones {
	var property puntos
	var property esSobreProductos
}
 
