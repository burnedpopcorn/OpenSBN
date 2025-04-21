if (active)
{
    var hdeccel = abs(h_velocity) / 24;
    
    if (hdir != hscale)
    {
        hmovespeed = approach(hmovespeed, 0, hdeccel);
        
        if (hmovespeed <= 0)
        {
            hscale *= -1;
            hdir = hscale;
        }
    }
    else
    {
        hmovespeed = approach(hmovespeed, h_velocity, hdeccel);
    }
    
    var vdeccel = abs(v_velocity) / 24;
    
    if (vdir != vscale)
    {
        vmovespeed = approach(vmovespeed, 0, vdeccel);
        
        if (vmovespeed <= 0)
        {
            vscale *= -1;
            vdir = vscale;
        }
    }
    else
    {
        vmovespeed = approach(vmovespeed, v_velocity, vdeccel);
    }
    
    hsp = hmovespeed * hscale;
    vsp = vmovespeed * vscale;
    trueX += hsp;
    trueY += vsp;
    
    if (changing_vdir && !place_meeting(x, y, obj_moving_vstop))
        changing_vdir = 0;
    
    if (changing_hdir && !place_meeting(x, y, obj_moving_hstop))
        changing_hdir = 0;
}
else if (place_meeting(x, y - 1, obj_player1))
{
    with (obj_player1)
    {
        if (place_meeting(x, y + 1, other) && !place_meeting(x, y, other))
        {
            other.active = 1;
            other.vmovespeed = 0;
        }
    }
}

x = round(trueX);
y = round(trueY);
