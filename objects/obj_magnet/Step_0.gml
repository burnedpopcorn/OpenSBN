image_speed = 0.35;

switch (state)
{
    case states.normal:
        sprite_index = spr_sirnose_idle;
        
        if (cooldown > 0)
        {
            cooldown--;
        }
        else
        {
            with (obj_pizzaball)
            {
                if (state != states.golf && distance_to_pos(x, y, other.x, other.y, 200, 150))
                {
                    state = UnknownEnum.Value_266;
                    other.state = UnknownEnum.Value_266;
                    other.hsp = hsp;
                    other.vsp = vsp;
                    other.ballID = id;
                }
            }
        }
        
        break;
    
    case UnknownEnum.Value_266:
        with (ballID)
        {
            depth = 0;
            sprite_index = spr_pizzaball_roll;
            sit = 0;
            x = approach(x, other.x, 8);
            y = approach(y, other.y, 8);
            
            if (state != states.golf)
            {
                other.hsp = approach(hsp, 0, 1);
                other.vsp = approach(vsp, 0, 1);
            }
            else
            {
                sprite_index = spr_pizzaball_stun;
            }
            
            hsp = other.hsp;
            vsp = other.vsp;
            
            if (state != UnknownEnum.Value_266 && state != states.golf)
            {
                other.state = states.normal;
                other.cooldown = 200;
            }
            
            if (x != other.x || y != other.y)
            {
                if (x != other.x)
                    other.image_xscale = sign(other.x - x);
                
                other.sprite_index = spr_sirnose_suck;
            }
            else
            {
                other.sprite_index = spr_sirnose_idle;
            }
        }
        
        break;
}
