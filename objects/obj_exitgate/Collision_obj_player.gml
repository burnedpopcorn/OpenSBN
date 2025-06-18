if (image_index == 1 && global.panic == false && room != rm_missing)
{
    with (obj_player1)
    {
        if (state == states.comingoutdoor && floor(image_index) == (image_number - 2))
        {
            event_play_oneshot("event:/SFX/misc/gateclose", x, y);
            gamepad_vibrate_constant(1, 0.9);
            
            with (obj_player1)
            {
                if (room != hub_entrancehall)
                    global.leveltorestart = room;
                
                lastroom = room;
                sprite_index = spr_Timesup;
                image_index = 0;
                
                with (obj_camera)
                {
                    shake_mag = 0;
                    shake_mag_acc = 0 / room_speed;
                }
            }
            
            if (global.coop == true)
            {
                with (obj_player2)
                {
                    lastroom = room;
                    sprite_index = spr_Timesup;
                    image_index = 0;
                    
                    with (obj_camera)
                    {
                        shake_mag = 10;
                        shake_mag_acc = 30 / room_speed;
                    }
                }
            }
            
            other.image_index = 0;
            ds_list_add(global.saveroom, other.id);
        }
    }
}

if (drop && dropstate != states.idle)
    exit;

with (obj_player1)
{
    if (grounded && x > (other.x - 160) && x < (other.x + 160) && input_check("up") && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3) && (global.panic == true || global.snickchallenge == 1 || room == vir_1e))
    {
        var ex = x;
        var ey = y;
        var cx = camera_get_view_x(view_camera[0]);
        var cy = camera_get_view_y(view_camera[0]);
        rankpos_x = ex - cx;
        rankpos_y = ey - cy;
        targetDoor = "none";
        obj_camera.alarm[2] = -1;
        
        with (obj_garpo)
        {
            if (point_distance(x, y, obj_player1.x, obj_player1.y) < 500)
                mail_trigger(mailtriggers.closecallwithgrapo);
            
            visible = false;
            image_alpha = 0;
            savedx = x - cx;
            savedy = y - cy;
            x = -300;
            y = -300;
            instance_destroy();
        }
        
        obj_tv.visible = false;
        obj_tvzero.visible = false;
        obj_camera.visible = false;
        obj_chunktimer.visible = false;
        var roomname = room_get_name(room);
        var namestring = string_letters(roomname);
        scr_savescore(global.leveltosave);
        mail_trigger(mailtriggers.enteredalevel);
        
        if (global.combo > 0)
        {
            global.combotime = 0;
            global.combo = 0;
            obj_camera.alarm[4] = -1;
            
            for (var i = 0; i < global.comboscore; i += 10)
                create_collect(obj_player1.x + irandom_range(-60, 60), (obj_player1.y - 100) + irandom_range(-60, 60), choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect), 10);
            
            global.comboscore = 0;
        }
        
        if (!instance_exists(obj_endlevelfade))
        {
            with (instance_create(x, y, obj_endlevelfade))
                obj_player1.depth = depth - 1;
        }
        
        obj_player1.state = states.door;
        obj_player1.sprite_index = obj_player1.spr_lookdoor;
        
        if (instance_exists(obj_player2))
        {
            obj_player2.state = states.door;
            obj_player2.sprite_index = obj_player2.spr_lookdoor;
            
            if (global.coop)
                obj_player2.visible = true;
        }
        
        obj_endlevelfade.alarm[0] = 235;
        image_index = 0;
        global.panic = false;
        global.snickchallenge = 0;
        gamesave_async_save();
    }
}
