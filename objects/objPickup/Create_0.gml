direction = random(360);
slow_down = random_range(slow_down_low, slow_down_high);
rotation = random_range(-rotation_range, rotation_range);


tcollect = get_timer();
scollect = random_range(scollect_low, scollect_high);
collect_speed = irandom_range(collect_speed_low, collect_speed_high);

stime = get_timer();
live = random_range(life_low, life_high);
