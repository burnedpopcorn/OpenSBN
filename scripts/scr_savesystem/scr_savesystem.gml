function gamesave_async_load()
{
    with (obj_savesystem)
    {
        if (state == UnknownEnum.Value_0)
        {
            loadbuff = buffer_create(1, buffer_grow, 1);
            buffer_async_group_begin("saves");
            buffer_load_async(loadbuff, get_savefile_ini(), 0, -1);
            loadid = buffer_async_group_end();
            state = states.normal;
        }
    }
    
    exit;
}

function gamesave_async_save()
{
    with (obj_savesystem)
    {
        if (state == UnknownEnum.Value_0)
        {
            showicon = 1;
            icon_alpha = 3;
            buffer_async_group_begin("saves");
            savebuff = buffer_create(1, buffer_grow, 1);
            ini_open_from_string(ini_str);
            ini_write_real("Game", "percent", get_percentage());
            ini_write_real("Game", "minutes", global.file_minutes);
            ini_write_real("Game", "seconds", global.file_seconds);
            var closestring = ini_close();
            buffer_write(savebuff, buffer_string, closestring);
            buffer_save_async(savebuff, get_savefile_ini(), 0, buffer_get_size(savebuff));
            saveid = buffer_async_group_end();
            state = UnknownEnum.Value_1;
        }
    }
    
    exit;
}

function gamesave_async_save_options()
{
    with (obj_savesystem)
    {
        if (state == UnknownEnum.Value_0)
        {
            showicon = 1;
            icon_alpha = 3;
            buffer_async_group_begin("saves");
            savebuff = buffer_create(1, buffer_grow, 1);
            ini_open_from_string(ini_str_options);
            var closestring = ini_close();
            buffer_write(savebuff, buffer_string, closestring);
            buffer_save_async(savebuff, game_save_id + "saveData.ini", 0, buffer_get_size(savebuff));
            saveid = buffer_async_group_end();
            state = UnknownEnum.Value_1;
        }
    }
}
