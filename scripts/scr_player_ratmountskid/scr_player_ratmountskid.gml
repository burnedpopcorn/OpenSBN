function state_player_ratmountskid()
{
    hsp = xscale * -movespeed;
    movespeed = approach(movespeed, 0, 0.8);
    
    if (brick)
        sprite_index = spr_ratmount_skid;
    else
        sprite_index = spr_lonegustavo_skid;
    
    gustavodash = 0;
    ratmount_movespeed = 8;
    image_speed = 0.4;
    
    if (movespeed <= 0)
        state = states.ratmount;
    
    if (input_check_pressed("jump") && !input_check("up"))
        input_buffer_jump = 0;
    
    if (input_buffer_jump < 8 && can_jump && sprite_index != spr_player_ratmountswallow)
    {
        particle_set_scale(particle.highjumpcloud2, xscale, 1);
        create_particle(x, y, particle.highjumpcloud2, 0);
        event_play_oneshot("event:/SFX/bo/jump", x, y);
        
        if (brick)
            sprite_index = spr_player_ratmountjump;
        else if (ratmount_movespeed >= 12)
            sprite_index = spr_lonegustavo_dashjump;
        else
            sprite_index = spr_player_ratmountgroundpound;
        
        image_index = 0;
        movespeed = hsp;
        jumpAnim = 1;
        state = states.ratmountjump;
        vsp = -11;
        jumpstop = 0;
    }
    
    if (input_check_pressed("slap") && brick)
    {
        ratmount_kickbrick();
    }
    else if (input_check_pressed("slap") && !brick)
    {
        ratmountpunchtimer = 25;
        state = states.ratmountpunch;
        image_index = 0;
        
        if (move != 0)
            xscale = move;
        
        movespeed = hsp;
        sprite_index = spr_lonegustavo_punch;
    }
    
    if (!instance_exists(dashcloudid) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale;
            other.dashcloudid = id;
        }
    }
    
    exit;
}
