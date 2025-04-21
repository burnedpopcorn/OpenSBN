if (fadein)
{
    fadealpha = approach(fadealpha, 1, 0.03);
    
    if (fadealpha >= 1)
    {
        if (!instance_exists(obj_player1))
        {
            instance_activate_object(obj_player1);
        }
        else
        {
            fadein = 0;
            pos_player = 0;
            obj_player1.targetRoom = obj_player1.backtohubroom;
            obj_player2.targetRoom = obj_player1.backtohubroom;
            room_goto(obj_player1.backtohubroom);
        }
    }
}
else
{
    if (!pos_player)
    {
        if (!instance_exists(obj_player1))
        {
            instance_activate_object(obj_player1);
        }
        else
        {
            pos_player = 1;
            obj_player1.x = obj_player1.backtohubstartx;
            obj_player1.y = obj_player1.backtohubstarty - (camera_get_view_height(view_camera[0]) * 2);
            obj_player1.state = states.backtohub;
            obj_player1.sprite_index = spr_playerN_slipbanan1;
            obj_player1.image_index = 10;
            
            if (obj_player1.targetRoom == rm_levelselect)
            {
                obj_player1.x = obj_doorA.x;
                obj_player1.y = obj_doorA.y;
                obj_player1.state = states.door;
                obj_player1.sprite_index = spr_null;
                obj_player1.landAnim = 0;
                obj_player1.facestompAnim = 1;
                obj_player1.backtohubbuffer = 0;
            }
        }
    }
    
    fadealpha = approach(fadealpha, 0, 0.03);
    
    if (fadealpha <= 0)
        instance_destroy();
}
