instance_create(x, y, obj_slapstar);
instance_create(x, y, obj_slapstar);
instance_create(x, y, obj_slapstar);
instance_create(x, y, obj_bossdefeatflash);
obj_tv.message = "VICTORY!!!";
obj_tv.showtext = 1;
obj_tv.alarm[0] = 260;
obj_tv.tvsprite = spr_tvclap;
obj_tv.image_speed = 0.1;
obj_player1.image_index = 0;
obj_player1.x = 608;
obj_player1.hsp = 0;
obj_player1.y = 498;
obj_player1.sprite_index = spr_null;
obj_player1.state = states.bossintro;

if (reset == 0)
{
    instance_create(x, y, obj_bangeffect);
    
    if (stomped == 0 && shot == 0)
    {
        if (cigar == 1)
        {
            with (obj_camera)
            {
                shake_mag = 5;
                shake_mag_acc = 20 / room_speed;
            }
            
            with (instance_create(x, y, obj_baddieDead))
                sprite_index = spr_noisesatellitedead;
        }
        else
        {
            with (obj_camera)
            {
                shake_mag = 5;
                shake_mag_acc = 20 / room_speed;
            }
            
            with (instance_create(x, y, obj_baddieDead))
                sprite_index = spr_noisesatellitedead;
        }
    }
    
    if (stomped == 1 && shot == 0)
    {
        if (cigar == 1)
        {
            with (instance_create(x, y, obj_baddieDead))
            {
                sprite_index = spr_noisesatellitedead;
                
                with (obj_camera)
                {
                    shake_mag = 5;
                    shake_mag_acc = 20 / room_speed;
                }
                
                hsp = 0;
                vsp = 0;
                cigar = 1;
            }
        }
        else
        {
            with (instance_create(x, y, obj_baddieDead))
            {
                sprite_index = spr_noisesatellitedead;
                
                with (obj_camera)
                {
                    shake_mag = 5;
                    shake_mag_acc = 20 / room_speed;
                }
                
                hsp = 0;
                vsp = 0;
            }
        }
    }
    
    if (shot == 1 && stomped == 0)
    {
        if (cigar == 1)
        {
            with (instance_create(x, y, obj_baddieDead))
            {
                sprite_index = spr_noisesatellitedead;
                
                with (obj_camera)
                {
                    shake_mag = 20;
                    shake_mag_acc = 40 / room_speed;
                }
                
                hsp *= 3;
                vsp *= 3;
                cigar = 1;
            }
        }
        else
        {
            with (instance_create(x, y, obj_baddieDead))
            {
                sprite_index = spr_noisesatellitedead;
                
                with (obj_camera)
                {
                    shake_mag = 20;
                    shake_mag_acc = 40 / room_speed;
                }
                
                hsp *= 3;
                vsp *= 3;
            }
        }
    }
}
