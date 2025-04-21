if (state != states.stun)
{
    if (!other.isgustavo)
    {
        if (other.state != states.mach3 || !other.launched)
        {
            if (state != states.blockstance)
            {
                sprite_index = spr_hamkuff_chain1;
                state = states.blockstance;
                playerid = other.id;
            }
        }
        else
        {
            instance_destroy();
        }
    }
    else if (other.brick && state != states.blockstance)
    {
        other.brick = 0;
        state = states.blockstance;
        sprite_index = spr_hamkuff_chain1;
        state = states.blockstance;
        
        with (other)
        {
            state = states.ratmounthurt;
            xscale = -other.image_xscale;
            vsp = -10;
        }
        
        with (instance_create(other.x, other.y, obj_brickcomeback))
        {
            trapped = 1;
            baddieID = other.id;
            other.playerid = id;
        }
    }
    else if (other.state == states.ratmountpunch)
    {
        instance_destroy();
    }
    else
    {
        with (other)
        {
            state = states.ratmounthurt;
            xscale = other.image_xscale;
            vsp = -10;
        }
    }
}
