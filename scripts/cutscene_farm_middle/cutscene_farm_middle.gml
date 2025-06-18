function cutscene_farm_middle()
{
    var _finish = false;
    
    with (obj_mort_inline)
    {
        sprite_index = spr_mortwalk;
        x += (dir * 5);
        
        if (!point_in_camera(x, y, view_camera[0]))
            _finish = true;
    }
    
    if (!instance_exists(obj_mort_inline))
        _finish = true;
    
    if (_finish)
        cutscene_end_action();
}

function cutscene_farm_end()
{
    with (obj_player1)
    {
        state = states.normal;
        x = backtohubstartx;
        y = backtohubstarty;
    }
    
    global.levelcomplete = 0;
    global.farmcutscene = 1;
    global.levelcompletename = -4;
    quick_ini_write_real(get_savefile_ini(), "cutscene", "farm", 1);
    cutscene_end_action();
}
