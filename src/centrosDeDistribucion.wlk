import vemdedores.*

class CentroDeDistribucion {
	var property ciudad
	var property vendedores = #{}
	
	method agregarVendendor(vendedor) {
		if(not vendedores.contains(vendedor)) {
			vendedores.add(vendedor)
		}
		else {   self.error("no se puede agregar") }
	}
	method vendedorEstrella() {
		return vendedores.max({ v => v.puntaje()})
	}
	
	method puedeCubrir() {
		return vendedores.any({ v => v.puedeTrabajar(ciudad)})
	}
	
	method vendedoresGenericos() {
		return vendedores.filter({ v=> v.certificacionesQueNoSon() >= 1}).asList()
	}
	
	method esRobusto() {
		return vendedores.filter({ v => v.esFirme() }).size() >= 3
	}
  	method darCertificacion(producto, punto) {
  		vendedores.forEach({ v => v.agregarCertificacion(new Certificacion(puntos = punto, sobreProducto = producto))})
  	}
  	
  	
  	
  	method tieneAfinidad(vendedor) {
  		return  vendedor.puedeTrabajar(self.ciudad())
  		
  	}
  	
  	method vendedorCandidato(vendedor) {
  		return self.tieneAfinidad(vendedor) and
  		vendedor.esVersatil()		
  	}
}

