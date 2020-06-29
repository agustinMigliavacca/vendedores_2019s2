import ciudades.*
class Certificacion {
	var property puntos
	var property sobreProducto
}

class Vendedores {
 	var property certificaciones =  []
	method esFisica()
	
	method agregarCertificacion(certificacion) {
		certificaciones.add(certificacion)
	}
	
	method certificacionesDeProducto() {
		return certificaciones.filter({c => c.sobreProducto()}).size()
	}
	
	method certificacionesQueNoSon() {
		return certificaciones.filter({ c => not c.sobreProducto()}).size()
	}
	
	method puntaje() {
		return certificaciones.sum({ p => p.puntos()})
	}
	
	method vendedorInfluyente()
	
	method puedeTrabajar(ciudad) 
	
	method esVersatil() {
		return (self.certificacionesDeProducto() >= 1 and
			   self.certificacionesQueNoSon() >= 1)  >= 3
	}	
	
	method esFirme() {
		return self.puntaje() >= 30
	}
} 



class VendedorFijo inherits Vendedores {
	var property ciudadQueVive
	
	override method puedeTrabajar(ciudad) {
		return ciudad == ciudadQueVive
	}
	override method vendedorInfluyente() {
		return false
	}
	
	override method esFisica() {
			return true
	}

	
}

class Viajante inherits Vendedores {
	var property estaHabilitado = []
	
	method provinciaHabilitada(provincia) {
		estaHabilitado.add(provincia)
	}
	
	override method puedeTrabajar(ciudad) {
		return self.estaHabilitado(ciudad)
		
		}
	method sumaDePoblacion() {
		return estaHabilitado.sum({c => c.poblacion()})
	}
	override method vendedorInfluyente() {
		return self.sumaDePoblacion() >= 10000000
	}
	
	override method esFisica() {
			return true
	}
	
		
}

class ComercioCorresponsal inherits Vendedores {
	var property tieneSucursalEn = []
	override method puedeTrabajar(ciudad) {
		return tieneSucursalEn.contains(ciudad)
	}	
	method agregaSucursal(ciudad) {
		tieneSucursalEn.add(ciudad)
	}
	
	method  provincias() {
		return tieneSucursalEn.map({c => c.provincia() }).asSet().size()
	}
	
	method ciudades() {
		return tieneSucursalEn.size()
	
	}
	
	override  method vendedorInfluyente() {
		return  self.provincias() >= 3  and
		self.ciudades() >= 5
		
 	}
	
	override method esFisica() {
			return false
	}
	
}
