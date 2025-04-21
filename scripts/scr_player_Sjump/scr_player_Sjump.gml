function state_player_Sjump()
{
    move = input_check("right") - input_check("left");
    hsp = 0;
    mach2 = 0;
    jumpAnim = 1;
    dashAnim = 1;
    landAnim = 0;
    moveAnim = 1;
    stopAnim = 1;
    crouchslideAnim = 1;
    crouchAnim = 0;
    machhitAnim = 0;
    
    if ((sprite_index == spr_superjump || sprite_index == spr_superspringplayer) && (character == "N" || character == "P"))
        vsp = sjumpvsp;
    
    sjumpvsp -= (0.1 * getRPGMulti("jump"));
    
    if (character == "V" && image_index > 3)
        vsp = -11 * getRPGMulti("jump");
    
    if (sprite_index == spr_null)
    {
        if (a < 25)
            a++;
        
        hsp = xscale * a;
        vsp = 0;
    }
    
    if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles))
    {
        pizzapepper = 0;
        a = 0;
        
        if (sprite_index == spr_null)
            sprite_index = spr_null;
        
        if (sprite_index == spr_superjump || sprite_index == spr_superspringplayer)
            sprite_index = spr_superjumpland;
        
        with (obj_camera)
        {
            shake_mag = 10;
            shake_mag_acc = 30 / room_speed;
        }
        
        with (obj_baddie)
        {
            if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
            {
                image_index = 0;
                
                if (grounded)
                    vsp = -7;
            }
        }
        
        event_play_oneshot("event:/SFX/bo/groundpound", x, y);
        event_play_oneshot("event:/SFX/bo/bumpwall", x, y);
        image_index = 0;
        state = states.Sjumpland;
        machhitAnim = 0;
    }
    else if ((input_check_pressed("attack") || input_check_pressed("slap")) && character == "P" && sprite_index != spr_superspringplayer && sprite_index != spr_player_Sjumpcancelstart)
    {
        image_index = 0;
        sprite_index = spr_player_Sjumpcancelstart;
        event_play_oneshot("event:/SFX/bo/superjumpcancel", x, y);
    }
    
    if (sprite_index == spr_player_Sjumpcancelstart)
    {
        vsp = 0;
        
        if (move != 0)
            xscale = move;
        
        if (floor(image_index) == (image_number - 1))
        {
            jumpstop = 1;
            vsp = -4 * getRPGMulti("jump");
            flash = 1;
            movespeed = 13 * getRPGMulti("attack");
            image_index = 0;
            sprite_index = spr_player_Sjumpcancel;
            state = states.mach3;
            
            with (instance_create(x, y, obj_crazyrunothereffect))
                image_xscale = other.xscale;
        }
    }
    else if (!instance_exists(crazyruneffectid))
    {
        with (instance_create(x, y, obj_crazysjumpeffect, 
        {
            image_angle: 90
        }))
            other.crazyruneffectid = id;
    }
    
    if (character == "N" && input_check_pressed("jump"))
    {
        event_play_oneshot("event:/SFX/bo/jump", x, y);
        jumpstop = 0;
        vsp = -15 * getRPGMulti("jump");
        state = states.jump;
        sprite_index = spr_null;
        image_index = 0;
        
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale;
    }
    
    if (character == "N")
    {
        if (move == 1)
            hsp = 3;
        
        if (move == -1)
            hsp = -3;
    }
    
    image_speed = 0.5;
    exit;
}
