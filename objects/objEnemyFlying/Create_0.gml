//move_options = [0, 1, 2];
move_directions = [0, 90, 180, 270];
//move_weights = [50, 5, 0]; //move random, stay still, attack
current_move = 0;
move_opt = 0;
move_rnd = 0;
new_move = false;

//stay still, hit, move, attack
spd_array = [0, 0, 0, 0];
dir_array = [0, 0, 0, 0];
amt_array = [0, 0, 0, 0];
xsc_array = [1, 1, 1, 1];




alarm[0] = irandom_range(move_timer - move_timer_rnd, move_timer + move_timer_rnd);
