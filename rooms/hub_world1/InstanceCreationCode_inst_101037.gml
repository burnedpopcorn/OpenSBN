targetRoom = creditsroom;
var ms = quick_ini_read_real(get_savefile_ini(), "Highscore", "midway", 0);
var fs = quick_ini_read_real(get_savefile_ini(), "Highscore", "fish", 0);

if (!(ms > 0 && fs > 0))
    instance_destroy();
