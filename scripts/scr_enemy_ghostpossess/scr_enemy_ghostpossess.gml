function scr_enemy_ghostpossess()
{
    var _move = 0;
    
    with (playerid)
    {
        sprite_index = spr_ghostidle;
        x = other.x;
        y = other.y;
        _move = input_check("right") - input_check("left");
        
        if (input_check_pressed("up"))
        {
            state = states.ghost;
            vsp = -10;
            other.state = states.stun;
            other.stunned = 50;
            create_particle(x, y, particle.genericpoofeffect, 0);
            visible = true;
        }
    }
    
    if (sprite_index != spr_tack_ragestart && sprite_index != spr_tack_rageloop && sprite_index != spr_grape_rage && sprite_index != spr_indiancheese_howl)
    {
        image_speed = 0.35;
        
        if (_move != 0)
            possess_movespeed = approach(possess_movespeed, 6, 0.5);
        else
            possess_movespeed = 0;
        
        hsp = _move * possess_movespeed;
        
        if (hsp != 0)
        {
            image_xscale = sign(hsp);
            
            if (sprite_index != spr_indiancheese_jump)
                sprite_index = walkspr;
        }
        else if (sprite_index != spr_indiancheese_jump)
        {
            sprite_index = idlespr;
        }
        
        switch (object_index)
        {
            case obj_tack:
                if (playerid.input_check_pressed("slap"))
                {
                    ragedash = 50;
                    flash = 1;
                    create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
                    sprite_index = spr_tack_ragestart;
                    image_index = 0;
                    hsp = 0;
                }
                
                break;
            
            case obj_grape:
                if (playerid.input_check_pressed("slap"))
                {
                    ragedash = 100;
                    sprite_index = spr_grape_rage;
                    image_index = 0;
                    flash = 1;
                    create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
                    hsp = 0;
                }
                
                break;
            
            case obj_indiancheese:
                if (playerid.input_check_pressed("jump"))
                    playerid.input_buffer_jump = 0;
                
                if (playerid.input_buffer_jump < 8 && can_jump && vsp > 0)
                {
                    playerid.input_buffer_jump = 8;
                    vsp = -11;
                    sprite_index = spr_indiancheese_jump;
                }
                
                if (sprite_index == spr_indiancheese_jump)
                {
                    if (floor(image_index) == (image_number - 1))
                        image_index = image_number - 1;
                    
                    if (grounded && vsp > 0)
                        sprite_index = idlespr;
                }
                
                if (playerid.input_check_pressed("slap"))
                {
                    sprite_index = spr_indiancheese_howl;
                    image_index = 0;
                    hsp = 0;
                    ragedash = 50;
                    shot = 0;
                    flash = 1;
                    create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
                }
                
                break;
        }
    }
    else
    {
        switch (object_index)
        {
            case obj_tack:
                image_speed = 0.6;
                
                if (ragedash > 0)
                    ragedash--;
                
                if (sprite_index == spr_tack_ragestart)
                {
                    hsp = 0;
                    vsp = 0;
                    
                    if (floor(image_index) == (image_number - 1))
                        sprite_index = spr_tack_rageloop;
                }
                
                if (sprite_index == spr_tack_rageloop)
                {
                    hsp = image_xscale * 8;
                    var dir = image_xscale * 8;
                    
                    with (instance_place(x + dir, y, obj_destructibles))
                        instance_destroy();
                    
                    with (instance_place(x + dir, y, obj_baddie))
                    {
                        if (destroyable)
                            instance_destroy();
                    }
                }
                
                if (ragedash <= 0)
                    sprite_index = spr_tack_walk;
                
                break;
            
            case obj_grape:
                image_speed = 0.5;
                
                if (floor(image_index) > 10)
                {
                    hsp = image_xscale * 8;
                    
                    with (instance_place(x + (image_xscale * 8), y, obj_baddie))
                    {
                        if (destroyable)
                            instance_destroy();
                    }
                }
                else
                {
                    hsp = 0;
                }
                
                if (floor(image_index) == (image_number - 1))
                    sprite_index = spr_grapemove;
                
                break;
            
            case obj_indiancheese:
                hsp = 0;
                
                if (ragedash > 0)
                    ragedash--;
                else
                    sprite_index = spr_indiancheese_walk;
                
                if (ragedash < 30 && !shot)
                {
                    shot = 1;
                    
                    with (instance_create(x, y, obj_arcprojectile))
                    {
                        image_xscale = other.image_xscale;
                        hsp = image_xscale * 6;
                        vsp = -8;
                        team = 1;
                        baddieID = other.id;
                    }
                }
                
                break;
        }
    }
}
