with (obj_player1)
{
    if (state == states.motorcycle && place_meeting(x + hsp, y, other))
    {
        other.destroy = 1;
        instance_destroy(other);
    }
}
