with (instance_create(x + 16, y + 16, obj_baddieDead))
    sprite_index = spr_doughblockdead;

scr_sleep(5);
tile_layer_delete_at(1, x, y);

with (instance_create(x, y, obj_destroyable_respawner))
{
    image_xscale = other.image_xscale;
    image_yscale = other.image_yscale;
    sprite_index = other.sprite_index;
    content = other.object_index;
    spawn_buffer = 70;
}
