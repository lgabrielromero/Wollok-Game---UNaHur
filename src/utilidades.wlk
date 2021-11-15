import wollok.game.*
import personajes.*

object utilidadesParaJuego {
	method posicionArbitraria() {
		return game.at(
			0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)
		)
	}
	
	method detenerMovimientosAutomaticos(){
	game.removeTickEvent("perseguir")
	game.removeTickEvent("perseguir2")
	game.removeTickEvent("movimientoCorto")
	game.removeTickEvent("movimientoCorto2")
	game.removeTickEvent("movimientoCorto3")	
	}
	
	method iniciarMovimientosAutomaticos(){
	game.onTick(900, "perseguir"  , { craneo1.moverHaciaJugador()})
	game.onTick(900, "perseguir2"  , { craneo2.moverHaciaJugador()})
	game.onTick(500, "movimientoCorto" , { esqueleto1.mover() })
	game.onTick(500, "movimientoCorto2" , { esqueleto2.mover() })
	game.onTick(500, "movimientoCorto3" , { esqueleto3.mover() })
	}
	
	
	
	method pausarMovimientosAutomaticos(tiempo){
		self.detenerMovimientosAutomaticos()
		game.schedule(tiempo, { => self.iniciarMovimientosAutomaticos() })
	}
}

object randomSinPisarse{
	method colocar(){
		var posicionX = 0.randomUpTo(game.width() - 1)
		var posicionY = 1.randomUpTo(game.height() - 1)
		if(game.getObjectsIn(game.at(posicionX, posicionY)).size() >= 1){
			posicionX = 0.randomUpTo(game.width() - 1)
			posicionY = 1.randomUpTo(game.height() - 1)
		}
		return game.at(posicionX, posicionY)
		
	}
		
}
