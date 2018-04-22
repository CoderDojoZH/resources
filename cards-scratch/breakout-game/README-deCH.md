# Breakout

## Bewege den Paddel

![](assets/code-de/paddle-move.svg)

```
Wenn die grüne Flagge angeklickt
gehe zu x: (0) y: (-150)
wiederhole fortlaufend 
  setze x auf (Maus x-Position)
end
```

## Ein hüpfender Ball

![](assets/code-de/ball-speed.svg)

```
(Geschwindigkeit)
```

![](assets/code-de/ball-bounce.svg)

```
Wenn die grüne Flagge angeklickt
setze [Geschwindigkeit v] auf [8]
gehe zu x: (0) y: (50)
setze Richtung auf ((180) + (Zufallszahl von (-20) bis (20)))
zeige dich
wiederhole fortlaufend 
  gehe (Geschwindigkeit) er-Schritt
  pralle vom Rand ab
  . . .
end
```

## Das Paddel und der Ball

![](assets/code-de/ball-bounce-angle.svg)

```
setze y auf (([y position v] of [Paddel v]) + (20))
  drehe dich zu [Paddel v]
  drehe dich nach links um (180) Grad
end
```

## Ein Leben verlieren


![](assets/code-de/ball-balls.svg)

```
(Bälle)
```

![](assets/code-de/ball-lifes-init.svg)

```
Wenn die grüne Flagge angeklickt
. . .
setze [Bälle v] auf [3]
```

![](assets/code-de/ball-lifes.svg)

```
falls <(y-Position) < ([y-Position v] von [Paddel v])> dann 
  verstecke dich
  ändere [Bälle v] um (-1)
  gehe zu x: (0) y: (50)
  setze Richtung auf ((180) + (Zufallszahl von (-20) bis (20)))
  zeige dich
  warte (2) Sek.
end
```

## Refactoring

![](assets/code-de/ball-refactoring-reset.svg)

```
Definiere Position zurücksetzen
gehe zu x: (0) y: (50)
setze Richtung auf ((180) + (Zufallszahl von (-20) bis (20)))
```

![](assets/code-de/ball-refactoring-init.svg)

```
setze [Geschwindigkeit v] auf [8]
setze [Bälle v] auf [3]
Position zurücksetzen :: custom
zeige dich
```

![](assets/code-de/ball-refactoring-lifes.svg)

```
verstecke dich
ändere [Bälle v] um (-1)
warte (2) Sek.
Position zurücksetzen :: custom
zeige dich
```

## Spielende

![](assets/code-de/ball-gameover.svg)

```
Wenn die grüne Flagge angeklickt
verstecke dich
warte bis <(Bälle) > [1]>
warte bis <(Bälle) < [1]>
zeige dich
stoppe [alles v]
```

## Zeichne die Ziegelsteine

![](assets/code-de/bricks-init-position.svg)

```
Wenn die grüne Flagge angeklickt
verstecke dich
gehe zu x: (-210) y: (160)
```

![](assets/code-de/bricks-init-create.svg)

```
Wenn die grüne Flagge angeklickt
. . .
setze [Ziegelsteine v] auf [0]
setze [Reihe v] auf [0]
wiederhole (3) mal 
  setze [Spalte v] auf [0]
  wiederhole (13) mal 
    erzeuge Klon von [mir selbst v]
    ändere [Spalte v] um (1)
  end
  ändere [Reihe v] um (1)
end
```

![](assets/code-de/bricks-init-clone.svg)

```
Wenn ich als Klon entstehe
gehe zu x: ((-210) + ((35) * (Spalte))) y: ((160) - ((20) * (Reihe)))
zeige dich
ändere [Ziegelsteine v] um (1)
```

![](assets/code-de/bricks-init-wait.svg)

```
warte bis <(Ziegelsteine) = [39]>
```

## Ziegelsteine treffen

![](assets/code-de/brick-hit.svg)

```
warte bis <wird [Ball v] berührt?>
ändere [Ziegelsteine v] um (-1)
lösche diesen Klon
```

![](assets/code-de/ball-hit.svg)

```
falls <wird [Ziegelsgtein v] berührt?> dann 
  setze Richtung auf ((180) - (Richtung))
end
```

## Der Gewinner

![](assets/code-de/winner.svg)

```
Wenn die grüne Flagge angeklickt
verstecke dich
warte bis <(Zigelsteine) > [0]>
warte bis <(Zigelsteine) = [0]>
zeige dich
stoppe [alles v]
```

# Farbige Ziegelsgteine

![](assets/code-de/bricks-colors-define.svg)

```
Definiere Farbe setzen
wechsle zu Kostüm ((Reihe) + (1))
falls <(Reihe) = [1]> dann 
  falls <<(Spalte) = [ 3 ]> oder <<(Spalte) = [ 6 ]> oder <(Spalte) = [9]>>> dann 
    wechsle zu Kostüm [Grau v]
  end
end
```

![](assets/code-de/bricks-colors.svg)

```
Wenn ich als Klon entstehe
. . .
Farbe setzen :: custom
zeige dich
. . .
falls <nicht <(Kostumnummer) = [4]>> dann 
  warte bis <wird [Ball v] berührt?>
  . . .
  lösche diesen Klon
end
```

## Gewinner @ 3

![](assets/code-de/winner-wait-3.svg)

```
warte bis <(bricks) > [4]>
warte bis <(bricks) < [4]>
```

## Die Pillen falle

![](assets/code-de/bonus-start-x.svg)

```
(Bonus Start X)
```

![](assets/code-de/bonus-start-y.svg)

```
(Bonus Start Y)
```

![](assets/code-de/bonus-drop-trigger.svg)

```
setze [Bonus Start X v] auf (x-Position)
setze [Bonus Start Y v] auf (y-Position)
sende [Bonus fällt v] an alle
```

![](assets/code-de/bonus-hide.svg)

```
when green flag clicked
hide
```

![](assets/code-de/bonus-clone.svg)

```
Wenn ich [Bonus fällt v] empfange
erzeuge Klon von [mir selbst v]
```

![](assets/code-de/bonus-bonus.svg)

```
(Bonus)
```


![](assets/code-de/bonus-drop-random.svg)

```
Wenn ich als Klon entstehe
setze [Bonus v] auf (Zufallszahl von (1) bis (12))
falls <(Bonus) > [3]> dann 
  lösche diesen Klon
end
```

![](assets/code-de/bonus-drop.svg)

```
wechsle zu Kostüm (Bonus)
gehe zu x: (Bonus start X) y: (Bonus start Y)
zeige dich
wiederhole bis <(y-Position) < ([y-Position v] von [Paddel v])> 
  ändere y um (-6)
  falls <wird [Paddel v] berührt?> dann 
    . . .
    lösche diesen Klon
  end
end
lösche diesen Klon
```

## Bonus: ein breites Paddel

![](assets/code-de/bonus-wide-paddle-broadcast.svg)

```
falls <(Bonus) = [1]> dann 
  sende [Bonus Breites Paddel v] an alle
end
```

![](assets/code-de/bonus-wide-paddle-start.svg)

```
Wenn ich [Bonus Breites Paddel v] empfange
falls <(Kostumnummer) = [1]> dann 
  wechsle zu Kostüm [Breit v]
  warte (10) Sek.
  wechsle zu Kostüm [Normal v]
end
```

![](assets/code-de/bonus-wide-paddle-on-flag.svg)

```
Wenn die grüne Flagge angeklickt
wechsle zu Kostüm [Normal v]
. . .
```

## Bonus: ein langsamer Ball

![](assets/code-de/bonus-slow-ball-broadcast.svg)

```
falls <(Bonus) = [2]> dann 
  sende [Bonus langsamer Ball v] an alle
end
```

![](assets/code-de/bonus-slow-ball-start.svg)

```
Wenn ich [Bonus langsamer Ball v] empfange
falls <(Geschwindigkeit) = [8]> dann 
  setze [Geschwindigkeit v] auf [5]
  warte (10) Sek.
  setze [Geschwindigkeit v] auf [8]
end
```

## Bonus: Extra Bälle

![](assets/code-de/bonus-extra-ball-broadcast.svg)

```
falls <(Bonus) = [3]> dann 
  sende [Bonus extra Ball v] an alle
end
```

![](assets/code-de/bonus-extra-ball-receive.svg)

```
Wenn ich [Bonus extra Ball v] empfange
falls <(Kostumnummer) = [1]> dann 
  erzeuge Klon von [Ball v]
end
```

![](assets/code-de/bonus-extra-ball-clone.svg)

```
Wenn ich als Klon entstehe
wechsle zu Kostüm [Extra v]
Position zurücksetzen :: custom
hüpfen :: custom
```

![](assets/code-de/bonus-extra-ball-define.svg)

```
Definiere hüpfen
wiederhole fortlaufend 
  . . .
end
```

![](assets/code-de/bonus-extra-ball-flag-forever.svg)

```
Wenn die grüne Flagge angeklickt
. . .
wiederhole fortlaufend 
  . . .
end
```

![](assets/code-de/bonus-extra-ball-bounce.svg)

```
Wenn die grüne Flagge angeklickt
. . .
hüpfen :: custom
```

![](assets/code-de/bonus-extra-ball-if-position.svg)

```
Definiere hüpfen
. . .
falls <(y-Position) < ([y-Position v] of [Paddel v])> dann 
  . . .
end
```

![](assets/code-de/bonus-extra-ball-delete.svg)

```
if <(y position) < ([y position v] of [paddle v])> then 
  if <(costume #) = [1]> then 
    ...
  else 
    delete this clone
  end
end
```

