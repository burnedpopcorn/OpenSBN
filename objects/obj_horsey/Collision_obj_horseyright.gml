if (!other.used)
{
    hsp = 0;
    vsp = 0;
    x = approach(x, other.x + (other.sprite_width / 2), spd);
    y = approach(y, other.y + (other.sprite_height / 2), spd);
    
    if (x == (other.x + (other.sprite_width / 2)) && y == (other.y + (other.sprite_height / 2)))
    {
        hsp = other.hsp * spd;
        vsp = other.vsp * spd;
        other.used = 1;
    }
}
