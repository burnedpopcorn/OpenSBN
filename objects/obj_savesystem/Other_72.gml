var ident = ds_map_find_value(async_load, "id");
var status = ds_map_find_value(async_load, "status");
var error = ds_map_find_value(async_load, "error");

switch (state)
{
    case savestate.saving:
        if (ident == saveid)
        {
            buffer_delete(savebuff);
            trace("Save status: ", status, ", error: ", error);
            state = savestate.idle;
        }
        
        break;
    
    case savestate.loading:
        if (ident == loadid)
        {
            var buffstring = buffer_read(loadbuff, buffer_string);
            ini_open_from_string(buffstring);
            ini_str = ini_close();
            buffer_delete(loadbuff);
            trace("inistr: ", ini_str);
            trace("buffstring: ", buffstring);
            state = savestate.idle;
            
            if (room == rm_mainmenu && obj_mainmenu.state == menuselected.loadsave)
                event_user(0);
        }
        
        break;
}
