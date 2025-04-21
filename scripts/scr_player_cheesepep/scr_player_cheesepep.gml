function state_player_cheesepep()
{
    key_particles = 0;
    mach2 = 0;
    momemtum = 0;
    alarm[5] = 2;
    alarm[7] = 60;
    move = input_check("right") - input_check("left");
    
    if (!place_meeting(x, y + 1, obj_railparent))
    {
        hsp = xscale * movespeed;
    }
    else
    {
        var _railinst = instance_place(x, y + 1, obj_railparent);
        hsp = (xscale * movespeed) + (_railinst.movespeed * _railinst.dir);
    }
    
    if (input_check_pressed("jump"))
        input_buffer_jump = 0;
    
    if (grounded && move != 0 && sprite_index == spr_cheesepepidle)
        sprite_index = spr_cheesepepwalk;
    else if (grounded && move == 0 && sprite_index == spr_cheesepepwalk)
        sprite_index = spr_cheesepepidle;
    
    if (move != 0 && sprite_index != spr_cheesepepjumpstart)
    {
        xscale = move;
        movespeed = approach(movespeed, 3, 0.5);
    }
    else
    {
        movespeed = approach(movespeed, 0, 0.25);
    }
    
    image_speed = 0.35;
    
    if (grounded && (floor(image_index) % 4) == 0 && hsp != 0)
        create_debris(x, y + 43, spr_grapedebris);
    
    if (!grounded)
    {
        state = states.cheesepepjump;
        sprite_index = spr_cheesepepfall;
        jumpstop = 1;
        movespeed = xscale * movespeed;
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_cheesepepland || sprite_index == spr_cheesepepintro)
        {
            if (move != 0)
                sprite_index = spr_cheesepepwalk;
            else
                sprite_index = spr_cheesepepidle;
        }
    }
    
    if (input_buffer_jump < 8 && sprite_index != spr_cheesepepjumpstart && sprite_index != spr_cheesepepland)
    {
        image_index = 0;
        sprite_index = spr_cheesepepjumpstart;
    }
    
    if (sprite_index == spr_cheesepepjumpstart && floor(image_index) == (image_number - 1))
    {
        vsp = -11;
        image_index = 0;
        sprite_index = spr_cheesepepjump;
        state = states.cheesepepjump;
    }
    
    exit;
}
