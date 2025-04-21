with (other)
{
    if (fanID != other.id && !disappear)
    {
        x = approach(x, other.x, spd);
        y = approach(y, other.y, spd);
        
        if (x == other.x && y == other.y)
        {
            hsp = lengthdir_x(spd, other.image_angle);
            vsp = lengthdir_y(spd, other.image_angle);
            x = other.x;
            y = other.y;
            fanID = other.id;
        }
    }
}
