image_speed = 0.35;

if (active)
{
    if (sprite_index == spr_secretportal_close && !touched)
    {
        sprite_index = spr_secretportal_open;
        image_index = 0;
    }
    
    if (secret)
    {
        with (obj_tv)
        {
            if (expressionsprite == -4)
                tv_do_expression(spr_tv_exprsecret);
        }
    }
}

if (touched && sprite_index == spr_secretportal_close)
{
    with (playerid)
    {
        hsp = 0;
        vsp = 0;
        x = other.x;
        y = other.y;
        scale_xs = approach(scale_xs, 0, 0.05);
        scale_ys = approach(scale_ys, 0, 0.05);
        fallinganimation = 0;
        
        if (state == states.mach2 || state == states.mach3)
            state = states.normal;
    }
    
    with (obj_heatafterimage)
        visible = false;
}

if (floor(image_index) == (image_number - 1))
{
    switch (sprite_index)
    {
        case spr_secretportal_open:
            sprite_index = spr_secretportal_idle;
            break;
        
        case spr_secretportal_close:
            image_index = image_number - 1;
            
            if (touched)
            {
                if (!instance_exists(obj_fadeout))
                {
                    with (obj_player1)
                    {
                        lastTargetDoor = targetDoor;
                        targetDoor = "S";
                        
                        if (!other.secret)
                        {
                            lastroom = room;
                            targetRoom = other.targetRoom;
                            secretportalID = other.id;
                        }
                        else
                        {
                            targetRoom = lastroom;
                        }
                    }
                    
                    if (!secret)
                        ds_list_add(global.saveroom, id);
                    
                    instance_create(x, y, obj_fadeout);
                }
            }
            
            break;
    }
}
