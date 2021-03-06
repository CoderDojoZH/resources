kWIDTH = 960
HEIGHT = 720

WHITE = (255, 255, 255)
BLUE = (66, 78, 244)

class Grid:
    # 900 x 650 -> 18 x 13 @ 50 px
    grid = []
    movements = {'stop': (0, 0), 'left': (-1, 0), 'right': (1, 0), 'up': (0, -1), 'down': (0, 1)}
    
    def __init__(self, grid, format = None):
        if format is None:
            format = {} 
        self.grid = grid
        self.grid_color = format.get('color', BLUE)
        self.visible = format.get('visible', True)
        self.size_cell = format.get('cell-size', (50, 50))
        self.size_table = (len(grid[0]), len(grid))
        self.size_pixel = (self.size_table[0] * self.size_cell[0], self.size_table[1] * self.size_cell[1])
        self.padding_table = format.get('padding-table', (0, 0))
        self.padding_cell = format.get('cell-padding', (5, 5))
        self.anchor_cell = format.get('cell-anchor', 'top') # top, center

    
    def draw(self):
        if self.visible:
            x_start = self.padding_table[0]
            x_end = self.size_pixel[0] + self.padding_table[0]
            y_start = self.padding_table[1]
            y_end = self.size_pixel[1] + self.padding_table[1]
            for i in range(x_start, x_end + 1, self.size_cell[0]):
                x, y = (i, y_start), (i, y_end)
                screen.draw.line(x, y, BLUE)
            for j in range(y_start, y_end + 1, self.size_cell[0]):
                x, y = (x_start, j), (x_end, j)
                screen.draw.line(x, y, BLUE)

    def get_first_cell_with_value(self, value):
        value = str(value)
        for i, row in enumerate(self.grid):
            for j, cell in enumerate(row):
                if cell == value:
                    return (j, i)

    def get_all_cells_with_value(self, value):
        cells = []
        value = str(value)
        for i, row in enumerate(self.grid):
            for j, cell in enumerate(row):
                if cell == value:
                    cells.append((j, i))
        return cells

    def is_value(self, position, value):
        return self.grid[position[1]][position[0]] == value
        
    def is_in_grid(self, position):
        return 0 <= position[0] < len(self.grid[0]) and 0 <= position[1] < len(self.grid)

    def get_moved_position(position, movement):
        if isinstance(movement, str):
            movement = Grid.movements[movement]
        return tuple(map(lambda x, y: x + y, position, movement))

    def get_next_coordinates(position, movement, scalar):
        if isinstance(movement, str):
            movement = Grid.movements[movement]
        return Grid.get_moved_position(position, tuple(x * scalar for x in movement))

    def get_coordinates(self, position):
        x = self.padding_table[0] + self.padding_cell[0] + position[0] * self.size_cell[0]
        y = self.padding_table[1] + self.padding_cell[1] + position[1] * self.size_cell[1]
        return (x, y)
grid = Grid([
    #   1 = start, 2 = wall
    #    123456789012345678
        '                  ', # 1
        '                  ', # 2
        '                  ', # 3
        '                  ', # 4
        '                  ', # 5
        '                  ', # 6
        '                  ', # 7
        '      222         ', # 8
        '                  ', # 9
        '                  ', # 0
        '                  ', # 1
        '1 2               ', # 2
        '                  ', # 3)
], {'padding-table': (30, 35)})

class Chicken(Actor):
    step_length = 50
    def __init__(self, grid):
        super().__init__('chicken')
        self.grid = grid
        self.position = self.grid.get_first_cell_with_value('1')
        self.topleft = grid.get_coordinates(self.position)

        self.step_moved = 0
        self.direction = 'stop'
        self.next_direction = 'stop'
    
    def on_key_down(self, key, mod):
        if key == keys.LEFT:
            self.next_direction = 'left'
        elif key == keys.RIGHT:
            self.next_direction = 'right'
        elif key == keys.UP:
            self.next_direction = 'up'
        elif key == keys.DOWN:
            self.next_direction = 'down'

    def update(self, dt):
        self.update_position(dt)
        
    def draw(self):
        super().draw()

    def update_position(self, dt):
        
        change_direction = self.direction != self.next_direction
        step = self.step_length * dt
        self.step_moved += step
        on_grid = False
        next_position = self.position
        
        if self.step_moved >= self.step_length:
            on_grid = True
            step -= self.step_moved - self.step_length
            self.step_moved = self.step_length - self.step_moved # TODO: falsch?
        
        if on_grid:
            self.position = Grid.get_moved_position(self.position, self.direction)
            
        if on_grid and change_direction:
            next_position = Grid.get_moved_position(self.position, self.next_direction)
            if not grid.is_in_grid(next_position) or grid.is_value(next_position, '2'):
                change_direction = False
            else:
                self.direction = self.next_direction
                
        if on_grid and not change_direction:
            next_position = Grid.get_moved_position(self.position, self.direction)
            if not grid.is_in_grid(next_position) or grid.is_value(next_position, '2'):
                self.direction = 'stop'
        if on_grid:
            self.topleft = self.grid.get_coordinates(self.position)
        else:
            self.topleft = Grid.get_next_coordinates(self.topleft, self.direction, step)
chicken = Chicken(grid)

class Block(Actor):
    def __init__(self, grid):
        self.blocks = []
        for position in grid.get_all_cells_with_value('2'):
            block = Actor('block')
            block.topleft = grid.get_coordinates(position)
            self.blocks.append(block)
    def draw(self):
        for block in self.blocks:
            block.draw()
block = Block(grid)

def on_key_down(key, mod):
    chicken.on_key_down(key, mod)

def update(dt):
    chicken.update(dt)
    
def draw():
    screen.fill(WHITE)
    grid.draw()
    block.draw()
    chicken.draw()