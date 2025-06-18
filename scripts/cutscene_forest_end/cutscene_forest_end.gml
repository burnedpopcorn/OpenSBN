function cutscene_forest_end()
{
    with (obj_player1)
    {
        state = states.normal;
        x = backtohubstartx;
        y = backtohubstarty;
    }
    
    global.levelcomplete = 0;
    global.forestcutscene = 1;
    global.levelcompletename = -4;
    quick_ini_write_real(get_savefile_ini(), "cutscene", "forest", 1);
    cutscene_end_action();
}

function cutscene_beach_end()
{
    with (obj_player1)
    {
        state = states.normal;
        x = backtohubstartx;
        y = backtohubstarty;
    }
    
    global.levelcomplete = 0;
    global.beachcutscene = 1;
    global.levelcompletename = -4;
    quick_ini_write_real(get_savefile_ini(), "cutscene", "beach", 1);
    cutscene_end_action();
}

function cutscene_sewer_end()
{
    with (obj_player1)
    {
        state = states.normal;
        x = backtohubstartx;
        y = backtohubstarty;
    }
    
    global.levelcomplete = 0;
    global.sewercutscene = 1;
    global.levelcompletename = -4;
    quick_ini_write_real(get_savefile_ini(), "cutscene", "sewer", 1);
    cutscene_end_action();
}
