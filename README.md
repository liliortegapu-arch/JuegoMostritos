# Juego Mostritos 👾

Juego 2D hecho en Godot como proyecto de clase.

## 🎮 Sobre el juego

En este juego controlamos a un personaje que tiene que avanzar por el mapa evitando enemigos y obstáculos.

El jugador puede moverse, saltar y atacar. También hay enemigos con diferentes comportamientos que pueden hacer daño al jugador.

## 🕹️ Controles

- ⬅️ **Flecha izquierda** → Moverse a la izquierda
- ➡️ **Flecha derecha** → Moverse a la derecha
- ⬆️ **Espacio** → Saltar
- 🥊 **F** → Golpear

## ⚔️ Cosas que tiene el juego

- Movimiento del jugador.
- Salto.
- Animación de caminar.
- Animación de salto.
- Animación de golpe.
- Animación de muerte.
- Enemigos.
- Enemigos que detectan al jugador mediante `RayCast2D`.
- Enemigos que atacan al jugador.
- Puñetazos que solo hacen daño durante determinadas frames de la animación.
- Fuego que mata al jugador al tocarlo.
- Hadas que tienen su propia animación de muerte.
- Cuando el hada muere, el fuego relacionado también desaparece.
- Sistema de muerte del jugador.

## 👾 Enemigos

### Enemigo estático

El enemigo permanece en su posición y utiliza dos `RayCast2D`, uno hacia cada lado, para detectar al jugador.

Cuando detecta al jugador:

1. Hace la animación de puñetazo.
2. El puñetazo solo está activo durante determinadas frames.
3. Si el jugador recibe el golpe, muere.

### 👾 Enemigo móvil

El enemigo se mueve de derecha a izquierda y de izquierda a derecha por el mapa.

Cuando llega al límite de la zona por la que se mueve, cambia de dirección.

Si el jugador choca con el enemigo, el jugador muere.

### 🔥 Fuego

El fuego funciona como un obstáculo.

Si el jugador entra en contacto con él, el jugador muere.

### 🧚 Hada

El hada tiene una animación de muerte.

Cuando el jugador entra en contacto con el hada:

- El hada hace su animación de muerte.
- El fuego relacionado con ella también desaparece.
- Después se elimina el hada.

## 🛠️ Tecnologías utilizadas

- **Godot Engine**
- **GDScript**
- **Git**
- **GitHub**
- **Tiled** para crear/editar el mapa

## 📁 Estructura

El proyecto contiene principalmente:

- Escenas de Godot.
- Scripts en GDScript.
- Sprites y animaciones.
- Mapas creados con Tiled.
- Enemigos y obstáculos.

## 🚧 Estado del proyecto

El juego está actualmente en desarrollo.

Se irán añadiendo nuevas mecánicas, enemigos y mejoras.

## 👤 Autor

Proyecto realizado por **liliortegapu-arch**.
