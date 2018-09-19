object link {
	var defensa = 42
	var ataque = 50
	var salud = 1
	
	method serAtacado(danio){
		salud = (salud - danio).max(0)
	}
	
	method estaSano(){
		return self.salud() >= 10
	}
	
	method recuperarVida(){
		self.salud(10)
	}
	
	method defensa(){return defensa}//getter
	
	method defensa(unaDefensa){defensa = unaDefensa}//setter (se diferencia porque tiene una variable)
	
	method salud (){return salud}
	
	method salud (unaSalud){salud = unaSalud}
}

object octorokRojo {
	var salud =2
	var defensa = 40
	
	method atacarA(alguien){
		alguien.serAtacado(0.25)
	}	
}

object ganon {
	var salud = 3
	var defensa = 40
	var ataque = 50
	
	method atacarA(alguien){
		var danio = ataque / alguien.defensa()
		alguien.serAtacado(danio)
	}
	
	method movimientoEspecial(alguien){
		self.atacarA(alguien)
		self.aumentarSalud(1)
	}
	
	method aumentarSalud(unaSalud){
		salud += unaSalud
	}
}

object zelda {
	var salud = 10
	var ataque = 50
	var defensa = 40
	var titulo ="Zelda"
	var arco = arcoSagrado
	method serAtacado(danio){
		self.perderVida(danio * self.mitigarDanio(danio))
	}
	
	method perderVida(unaVida){
		salud = 0.max(salud - unaVida)
	}
	
	method mitigarDanio(danio){
		return danio * (self.defensa() * self.titulo().size()) / 500
	}
	
	method curarA(alguien){
		if (!alguien.estaSano()){
			alguien.recuperarVida()
		}
	}
	
	method atacarA(alguien){
		alguien.serAtacado(arco.calcularDanio(self, alguien))
	}
	
	method defensa(){return defensa}
	
	method titulo(){return titulo}
	
	method salud(){return salud}
}

object arcoSagrado{
	method calcularDanio(atacante, atacado){
		return (atacante.salud() - atacado.ataque()).abs()
	}
}	

object arcoSeno{
	method calcularDanio(atacante, atacado){
		return 0
	}
}