var hp = objTodd.hp;
hp++;
objTodd.hp = min(hp, objTodd.hp_max);
instance_destroy();