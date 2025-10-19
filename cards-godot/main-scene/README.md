# Creating the main scene

The main scene _orchestrates_ all the characters and items of the game and -- for simple games -- contains the background.

- If you have just started project you currently are in an empty scene. Otherwise create a new scene with _Scene > New Scene_.
- Add (_+ Other Node_) a _basic_ node and rename it to `Main`.
- Save the scene as `main.tscn` (_Scene > Save Scene_).- In the `Main` node, add a new node of type _Sprite2D_ and rename it to `Background`.
- Drag the `Background.png` file from the assets folder in the _FileSystem_ panel to the _Inspector_'s, _Texture_ property of the _Sprite2D_ panel.
- In the _Project Settings_, go to the _Window_ panel and set the _Viewport Width_ to `864` and the _Viewport Height_ to `936`.
- In the _Inspector_'s _Sprite2D_ panel, set the _Offset_'s _x_ to `432` and _y_ to `384` to correctly position the background image.
  - TODO: How to manage the size of the background
- Running the game with _Run Project_ (_F5_), select the current scene as the main one and it should show the background image.

## Todo

- It is possible to add svg drawings and they will be rasterized at import time. Question: how can the user manage the size used by Godot?
- How to pick a good window size?
- Under which conditions, we use something else than a _Sprite2D_?
