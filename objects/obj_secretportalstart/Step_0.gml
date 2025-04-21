image_speed = 0.35;

switch (sprite_index)
{
    case spr_secretportal_spawnopen:
        with (obj_heatafterimage)
            visible = false;
        
        with (obj_player1)
        {
            if (object_index != obj_player2 || global.coop)
            {
                x = other.x;
                y = other.y;
                roomstartx = x;
                roomstarty = y;
                hsp = 0;
                vsp = 0;
                cutscene = 1;
                visible = false;
                
                if (!isgustavo && state != states.knightpep && state != states.knightpepslopes && state != states.knightpepbump && state != states.fishdash && state != states.fishground && state != states.fishhurt && state != states.fishswim)
                    state = states.normal;
            }
        }
        
        waitbuffer = 80;
        drop = 0;
        
        if (floor(image_index) == (image_number - 1))
        {
            event_play_oneshot("event:/SFX/misc/secretexit", x, y);
            sprite_index = spr_secretportal_spawnidle;
            
            with (obj_player1)
            {
                if (object_index != obj_player2 || global.coop)
                {
                    if (!isgustavo && state != states.knightpep && state != states.knightpepslopes && state != states.knightpepbump && state != states.fishdash && state != states.fishground && state != states.fishhurt && state != states.fishswim)
                    {
                        visible = true;
                        cutscene = 0;
                        sprite_index = spr_bodyslamstart;
                        image_index = 0;
                        state = states.freefallprep;
                        vsp = (character == "P") ? -5 : -7;
                    }
                    else
                    {
                        sprite_index = tauntstoredsprite;
                    }
                }
            }
        }
        
        break;
    
    case spr_secretportal_spawnidle:
        if (!drop)
        {
            with (obj_heatafterimage)
                visible = false;
            
            with (obj_player1)
            {
                if (check_player_coop())
                {
                    x = other.x;
                    y = other.y - 10;
                    visible = true;
                    hsp = 0;
                    vsp = 10;
                    scale_xs = approach(scale_xs, 1, 0.05);
                    scale_ys = approach(scale_ys, 1, 0.05);
                    fallinganimation = 0;
                    
                    if (scale_xs == 1)
                        other.drop = 1;
                }
            }
        }
        
        if (drop)
        {
            if (waitbuffer > 0)
            {
                waitbuffer--;
            }
            else
            {
                sprite_index = spr_secretportal_spawnclose;
                image_index = 0;
            }
        }
        
        break;
    
    case spr_secretportal_spawnclose:
        if (floor(image_index) == (image_number - 1))
        {
            image_index = image_number - 1;
            instance_destroy();
        }
        
        break;
}
