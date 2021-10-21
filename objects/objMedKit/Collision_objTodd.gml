var hp = objTodd.hp;
hp+=3;
objTodd.hp = min(hp, objTodd.hp_max);
instance_destroy();