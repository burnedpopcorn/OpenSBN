function state_player_crouch()
{
    move = input_check("right") - input_check("left");
    
    if (!place_meeting(x, y + 1, obj_railparent))
    {
        hsp = move * movespeed;
    }
    else
    {
        var _railinst = instance_place(x, y + 1, obj_railparent);
        hsp = (move * movespeed) + (_railinst.movespeed * _railinst.dir);
    }
    
    movespeed = 4 * getRPGMulti("movespeed");
    mask_index = spr_crouchmask;
    turning = 0;
    
    if (!grounded && !input_check("jump"))
    {
        jumpAnim = 0;
        state = states.crouchjump;
        movespeed = 4 * getRPGMulti("movespeed");
        crouchAnim = 1;
        image_index = 0;
    }
    
    if (grounded && !input_check("down") && !scr_solid(x, y - 16) && !scr_solid(x, y - 32) && !input_check("jump"))
    {
        state = states.normal;
        movespeed = 0;
        crouchAnim = 1;
        jumpAnim = 1;
        image_index = 0;
        mask_index = spr_player_mask;
    }
    
    if (crouchAnim == 0)
    {
        if (move == 0)
        {
            if (shotgunAnim == 0)
                sprite_index = spr_crouch;
            else
                sprite_index = spr_shotgunduck;
        }
        
        if (move != 0)
        {
            if (shotgunAnim == 0)
                sprite_index = spr_crawl;
            else
                sprite_index = spr_shotguncrawl;
        }
    }
    
    if (crouchAnim == 1)
    {
        if (move == 0)
        {
            if (shotgunAnim == 0)
                sprite_index = spr_couchstart;
            else
                sprite_index = spr_shotgungoduck;
            
            if (floor(image_index) == (image_number - 1))
                crouchAnim = 0;
        }
    }
    
    if (move != 0)
    {
        xscale = move;
        crouchAnim = 0;
    }
    
    if (input_check_pressed("jump") && can_jump && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
    {
        event_play_oneshot("event:/SFX/bo/jump", x, y);
        vsp = -8 * getRPGMulti("jump");
        state = states.crouchjump;
        movespeed = 4 * getRPGMulti("movespeed");
        image_index = 0;
        crouchAnim = 1;
        jumpAnim = 1;
    }
    
    if (input_check_pressed("slap") && grounded)
    {
        suplexmove = 1;
        
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale;
        
        movespeed = 12 * getRPGMulti("attack");
        crouchslipbuffer = 25;
        fmod_event_play(crouchslide_snd);
        grav = 0.5;
        sprite_index = spr_player_Sjumpcancelland;
        image_index = 0;
        machhitAnim = 0;
        state = states.tumble;
    }
    
    image_speed = 0.45;
    exit;
}
