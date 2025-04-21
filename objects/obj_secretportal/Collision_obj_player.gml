if (active && sprite_index != spr_secretportal_open && !instance_exists(obj_jumpscare) && ds_list_find_index(global.saveroom, id) == -1)
{
    if (sprite_index != spr_secretportal_close)
    {
        sprite_index = spr_secretportal_close;
        image_index = 0;
        event_play_oneshot("event:/SFX/misc/secretenter", x, y);
    }
    
    if (!touched && !soundtest)
    {
        if (!global.inSecret)
        {
            global.inSecret = true;
            global.inSecretend = false;
        }
        else
        {
            global.inSecret = false;
            global.inSecretend = true;
        }
    }
    
    touched = 1;
    playerid = other.id;
    other.x = x;
    other.y = y - 30;
    other.vsp = 0;
    other.hsp = 0;
    other.cutscene = 1;
    var fisharr = [UnknownEnum.Value_270, UnknownEnum.Value_271, UnknownEnum.Value_272, UnknownEnum.Value_273];
    
    if (!array_contains(fisharr, other.state))
        other.sprite_index = other.spr_hurtjump;
    
    with (obj_heatafterimage)
        visible = false;
}
