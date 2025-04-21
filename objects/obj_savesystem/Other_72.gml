var ident = ds_map_find_value(async_load, "id");
var status = ds_map_find_value(async_load, "status");
var error = ds_map_find_value(async_load, "error");

switch (state)
{
    case UnknownEnum.Value_1:
        if (ident == saveid)
        {
            buffer_delete(savebuff);
            trace("Save status: ", status, ", error: ", error);
            state = UnknownEnum.Value_0;
        }
        
        break;
    
    case states.normal:
        if (ident == loadid)
        {
            var buffstring = buffer_read(loadbuff, buffer_string);
            ini_open_from_string(buffstring);
            ini_str = ini_close();
            buffer_delete(loadbuff);
            trace("inistr: ", ini_str);
            trace("buffstring: ", buffstring);
            state = UnknownEnum.Value_0;
            
            if (room == rm_mainmenu && obj_mainmenu.state == states.revolver)
                event_user(0);
        }
        
        break;
}
