if (room == rm_blank)
    exit;

if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == false)
{
    global.combo += 1;
    global.combotime = 60;
    scr_escapeinit();
    global.panic = true;
    instance_destroy();
    
    with (instance_create(x, y, obj_baddieDead))
        sprite_index = spr_hungrypillar_angry;
    
    instance_create(x, y, obj_pillardeadeffect);
    event_play_oneshot("event:/SFX/enemies/pillardead");
    instance_create(x, y + 600, obj_itstuctime);
    ds_list_add(global.saveroom, id);
}
