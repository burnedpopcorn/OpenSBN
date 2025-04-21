if (room == rm_blank)
    exit;

if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
    scr_sleep(5);
    
    with (instance_create(x + 32, y + 32, obj_parryeffect))
        sprite_index = spr_bigpizzablockdead;
    
    if (content == obj_null)
    {
        global.heattime += 10;
        global.heattime = clamp(global.heattime, 0, 60);
        global.combotime += 10;
        global.combotime = clamp(global.combotime, 0, 60);
        var val = heat_calculate(100);
        global.collect += val;
        event_play_oneshot("event:/SFX/misc/collect", x, y);
        
        with (instance_create(x + 16, y, obj_smallnumber))
            number = string(val);
    }
    else
    {
        instance_create(x + 32, y, content);
    }
    
    tile_layer_delete_at(1, x, y);
    tile_layer_delete_at(1, x + 32, y);
    tile_layer_delete_at(1, x + 32, y + 32);
    tile_layer_delete_at(1, x, y + 32);
    event_play_oneshot("event:/SFX/misc/breakblock", x, y);
    ds_list_add(global.saveroom, id);
}
