**Knight's Travails**
========

This program using Object Oriented Programming, BFS, and a ternary search tree to find the shortest set of moves a Knight can make to get from one location to another on the chess board.

========

To start, I defined a class called "Knight," which each have 3 variables:

    - location: the location of the instance of Knight on the board
    - children: an array that holds all possible legal moves that Knight can make.
    - parent: holds a pointer to the previous instance of Knight.

[Screenshot of Knight Class](/images/knightscreenshot.png)


I then created the class KnightsTravail which contains 2 variables "start_location" and "target_location" as well as a function for building the tree and a function for printing out the shortest path once it has been found. 

![Screenshot of output](/images/resultscreenshot.png)


    build_tree_of_possible_moves(current_queue = [self.start_location]): which takes an array which acts as a queue for each level of the tree, starting with the start_location provided by the user.
        - Each time this function is called it creates two empty arrays, "next_queue" and "tmp_queue".
        - First, the function iterates through each value in current_queue and creates 8 instances of the Knight class representing all 8 possible moves the Knight can make, and a pointer to their parent Knight.
        - Next, each new Knight's value is checked to make sure it is at a valid location on the chess board and if one of the locations is equal to the provided target_location.
        - If a Knight does not equal the target location and is a valid move, it is appeneded to the "next_queue" array and is added to the the children array of the current Knight (located at current_queue[0]).
        - After iterating through all Knights on the current level, tree_of_all_possible_moves is called again, this time using next_queue. 

    - path(knight) : Once a Knight has been created with a current_position that is the same as the target_location, the path function is called.
        - This function takes the Knight with the target value and then follows the pointers up the tree, appending each one to an array called "path_array" 
        - The array is then reversed, and printed, starting from the starting position, and ending with the Knight at the target location. Providing the player with the most optimal move set.
    
        <!-- ![Screenshot of output]](/images/resultscreenshot.png) -->
