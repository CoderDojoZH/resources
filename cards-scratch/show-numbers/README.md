# Show numbers

Combine digits to numbers... and show the score.

## Get ready

You need three sprites:

- A button you can push.
- Two "digits", with 10 costumes each: from 0 to 9.

And you need the "score" variable".

![](assets/score.svg)

```
(score)
```

## Add to the score

![](assets/reset-score.svg)

```
when Flag clicked
set [score v] to (0)
```

![](assets/count-score.svg)

```
when this sprite clicked
change [score v] by (1)
broadcast [score v]
```

## Display the score

![](assets/score-0-start.svg)

```
when Flag clicked
show
```

(42 / 10) mod 10 = 4

![](assets/score-0-show.svg)

```
when i receive [score v]
switch costume to (((score) mod (10)) + (1))
```

42 mod 10 = 2

![](assets/score-00-show.svg)

```
when i receive [score v]
switch costume to ((([floor v] of ((score) / (10))) mod (10)) + (1))
```
"mod" is the remainder of a division.

steps for "drawing" the switch costume:

```
([floor v] of ((score) / (10)))
(((10) mod (10)) + (1))
switch costume to ()
((([floor v] of ((score) / (10))) mod (10)) + (1))
switch costume to ((([floor v] of ((score) / (10))) mod (10)) + (1))
```

## License

Finger [Khanke](https://openclipart.org/user-detail/Khanke) from openclipart: https://openclipart.org/detail/279143/finger-click
