if (room == rm_blank)
    exit;

if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create(x + 32, y + 32, obj_baddieDead))
        sprite_index = spr_bigdoughblockdead;
    
    scr_sleep(5);
    event_play_oneshot("event:/SFX/misc/breakblock", x, y);
    ds_list_add(global.saveroom, id);
}

instance_destroy(solid_inst);
