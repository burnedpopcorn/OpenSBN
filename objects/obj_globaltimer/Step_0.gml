var s = delta_time / 1000000;

if ((instance_exists(obj_pauseNew) && obj_pauseNew.state == pausestates.unpause) || global.option_timer_speedrun)
{
    if (room != rank_room && !instance_exists(obj_endlevelfade) && room != hub_loadingscreen)
    {
        global.file_seconds += s;
        
        if (global.file_seconds >= 60)
        {
            global.file_seconds = frac(global.file_seconds);
            global.file_minutes++;
        }
        
        global.level_seconds += s;
        
        if (global.level_seconds >= 60)
        {
            global.level_seconds = frac(global.level_seconds);
            global.level_minutes++;
        }
    }
}
