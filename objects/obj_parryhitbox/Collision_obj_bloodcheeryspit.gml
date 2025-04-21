with (other)
{
    var current_hspd = abs(hsp);
    var _dir = sign(hsp);
    
    if (x != other.x)
        _dir = sign(x - other.x);
    
    hsp = _dir * current_hspd;
    player = true;
    image_xscale = _dir;
}

if (!collisioned)
    event_user(0);
