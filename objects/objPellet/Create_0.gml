direction = random(360);
start_speed = 5;
current_percent = 1;
slow_down = random_range(0.02, 0.08);
rotation = random_range(-5, 5);

radius = 100;
tcollect = get_timer();
scollect = random_range(0.2, 1);
collect_speed = irandom_range(10, 20);

stime = get_timer();
live = random_range(10, 14);
