event_inherited();

with (other)
{
    if (state != states.grabbed)
    {
        hsp_carry += lengthdir_x(other.currentMovespeed, other.image_angle);
        vsp_carry += lengthdir_y(other.currentMovespeed, other.image_angle);
    }
}
