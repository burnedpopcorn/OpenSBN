function state_player_grabbing()
{
    landAnim = 0;
    hsp = xscale * movespeed;
    move = input_check("right") - input_check("left");
    momemtum = 1;
    dir = xscale;
    
    if (sprite_index != spr_player_Sjump)
    {
        if (movespeed < 12 && grounded)
            movespeed += 1;
        else if (!grounded)
            movespeed = 12;
    }
    
    var attackdash = spr_null;
    var airattackdash = spr_null;
    var airattackdashstart = spr_null;
    
    if (sprite_index == attackdash && !grounded)
    {
        image_index = 0;
        sprite_index = airattackdashstart;
    }
    
    if (grounded && key_chainsaw2)
    {
        fmod_event_play(suplexdashsnd);
        state = states.grabbing;
        image_index = 0;
        vsp = 0;
        sprite_index = spr_null;
        movespeed = 8;
        
        with (instance_create(x, y, obj_superdashcloud))
            image_xscale = other.xscale;
        
        particle_set_scale(particle.crazyrunothereffect, xscale, 1);
        create_particle(x, y, particle.crazyrunothereffect, 0);
    }
    
    if (sprite_index == airattackdash && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_fall;
        state = states.jump;
    }
    
    if (floor(image_index) == (image_number - 1) && (sprite_index == attackdash || sprite_index == spr_player_Sjump))
        state = states.normal;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == airattackdashstart)
        sprite_index = airattackdash;
    
    grav = 0;
    
    if (scr_solid(x + 1, y) && xscale == 1 && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
    {
        grav = 0.5;
        movespeed = 0;
        state = states.bump;
        hsp = -2.5;
        vsp = -3;
        mach2 = 0;
        image_index = 0;
        machslideAnim = 1;
        machhitAnim = 0;
        instance_create(x + 10, y + 10, obj_bumpeffect);
    }
    
    if (scr_solid(x - 1, y) && xscale == -1 && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
    {
        grav = 0.5;
        movespeed = 0;
        state = states.bump;
        hsp = 2.5;
        vsp = -3;
        mach2 = 0;
        image_index = 0;
        machslideAnim = 1;
        machhitAnim = 0;
        instance_create(x - 10, y + 10, obj_bumpeffect);
    }
    
    if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
    {
        with (instance_create(x, y, obj_slidecloud))
            image_xscale = other.xscale;
    }
    
    image_speed = 0.35;
    
    if (move != xscale && move != 0)
    {
        image_index = 0;
        
        if (!grounded)
        {
            sprite_index = spr_null;
            grav = 0.5;
            state = states.jump;
        }
        else
        {
            state = states.normal;
            grav = 0.5;
        }
    }
    
    exit;
}
