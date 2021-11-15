import wollok.game.*
import personajes.*

object utilidadesParaJuego {
	method posicionArbitraria() {
		return game.at(
			0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)
		)
	}
	

	method iniciarMovimientosAutomaticos(){
		
		game.onTick(500, "movimientoCorto" , { esqueleto1.mover() })
		game.onTick(500, "movimientoCorto" , { esqueleto2.mover() })
		game.onTick(500, "movimientoCorto" , { esqueleto3.mover() })

	}
	
	
	method iniciarMovimientosAutomaticoslvl3(){
		spider1.iniciarMovimientosAutomaticos()
		spider2.iniciarMovimientosAutomaticos()
		spider3.iniciarMovimientosAutomaticos()
		spider4.iniciarMovimientosAutomaticos()
		spider5.iniciarMovimientosAutomaticos()
		spider6.iniciarMovimientosAutomaticos()
		spider7.iniciarMovimientosAutomaticos()
	}
	
	method iniciarMovimientosAutomaticoslvl2(){
		game.onTick(900, "perseguir"  , { craneo1.moverHaciaJugador()})
		game.onTick(900, "perseguir"  , { craneo2.moverHaciaJugador()})
	}
	
	method resetearEnemigo(){
		craneo1.position(craneo1.positionOriginal())
		craneo2.position(craneo2.positionOriginal())
	}
}

object randomSinPisarse{
	method colocar(){
		var posicionX = 0.randomUpTo(game.width() - 1).truncate(0)
		var posicionY = 1.randomUpTo(game.height() - 1).truncate(0)
		if(game.getObjectsIn(game.at(posicionX, posicionY)).size() >= 1){
			posicionX = 0.randomUpTo(game.width() - 1).truncate(0)
			posicionY = 1.randomUpTo(game.height() - 1).truncate(0)
		}
		return game.at(posicionX, posicionY)
		
	}
		
}

object musica{
	var property ost = game.sound("backgroundOST.mp3")
	method play(){
		ost.shouldLoop(true)
		game.schedule(500, { ost.play()} )
	}
	method pause(){
		ost.pause()
	}
	method resume(){
		ost.resume()
	}
		
}

