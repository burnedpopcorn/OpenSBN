if (!grabbed && (other.state == states.handstandjump || other.state == states.punch || other.state == states.lungeattack) && unpickable == 0)
{
    instance_create(x + (obj_player1.xscale * 40), y, obj_punchdust);
    
    with (other)
    {
        image_index = 0;
        sprite_index = spr_haulingstart;
        baddiegrabbedID = other.id;
        grabbingenemy = 1;
        state = states.grab;
    }
    
    playerid = other.object_index;
    grabbed = 1;
}

if (!grabbed && unpickable == 0 && !ratgrabbed && other.state == states.ratmountattack)
{
    ratplayerid = other.id;
    ratgrabbed = 1;
    state = UnknownEnum.Value_207;
    other.ratgrabbedID = id;
    other.state = states.ratmount;
}
