As a player:
- I want to play to the classic minesweeper game
- So I want to detect all the mines in the board
How to refer to a cell:
- Using the (row,column) nomenclature
- Rows and columns starts from 1
How to load mock data:
- Using the <ctrl>+m keyboard combination to discover
    the load mock data form
To define the board data will use:
    "o" No mine
    "*" Mine
    "-" Row separator
    Thera are two ways to define mock data:
    - Inline:
    "***-ooo-*oo"
    - Table:
    | * | * | * |
    | o | o | o |
    | * | o | o |
To define the board display will use:
    COVERED CELLS
    "." Hidden cell
    "!" Cell tagged has mined cell by the user
    "?" Cell tagged has inconclusive cell by the user
    "x" Cell wrongly tagged has no mined cell by the user
    UNCOVERED CELLS
    "0" Empty cell
    "1" Clean cell with 1 adjacent mine
    "2" Clean cell with 2 adjacent mines
    "3" Clean cell with 3 adjacent mines
    "4" Clean cell with 4 adjacent mines
    "5" Clean cell with 5 adjacent mines
    "6" Clean cell with 6 adjacent mines
    "7" Clean cell with 7 adjacent mines
    "8" Clean cell with 8 adjacent mines
    AFTER FINISH GAME CELLS
    "@" highlighted mine
    "#" not highlighted mine
Game example: http://birrell.org/andrew/minesweeper/

Background:
Given the player opens the game

#CASES OF TIMER
Scenario: Starting game - The timer should be empty
Then the timer should be empty

Scenario: Restarting game - The timer should be empty
When the player presses the restart button
Then the timer should be empty

Scenario: Uncovering a cell - The timer should start
When the player uncovers any cell
Then the timer should start

Scenario: Puting a flag on a cell - The timer should start
When the player puts '!' at any cell
Then the timer should start

Scenario: Starting the timer - The timer should be 0
When the player uncovers any cell
Then the timer should be 0

Scenario: Starting the timer and waiting - The timer should increase
Given the player uncovers any cell
When the player waits 10 seconds 
Then the timer should increase

Scenario: Losing the game - The timer should stop
Given the player uncovers any cell
When the player uncovers a mine cell
Then the timer should stop

Scenario: Winning the game - The timer should stop
Given the player uncovers any cell
When the player uncovers all the cells without mine
Then the timer should stop