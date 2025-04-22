with (other)
{
    if (state != enemystates.grabbed)
    {
        if (place_meeting(x, y - 1, obj_solid))
            ventilator_vsp = 5;
        
        if (place_meeting(x, y + 1, obj_solid))
            ventilator_vsp = -5;
        
        vsp = ventilator_vsp;
    }
}
