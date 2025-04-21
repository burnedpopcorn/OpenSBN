event_inherited();

with (other)
{
    if (state == states.chainsaw || state == states.actor || state == states.debugstate)
        exit;
    
    hsp_carry += lengthdir_x(other.currentMovespeed, other.image_angle);
    vsp_carry += lengthdir_y(other.currentMovespeed, other.image_angle);
}
