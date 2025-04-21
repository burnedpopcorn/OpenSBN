var cx = camera_get_view_x(view_camera[0]);

switch (state)
{
    case states.walk:
        if (playerid.x != x)
            image_xscale = sign(playerid.x - x);
        
        currentx = approach(currentx, targetx, 2);
        x = cx + currentx;
        
        if (currentx == targetx)
        {
            state = UnknownEnum.Value_130;
            attack_buffer = attack_max;
        }
        
        y = approach(y, playerid.y, 8);
        break;
    
    case UnknownEnum.Value_130:
        if (playerid.x != x)
            image_xscale = sign(playerid.x - x);
        
        y = approach(y, playerid.y, 8);
        x = cx + currentx;
        
        if (attack_buffer > 0)
        {
            attack_buffer--;
        }
        else
        {
            state = states.punch;
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
        }
        
        break;
    
    case states.punch:
        if (!hitboxcreate)
        {
            with (instance_create(x, y, obj_tackhitbox))
            {
                ID = other.id;
                other.hitboxcreate = 1;
            }
        }
        
        x += (image_xscale * 14);
        break;
}
