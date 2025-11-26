sprite_index = !collide ? spr_null : noone;

if (instance_exists(obj_bomb))
    collide = 0;

if (obj_player1.state != states.bombdelete)
    collide = 0;
