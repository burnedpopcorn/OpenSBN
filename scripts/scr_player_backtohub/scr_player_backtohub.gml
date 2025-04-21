function scr_player_backtohub()
{
    global.leveltorestart = -4;
    hsp = 0;
    movespeed = 0;
    
    if (sprite_index != spr_rockethitwall)
        vsp = 0;
    
    image_speed = 0.35;
    
    if (sprite_index == spr_slipbanan1)
    {
        if (y < backtohubstarty)
        {
            y += 20;
            vsp = 0;
            
            if (y >= backtohubstarty)
            {
                event_play_oneshot("event:/SFX/bo/groundpound", x, y);
                y = backtohubstarty;
                sprite_index = spr_rockethitwall;
                vsp = -14;
                instance_create(x, y + 39, obj_bangeffect);
                image_index = 0;
                
                with (obj_camera)
                {
                    shake_mag = 3;
                    shake_mag_acc = 5 / room_speed;
                }
            }
        }
    }
    else if (sprite_index == spr_rockethitwall)
    {
        if (vsp < 20)
            vsp += grav;
        
        if (y >= backtohubstarty && vsp > 0)
        {
            y = backtohubstarty;
            sprite_index = spr_slipbanan2;
            image_index = 0;
            vsp = 0;
            backtohubbuffer = 25;
        }
    }
    else if (sprite_index == spr_slipbanan2 && floor(image_index) == (image_number - 1))
    {
        image_index = image_number - 1;
        
        if (backtohubbuffer > 0)
        {
            backtohubbuffer--;
        }
        else
        {
            state = states.normal;
            landAnim = 0;
            facestompAnim = 1;
        }
    }
}
