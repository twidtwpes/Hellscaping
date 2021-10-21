//if(wait(stime, timetolive)) instance_destroy();

image_alpha = (current / timetolive) * 0.3;
current--;

if(image_alpha < 0) instance_destroy();