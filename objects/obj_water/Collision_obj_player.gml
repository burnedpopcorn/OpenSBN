with (other)
{
    if (state == states.chainsaw || state == states.actor || state == states.debugstate)
        exit;
    
    if (state != states.fishdash && state != states.freefall && state != states.freefallland && state != states.fishhurt && state != states.fishground && state != states.superslam && state != states.fishswim && sprite_index != spr_dive)
    {
        if (vsp > -8)
            vsp = approach(vsp, -8, 5);
        
        switch (state)
        {
            case states.Sjump:
            case states.Sjumpprep:
                state = states.jump;
                break;
            
            case states.machslide:
                if (sprite_index == spr_machslideboost)
                    state = states.mach2;
                
                break;
        }
        
        state = states.waterfloat;
        jumpstop = true;
    }
}
