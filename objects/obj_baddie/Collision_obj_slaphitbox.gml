instance_create(x + (obj_player1.xscale * 40), y, obj_punchdust);

with (obj_player1)
{
    image_index = 0;
    sprite_index = spr_null;
    
    if (other.heavy == 1)
        heavy = 1;
    else
        heavy = 0;
    
    state = states.grab;
}

state = states.grabbed;
instance_destroy(other);
