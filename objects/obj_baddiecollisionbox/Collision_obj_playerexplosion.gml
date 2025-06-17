if (instance_exists(baddieID) && baddieID.invtime == 0 && baddieID.state != states.grabbed && !baddieID.invincible && baddieID.instantkillable)
{
    baddieID.invtime = 15;
    event_play_oneshot("event:/SFX/bo/punch", x, y);
    
    if (!baddieID.important)
    {
        global.style += (5 + global.combo);
        global.combotime = 60;
        global.heattime = 60;
    }
    
    var lag = 10;
    baddieID.hitLag = lag;
    baddieID.hitX = baddieID.x;
    baddieID.hitY = baddieID.y;
    baddieID.hp -= 1;
    instance_create(baddieID.x, baddieID.y, obj_parryeffect);
    baddieID.alarm[3] = 3;
    baddieID.state = states.hit;
    baddieID.image_xscale = -other.image_xscale;
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_baddiegibs);
    
    with (obj_camera)
    {
        shake_mag = 3;
        shake_mag_acc = 3 / room_speed;
    }
}
