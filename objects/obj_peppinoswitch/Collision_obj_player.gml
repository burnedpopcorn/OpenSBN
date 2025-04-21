if (global.switchbuffer == 0)
{
    with (other)
    {
        x = obj_gustavoswitch.x;
        y = obj_gustavoswitch.y;
        hsp = 0;
        vsp = 0;
        visible = false;
        state = states.actor;
    }
    
    create_particle(x, y, particle.genericpoofeffect);
    sprite_index = spr_null;
    playerid = other.id;
    global.switchbuffer = 200;
    
    with (obj_gustavoswitch)
    {
        sprite_index = spr_null;
        image_index = 0;
    }
}
