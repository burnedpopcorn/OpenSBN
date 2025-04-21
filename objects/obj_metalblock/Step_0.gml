with (obj_player1)
{
    if (character != "V")
    {
        if ((place_meeting(x + hsp, y, other) || place_meeting(x + xscale, y, other)) && (obj_player1.state == states.mach3 || obj_player1.state == states.rocket || obj_player1.state == states.knightpepslopes || obj_player1.state == states.shoulderbash))
        {
            playerindex = 0;
            gamepad_vibrate_constant(3, 5);
            instance_destroy(other);
            
            if (state == states.mach3 && sprite_index != spr_mach3hit && (character == "P" || character == "V"))
            {
                if (fightball == 0)
                    sprite_index = spr_mach3hit;
                
                image_index = 0;
            }
        }
    }
}

if (place_meeting(x, y + 1, obj_player1) || place_meeting(x, y - 1, obj_player1) || place_meeting(x - 1, y, obj_player1) || place_meeting(x + 1, y, obj_player1))
{
    if (place_meeting(x, y - 1, obj_player1) && (obj_player1.state == states.freefall || obj_player1.state == states.superslam) && obj_player1.freefallsmash >= 10)
    {
        playerindex = 0;
        gamepad_vibrate_constant(3, 5);
        instance_destroy();
    }
    
    if (place_meeting(x, y - 1, obj_player1) && (obj_player1.state == states.knightpep || obj_player1.state == states.hookshot))
    {
        playerindex = 0;
        instance_destroy();
    }
}
