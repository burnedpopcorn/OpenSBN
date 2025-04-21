if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create(x, y - 50, obj_parryeffect))
        sprite_index = spr_lilaceffect;
    
    event_play_oneshot("event:/sfx/misc/secretnotif1", x, y);
    ds_list_add(global.saveroom, id);
}
