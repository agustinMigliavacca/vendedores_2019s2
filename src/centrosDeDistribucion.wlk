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
	
	method puedeCubrir(en) {
		return vendedores.any({ v => v.puedeTrabajar(en)})
	}
	
	method vendedoresGenericos() {
		vendedores.any({ v=> v.certificacionesQueNoSon()})
	}
	
	method esRobusto() {
		return vendedores.filter({ v => v.esFirme() }).size() >= 3
	}
  	method darCertificacion(producto, punto) {
  		vendedores.forEach({ v => v.agregarCertificacion(new Certificacion(puntos = punto, sobreProducto = producto))})
  	}
  	
  	method tieneAfinidad(vendedor) {
  		return  vendedor.puedeTrabajar(ciudad)
  		
  	}
  	
  	method vendedorCandidato(vendedor) {
  		return self.tieneAfinidad(vendedor) and
  		vendedor.esVersatil()		
  	}
}

