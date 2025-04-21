if (level != -4)
{
    ini_open_from_string(obj_savesystem.ini_str);
    found = ini_read_real("Treasure", level, false);
    ini_close();
    
    if (found)
    {
        var clocheoffset = 2;
        instance_create(x + clocheoffset, y + (3 * yoff), obj_treasurecloche);
    }
}
