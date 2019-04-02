# Pull and launch

## Code

![](images/green-flag-en.svg)

```
When Flag clicked
go to (start v)
```

![](images/green-flag-de.svg)

```
Wenn die grüne Flagge angeklickt
gehe zu (Start v)
```

![](images/on-clicked-full-en.svg)

```
When this sprite clicked
repeat until <not <mouse down?>>
    go to (mouse-pointer v)
end
point towards (start v)
set [speed v] to ((distance to (start v)) / (3))

repeat until <(y position) < (-150)>
  move (speed) steps
  if <(direction) < (180)> then
    turn cw (3) degrees
  end
  if <touching (target v)> then
    point in direction (180)
  end
end
go to (start v)
```

![](images/on-clicked-full-de.svg)

```
Wenn ich angeklickt werde
wiederhole bis <nicht <Maustaste gedrückt?>> 
  gehe zu (Mauszeiger v)
end
drehe dich zu (Start v)
setze [Geschwindigkeit v] auf ((Entfernung von (Start v)) / (3))
wiederhole bis <(y-Position) < (-150)> 
  gehe (Geschwindigkeit) er-Schritt
  falls <(Richtung) < (180)> dann 
    drehe dich nach rechts um (3) Grad
  end
  falls <wird (Ziel v) berührt?> dann 
    setze Richtung auf (180)
  end :: control
end
gehe zu (Start v) :: motion
```

## Notes

### dx and dy

the right way to set the speed seems to be:

```
set [v v] to ((distance to (start v)) / (3)
set [dx v] to ([v v] * ([sin v] of (direction))
set [dy v] to ([v v] * ([cos v] of (direction))
repeat until <touching (target v)>
  change x by (dx)
  change y by (dy)
  change (dy) by (-0.1)
end
```

## Drawing a pull string

It should be easy to use the pen to draw a pull string.

## Credits

Basketball hoop: https://openclipart.org/detail/312211/basketball-hoop
