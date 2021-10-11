enemy_count = 0;
if(layer_exists("EnemiesFlying")) enemy_count += instance_number(objEnemyFlying);
if(layer_exists("EnemiesGrounded")) enemy_count += instance_number(objEnemyGround);
if(layer_exists("EnemiesGrounded")) enemy_count += instance_number(objEnemyCrawl);