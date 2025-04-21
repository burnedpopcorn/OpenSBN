if (instance_exists(obj_fadeout))
    exit;

scr_init_saveData();

with (obj_player1)
{
    global.leveltosave = "hub";
    global.leveltorestart = -4;
    sprite_index = spr_victory;
    visible = true;
    image_index = 0;
    state = states.victory;
    movespeed = 0;
    hsp = 0;
    vsp = 0;
    targetRoom = hub_entrancehall;
    targetDoor = "A";
    
    if (keyboard_check(vk_alt) && global.DebugMode)
        targetRoom = rm_levelselect;
    
    instance_create(x, y, obj_fadeout);
    global.level_seconds = 0;
    global.level_minutes = 0;
    backtohubroom = room;
}
