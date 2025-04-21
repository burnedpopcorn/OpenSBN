if (room == rm_blank)
    exit;

instance_create(x, y, obj_weeniemount);

with (instance_create(x, y, obj_baddieDead))
    sprite_index = spr_weeniesquire_dead;
