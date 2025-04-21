function state_player_ladder()
{
    jumpAnim = 1;
    dashAnim = 1;
    landAnim = 0;
    moveAnim = 1;
    stopAnim = 1;
    crouchslideAnim = 1;
    crouchAnim = 0;
    machhitAnim = 0;
    turning = 0;
    jumpstop = 0;
    movespeed = 0;
    hsp = 0;
    
    if (input_check("up") && hooked == 0 && ladderfast == 0)
    {
        sprite_index = spr_laddermove;
        vsp = -6;
        image_speed = 0.35;
    }
    else if (input_check("down") && hooked == 0 && ladderfast == 0)
    {
        sprite_index = spr_ladderdown;
        vsp = 10;
        image_speed = -0.35;
    }
    else if (ladderfast == 0)
    {
        sprite_index = spr_Ladder;
        vsp = 0;
    }
    
    if (ladderfast == 1)
    {
        sprite_index = spr_ladderdown;
        vsp = 16;
        image_speed = -0.35;
    }
    
    mach2 = 0;
    jumpAnim = 1;
    dashAnim = 1;
    landAnim = 0;
    moveAnim = 1;
    stopAnim = 1;
    crouchslideAnim = 1;
    crouchAnim = 1;
    machhitAnim = 0;
    
    if (!place_meeting(x, y, obj_ladder) && !place_meeting(x, y, obj_stairs))
    {
        landAnim = 0;
        jumpAnim = 0;
        state = states.normal;
        image_index = 0;
        vsp = 0;
        ladderfast = 0;
    }
    
    if (input_check_pressed("jump") && ladderfast == 0)
    {
        sprite_index = spr_jump;
        ladderbuffer = 20;
        jumpAnim = 1;
        state = states.jump;
        
        if (input_check("down"))
            vsp = 5;
        else
            vsp = -9;
        
        image_index = 0;
    }
    
    if ((input_check("down") && grounded && !place_meeting(x, y, obj_platform)) || (grounded && ladderfast == 1 && !place_meeting(x, y, obj_platform)))
    {
        state = states.normal;
        image_index = 0;
        ladderfast = 0;
    }
    
    exit;
}
