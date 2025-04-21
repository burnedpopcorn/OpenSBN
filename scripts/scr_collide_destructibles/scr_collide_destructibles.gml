function scr_collide_destructibles()
{
    with (obj_player1)
    {
        if ((state == states.jump && sprite_index == spr_null) || state == states.chainsawpogo || state == states.slipbanan || state == states.rideweenie || state == states.trickjump || state == states.fishdash || state == states.ratmountbounce || (state == states.pogo && pogochargeactive == 1))
        {
            var arr = [[xscale, 0], [hsp + xscale, 0], [0, vsp + 1], [0, vsp - 1], [0, 1], [0, -1]];
            
            for (var i = 0; i < array_length(arr); i++)
            {
                var b = arr[i];
                scr_destroy_destructibles(b[0], b[1]);
            }
        }
        
        if (state == states.tumble)
        {
            with (instance_place(x + xscale, y, obj_rollblock))
                instance_destroy();
        }
        
        if (state == states.ratmountattack && place_meeting(x + hsp, y, obj_gustavodestroyable))
        {
            with (instance_place(x + hsp, y, obj_gustavodestroyable))
            {
                gamepad_vibrate_constant(0.8, 0.5);
                instance_destroy();
            }
        }
        
        if (state == states.trashroll || state == states.boxxedpepspin || ratmount_movespeed == 12 || state == states.crouchslide || state == states.machroll || state == states.mach2 || state == states.punch || state == states.ratmountpunch || state == states.ratmounttumble || state == states.punch || state == states.handstandjump || state == states.ratmountattack || state == states.lungeattack || state == states.cheeseball || state == states.bombpepside || state == states.rocket || state == states.shotgundash || state == states.faceplant || state == states.slipnslide || state == states.tacklecharge || sprite_index == spr_barrelroll || state == states.chainsawbump || state == states.mach3 || state == states.knightpep || state == states.machroll || state == states.knightpepslopes || state == states.knightpepattack || state == states.tumble || state == states.hookshot || state == states.shoulderbash)
        {
            if (place_meeting(x + hsp, y, obj_destructibles))
            {
                with (instance_place(x + hsp, y, obj_destructibles))
                {
                    gamepad_vibrate_constant(0.8, 0.5);
                    instance_destroy();
                }
                
                if (state == states.mach2)
                    machpunchAnim = 0;
            }
        }
        
        if (state == states.hurt && thrown == true)
        {
            if (place_meeting(x - hsp, y, obj_destructibles))
            {
                with (instance_place(x - hsp, y, obj_destructibles))
                {
                    gamepad_vibrate_constant(0.8, 0.5);
                    instance_destroy();
                }
            }
        }
        
        if ((state == states.knightpep || state == states.jetpackjump || state == states.firemouth || state == states.slipbanan || state == states.superslam || state == states.hookshot || (state == states.bombpepup && bombup_dir == 1)) && vsp > 0)
        {
            if (place_meeting(x, y + 1, obj_destructibles))
            {
                with (instance_place(x, y + 1, obj_destructibles))
                {
                    gamepad_vibrate_constant(0.8, 0.5);
                    instance_destroy();
                }
                
                if (state == states.firemouth || state == states.jetpackjump)
                {
                    with (instance_place(x, y + 1, obj_tntblock))
                    {
                        gamepad_vibrate_constant(0.8, 0.5);
                        instance_destroy();
                    }
                    
                    if (vsp > -11)
                        vsp = -11;
                    
                    jumpstop = 0;
                }
            }
        }
        
        var num = instance_place_list(x, y + 1, obj_destructibleplatform, global.instancelist, 0);
        
        for (var k = 0; k < num; k++)
        {
            with (ds_list_find_value(global.instancelist, k))
            {
                falling = 1;
                
                if (falling == 1)
                    image_speed = 0.35;
            }
        }
        
        ds_list_clear(global.instancelist);
        
        if (vsp <= 0.5 && (state == states.jump || state == states.ratmountjump || state == states.mach3 || state == states.mach2 || state == states.antigrav || state == states.pogo || (state == states.bombpepup && bombup_dir == -1) || state == states.punch || state == states.climbwall || state == states.fireass || state == states.Sjump || state == states.cheeseballclimbwall || state == states.mach3 || (state == states.punch && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend))))
        {
            var vy = -1;
            
            if (place_meeting(x, y + vy, obj_destructibles))
            {
                with (instance_place(x, y + vy, obj_destructibles))
                {
                    gamepad_vibrate_constant(1, 0.5);
                    instance_destroy();
                    
                    with (other)
                    {
                        if (state != states.Sjump && state != states.punch && state != states.climbwall)
                            vsp = 0;
                        
                        if (state == states.Sjump)
                            vsp = -11;
                    }
                }
            }
        }
        
        if (vsp >= 0 && (state == states.freefall || state == states.superslam || state == states.freefallland || state == states.ratmountgroundpound || (state == states.ratmountbounce && vsp >= 0) || (state == states.slipbanan && vsp >= 10)))
        {
            scr_destroy_destructibles(0, vsp + 2);
            scr_destroy_destructibles(0, vsp);
            scr_destroy_destructibles(0, 2);
            scr_destroy_destructibles(0, 1);
        }
        
        if (state == states.freefall || state == states.superslam || state == states.freefallland || state == states.slipbanan)
        {
            if (freefallsmash >= 10 || state == states.slipbanan)
            {
                scr_destroy_destructibles(0, vsp + 2, obj_metalblock);
                scr_destroy_destructibles(0, vsp, obj_metalblock);
                scr_destroy_destructibles(0, 2, obj_metalblock);
                scr_destroy_destructibles(0, 1, obj_metalblock);
            }
        }
    }
}
