with (other)
{
    if ((!instakillmove || state == states.mach2) && state != states.bump && other.state == states.walk && state != states.chainsaw)
    {
        vsp = -4;
        hsp = -3 * xscale;
        state = states.bump;
        sprite_index = spr_bump;
        image_index = 0;
        other.state = states.bump;
        other.sprite_index = spr_clownmato_bounce;
        other.image_index = 0;
    }
}
