function scr_room_updated(argument0)
{
    if (argument0 == room || (room == live_blank_room && live_live_room == argument0))
    {
        with (obj_player1)
        {
            hallway = savedhallway;
            hallwaydirection = savedhallwaydirection;
            vhallwaydirection = savedvhallwaydirection;
            verticalhallway = savedverticalhallway;
        }
        
        room_goto_live(argument0);
    }
    
    exit;
}
