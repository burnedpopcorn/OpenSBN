switch (state)
{
    case states.actor:
        x = camera_get_view_x(view_camera[0]) - 100;
        y = camera_get_view_y(view_camera[0]) - 100;
        var dx = 350;
        var dy = 400;
        var px = x;
        var py = y;
        
        with (obj_player1)
        {
            px = x;
            py = y;
        }
        
        if (global.panic && distance_to_pos(xstart, ystart, px, py, dx, dy))
        {
            state = states.bossintro;
            x = xstart;
            y = ystart;
            image_index = 0;
            visible = true;
            event_play_oneshot("event:/SFX/misc/evilteleport", x, y);
        }
        
        break;
    
    case states.bossintro:
        with (instance_place(x, y, obj_baddiecollisionbox))
        {
            instance_destroy(baddieID);
            instance_destroy();
        }
        
        state = states.normal;
        break;
    
    case states.normal:
        break;
}
