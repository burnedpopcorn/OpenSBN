function scr_escapeinit()
{
    with (obj_baddie)
    {
        if (escape == true)
        {
            visible = true;
            instance_create(x, y, obj_genericpoofeffect);
        }
    }
    
    with (obj_escapecollect)
        image_alpha = 1;
    
    with (obj_escapecollectbig)
        image_alpha = 1;
    
    obj_camera.alarm[1] = 60;
    instance_create(x, y, obj_bangeffect);
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_baddiegibs);
    
    if (global.coop == true)
    {
        obj_player1.x = x;
        obj_player2.x = x;
        obj_player1.y = y;
        obj_player2.y = y;
    }
    
    with (obj_camera)
    {
        shake_mag = 3;
        shake_mag_acc = 3 / room_speed;
    }
    
    scr_escapeBackground();
    
    switch (room)
    {
        case midway_7:
            global.minutes = 4;
            global.seconds = 0;
            break;
        
        case water_9:
            global.minutes = 4;
            global.seconds = 30;
            break;
        
        case rm_testies:
            global.minutes = 1;
            global.seconds = 1;
            break;
    }
    
    global.fill = 60 * (global.seconds + (global.minutes * 60));
    
    with (obj_tv)
        chunkmax = global.fill;
    
    global.wave = 0;
    global.maxwave = global.fill;
}
