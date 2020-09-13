# Start a pygame project in a Linux / MacOs terminal

If you're used to the terminal or otherwise want to use to manage and start your game.

When starting your project you need to:

- Create a directory with your game and `cd` into it.
- Create a virtual environment.
- Activate the virtual environment.
- Install pygame with `pip`.

```sh
$ mkdir your-game
$ cd your-game
$ python3 -m venv venv
$ source venv/bin/activate
(venv) $ pip install pygame
```

Each time you work on your project you need to:

- Activate the virtual environment.
```sh
$ cd your-game
$ source venv/bin/activate
```
