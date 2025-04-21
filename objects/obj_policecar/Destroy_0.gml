with (instance_create(x, y, obj_baddieDead))
    sprite_index = spr_policecar_dead;

with (obj_policebooth)
    released = 0;

ds_queue_destroy(followqueue);
