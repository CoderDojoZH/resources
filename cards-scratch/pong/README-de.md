# Pong spielen

Bewege das Paddel, so dass der Ball nie den Boden berührt.

![](images/pong-game.png)

---

Pong ist eines der ältesten Computerspiele.

Ein Ball bewegt sich auf dem Bildschirm hin und her.

Bewege das Paddel, so dass der Ball nie den Boden berührt.

Wähle die entsprechenden Figuren aus der Bibliothek aus oder zeichne deine eigene Figuren.

---

Für das Spiel brauchst du:

- einen Ball,
- ein Paddel,
- einen Boden,
- und einen coolen Hintergrund.

---

Beim drücken der grüne Flagge soll der Ball zuerst zur Ausgangsposition gehen.

![](images/de/01-pong-start-position.svg)

```
Wenn die grüne Flagge angeklickt
gehe zu x: (20) y: (150)
setze Richtung auf (45)
```

Dann soll der Ball anfangen sich hin und her zu bewegen:

![](images/de/02-pong-ball-bounce.svg)

```
wiederhole fortlaufend 
  gehe (15) er-Schritt
  pralle vom Rand ab
end
```

---

Klicke auf die grüne Flagge und der Ball soll anfangen sich hin und her zu bewegen.

---

Das Paddel soll unten am Bildschirm platziert werden und sich dann von links nach rechts bewegen.

![](images/de/03-pong-paddle-move.svg)

```
Wenn die grüne Flagge angeklickt
wiederhole fortlaufend 
  setze x auf (Maus x-Position)
end
```

Das Paddel folgt den X-Koordinaten der Maus.

---

Der Ball soll prüfen, ob es das Paddel berührt.

![](images/de/04-pong-ball-check-paddle.svg)

```
Wenn die grüne Flagge angeklickt
. . .
wiederhole fortlaufend 
  . . .
  falls <wird [Paddel v] berührt?> dann
  end
end
```

![](images/de/04-pong-ball-paddle-bounce.svg)

```
gehe (10) er-Schritt
pralle vom Rand ab
```

Falls er es berührt, dann soll er zurückspringen:

![](images/de/05-pong-ball-paddle-bounce.svg)

```
spiele Klang [water drop v]
setze Richtung auf (Zufallszahl von (-75) bis (75))
gehe (15) er-Schritt
```

---

Und sobald der Ball den roten Boden berührt, wird alles gestoppt!

![](images/de/06-pong-ball-touch-ground.svg)

```
falls <wird [Boden v] berührt?> dann 
  stoppe [alles v]
end
```

---

- Punkte zählen.
- Paddel mit der Tastatur bewegen.
- Den Ball unterschiedlich zurückspringen lassen, je nach dem, ob er links, in der Mitte oder rechts das Paddel berührt (Paddel einfärben oder den Unterschied bei den X-Koordinaten berechnen).
