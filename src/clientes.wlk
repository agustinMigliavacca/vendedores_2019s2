import vemdedores.*
class Cliente {
	method puedeSerAtendido(vendedor)
} 


class ClienteInseguro inherits Cliente {
	override method puedeSerAtendido(vendedor) {
		return vendedor.esVersatil() and vendedor.esFirme()
	}
}

class ClienteDetallista inherits Cliente{
	
	override method puedeSerAtendido(vendedor) {
			return vendedor.certificacionesDeProducto() >= 3
	}
}


class ClienteHumanista inherits Cliente {
	
	override method puedeSerAtendido(vendedor) {
		return vendedor.esFisica()
	}

}