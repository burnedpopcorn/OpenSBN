function state_player_Sjumpprep()
{
    switch (character)
    {
        case "P":
            if (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft)
                move = input_check("right") - input_check("left");
            else
                move = xscale;
            
            if (!place_meeting(x, y + 1, obj_railparent))
            {
                hsp = move * movespeed;
            }
            else
            {
                var _railinst = instance_place(x, y + 1, obj_railparent);
                hsp = (move * movespeed) + (_railinst.movespeed * _railinst.dir);
            }
            
            if (sprite_index == spr_superjumpprep && movespeed > 0)
                movespeed -= (1 * getRPGMulti("movespeed"));
            
            if (floor(image_index) == (image_number - 1) && sprite_index == spr_superjumpprep)
                sprite_index = spr_superjumppreplight;
            
            if (sprite_index == spr_superjumppreplight)
                movespeed = 2 * getRPGMulti("movespeed");
            
            if (sprite_index != spr_superjumpprep)
            {
                if (move != 0 && (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft))
                {
                    if (xscale == 1)
                    {
                        if (input_check("right"))
                            sprite_index = spr_superjumpright;
                        
                        if (input_check("left"))
                            sprite_index = spr_superjumpleft;
                    }
                    
                    if (xscale == -1)
                    {
                        if (input_check("right"))
                            sprite_index = spr_superjumpleft;
                        
                        if (input_check("left"))
                            sprite_index = spr_superjumpright;
                    }
                }
                else
                {
                    sprite_index = spr_superjumppreplight;
                }
            }
            
            if (!scr_checksuperjump() && grounded && (character == "S" || sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpleft || sprite_index == spr_superjumpright) && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
            {
                instance_create(x, y, obj_explosioneffect);
                sprite_index = spr_superjump;
                state = states.Sjump;
                vsp = -17 * getRPGMulti("jump");
                image_index = 0;
            }
            
            image_speed = 0.35;
            break;
        
        case "N":
            hsp = 0;
            vsp = 0;
            pogochargeactive = 0;
            pogocharge = 50;
            
            if (floor(image_index) == (image_number - 1))
            {
                if (sprite_index == spr_null)
                {
                    if (pizzapepper == 0)
                    {
                        state = states.mach3;
                        sprite_index = spr_playerN_jetpackboost;
                        instance_create(x, y, obj_jumpdust);
                        movespeed = 15;
                    }
                    else
                    {
                        state = states.mach3;
                        sprite_index = spr_crazyrun;
                        instance_create(x, y, obj_jumpdust);
                        movespeed = 21;
                    }
                }
                else if (sprite_index == spr_superjumpprep)
                {
                    instance_create(x, y, obj_explosioneffect);
                    sprite_index = spr_superjump;
                    state = states.Sjump;
                    vsp = -15 * getRPGMulti("jump");
                }
            }
            
            if (sprite_index == spr_null)
                image_speed = 0.5;
            else
                image_speed = 0.3;
            
            break;
    }
    
    exit;
}
