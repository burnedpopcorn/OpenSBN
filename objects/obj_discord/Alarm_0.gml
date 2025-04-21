if (ready)
{
    var hide = room == Realtitlescreen || room == rm_mainmenu || room == hub_world1 || room == hub_soundtest || room == rm_evilleafyishere || room == hub_entrancehall || room == hub_mansion || room == hub_secretdanceroom || room == hub_secretmidway || room == rank_room || room == rm_levelselect || room == timesuproom || room == hub_loadingscreen || (string_copy(room_get_name(room), 1, 5) == "hub" && !global.panic);
    event_user(0);
    var _state = state;
    var _smallimage = smallimage;
    
    if (hide)
    {
        _smallimage = "";
        largeimage = "biglogo";
        _state = "";
    }
    
    np_setpresence_more(smallimagetext, largeimagetext, false);
    np_setpresence(_state, details, largeimage, _smallimage);
}

alarm[0] = 60;
