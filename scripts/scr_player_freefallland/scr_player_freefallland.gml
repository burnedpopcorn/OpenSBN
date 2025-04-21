function state_player_freefallland()
{
    mach2 = 0;
    jumpAnim = 1;
    dashAnim = 1;
    landAnim = 0;
    moveAnim = 1;
    stopAnim = 1;
    crouchslideAnim = 1;
    crouchAnim = 0;
    machhitAnim = 0;
    movespeed = 0;
    facehurt = 1;
    start_running = 1;
    alarm[4] = 14;
    vsp = 0;
    hsp = 0;
    
    if (floor(image_index) == (image_number - 1))
    {
        facehurt = 1;
        sprite_index = spr_facehurtup;
        image_index = 0;
        state = states.normal;
        jumpstop = 1;
    }
    
    if ((input_buffer_jump < 8 || input_check_pressed("jump")) && can_jump && vsp > 0)
    {
        event_play_oneshot("event:/SFX/bo/jump", x, y);
        sprite_index = spr_jump;
        image_index = 0;
        vsp = -pepperman_jumpspeed;
        state = states.jump;
        
        with (instance_create(x, y - 5, obj_highjumpcloud2))
            image_xscale = other.xscale;
    }
    
    image_speed = 0.35;
    exit;
}
