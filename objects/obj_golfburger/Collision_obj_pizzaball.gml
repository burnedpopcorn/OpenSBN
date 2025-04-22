if (state != states.throwing && state != enemystates.stun && state != enemystates.grabbed)
{
    if (other.state == enemystates.walk)
    {
        golfid = other.id;
        shot = 0;
        state = states.throwing;
        sprite_index = spr_golfburger_golf;
        image_index = 0;
        
        if (shootdir == 0)
            image_xscale = choose(-1, 1);
        else
            image_xscale = shootdir;
    }
    else if (other.state == states.thrown)
    {
        instance_destroy();
    }
}
