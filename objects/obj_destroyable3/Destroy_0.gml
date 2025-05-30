if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (8)
    {
        with (create_debris(x + random_range(0, 64), y + random_range(0, 64), spr_towerblockdebris, 1))
        {
            hsp = random_range(-5, 5);
            vsp = random_range(-10, 10);
            image_speed = 0;
            image_index = irandom_range(0, 3);
        }
    }
    
    repeat (3)
    {
        with (instance_create(x + random_range(0, 64), y + random_range(0, 64), obj_parryeffect))
        {
        }
    }
    
    scr_sleep(5);
    tile_layer_delete_at(1, x, y);
    tile_layer_delete_at(1, x + 32, y);
    tile_layer_delete_at(1, x + 32, y + 32);
    tile_layer_delete_at(1, x, y + 32);
    event_play_oneshot("event:/SFX/misc/breakblock", x, y);
    ds_list_add(global.saveroom, id);
}
