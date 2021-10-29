direction = random(360);
start_speed = 2;
current_percent = 1;
slow_down = random_range(0.02, 0.08);

radius = 30;
collect_speed = 10;

if(check_special(ATTRACT)) radius = radius * 3;