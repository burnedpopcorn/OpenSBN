with (instance_create(room_width / 2, room_height / 2, obj_rank))
{
    ini_open_from_string(obj_savesystem.ini_str);
    
    for (var i = 0; i < array_length(toppin); i++)
    {
        if (global.newtoppin[i])
            toppin[i] = 1;
        else if (ini_read_real("Toppin", global.leveltosave + string(i + 1), 0))
            toppin[i] = 2;
        else
            toppin[i] = 0;
    }
    
    if (global.secretfollow)
    {
        if (global.leveltosave == "fish")
            toppinsecret = 2;
        else
            toppinsecret = 1;
    }
    
    ini_close();
}

if (instance_exists(obj_treasureviewer))
    exit;

obj_player1.visible = false;
obj_player2.visible = false;
