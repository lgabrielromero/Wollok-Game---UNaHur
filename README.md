
# Skeleton Nightmare


## Controles
- Para mover a tu personaje se usan las teclas  (↓) (↑) (→) (←).
- Para tirar las bombas/granadas se usa la tecla CTRL.
- Para agarrar los consumibles y bombas se usa la tecla espacio.
- Para ir al nivel Test se usa la tecla P




## Celda sorpresa

- Piso ? Rojo:  quita 15 puntos de energía.
- Piso ? Amarillo: agrega 30 puntos de energía.
- Piso ? Celeste: hace aparecer un objecto en un posicion aleatorea.
- Piso ? Rosado: "teletransporta" a otra posición.


## Objetivo Nivel 1 - Agrupar objetos cuidando la energía

El objetivo del nivel 1 debe ser agrupar varios objetos acumulables en una zona determinada del tablero, por ejemplo, tener 3 cajas y 3 llaves en una zona que se llame deposito del tablero. La zona del deposito se deberá generar en forma aleatoria cuando inicia el nivel. Cuando todos los objetos acumulables están en la zona del deposito automáticamente se pasa al nivel 2.

Si el personaje se queda sin energía, entonces pierde. A cada paso que da el personaje, gasta una unidad de energía. El personaje arranca el nivel con 30 unidades de energía.  

Para recuperar energía, el personaje tiene que **agarrar** objetos que le otorguen energía. Para ello debe estar en una posición pegada al objeto y mediante una tecla agarrarlo. Cada objeto que suministra energía tiene una cantidad de unidades de energía que se establece en forma particular para cada uno, p.ej. podríamos tener una hamburguesa que dé 10 unidades de energía y otra que dé 5.

## Objetivo Nivel 2 - Ganar Dinero con salud

En el nivel 2 el objetivo del personaje es ganar dinero. El personaje gana dinero cuando **colisiona** con los objeto que otorgan dinero. Al colisionar con un objeto que otorga dinero el personaje acumula el dinero que le otorga, el objeto desaparece del tablero y el personaje pierde salud. 

Un detalle **muy importante**: debe aparecer una puerta de salida para finalizar el nivel 2 _recién_ cuando el personaje colisono con todos los objetos que otorgan dinero y aún conserva energía 

 
Si el personaje se queda sin salud , entonces pierde. Si pasa por la puerta de salida, entonces gana. En cualquiera de los dos casos, debe aparecer un cartel que indique el resultado.


## Mega bonus
Agregar un nivel 3, en el que hay bichos que se mueven automáticamente. El objetivo es matar todos los bichos, lanzándoles granadas. La granada recorre hasta 3 celdas en la dirección del último movimiento del personaje. Si un bicho se choca con el personaje, entonces le resta 20 unidades de salud, y vuelve a su posición anterior.  
Atenti: el personaje nace sin granadas, tiene que recogerlas del tablero. 
