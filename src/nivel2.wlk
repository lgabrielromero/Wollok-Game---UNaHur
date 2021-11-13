iimport wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel1.*
import hud.*
import direcciones.*
import paredes.*

object nivelLlaves {

	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="dungeonwall.png"))
				 
		// otros visuals, p.ej. bloques o llaves
		game.addVisual(moneda1)
	        game.addVisual(moneda2)
		game.addVisual(moneda3)
		game.addVisual(moneda4)
		game.addVisual(moneda5)
		game.addVisual(moneda6)
		game.addVisual(moneda7)
		game.addVisual(moneda8)
		game.addVisual(moneda9)
		game.addVisual(moneda10)	
		// personaje, es importante que sea el último visual que se agregue
	
		
		// teclado
		// este es para probar, no es necesario dejarlo
		keyboard.g().onPressDo({ self.ganar() })

		// colisiones, acá sí hacen falta
	}
	
	method ganar() {
		// es muy parecido al terminar() de nivelBloques
		// el perder() también va a ser parecido
		
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="dungeonwall.png"))
		// después de un ratito ...
		game.schedule(2500, {
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="ganamos.png"))
			// después de un ratito ...
			game.schedule(3000, {
				// fin del juego
				game.stop()
			})
		})
	}
	
	
}
