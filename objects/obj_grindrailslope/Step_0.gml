with (obj_player1)
{
    if (state != states.backbreaker && state != states.bump)
    {
        if (place_meeting_slopePlatform(x, y + 1, other) && vsp >= 0)
        {
            if (!isgustavo && state != states.grind)
            {
                state = states.grind;
                vsp = 0;
            }
            else if (isgustavo && state != states.ratmountgrind)
            {
                if (brick == 1)
                {
                    with (instance_create(x, y, obj_brickcomeback))
                        wait = 1;
                }
                
                brick = 0;
                y += 46;
                state = states.ratmountgrind;
            }
        }
    }
}
