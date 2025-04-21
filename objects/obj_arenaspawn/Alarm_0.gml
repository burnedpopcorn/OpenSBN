if (state != UnknownEnum.Value_147)
{
    wave_seconds--;
    
    if (wave_seconds < 0)
    {
        if (wave_minutes > 0)
        {
            wave_seconds = 59;
            wave_minutes--;
        }
        else
        {
            wave_seconds = 0;
            
            with (obj_player1)
            {
                if (state != states.ejected)
                {
                    vsp = -11;
                    state = states.ejected;
                    targetRoom = lastroom;
                }
            }
        }
    }
}

if (state == UnknownEnum.Value_145 || state == UnknownEnum.Value_144)
    alarm[0] = 60;
