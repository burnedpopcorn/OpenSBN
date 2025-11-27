event_inherited();

got_func = function()
{
    if (global.gasolinecutscene == noone || !global.gasolinecutscene)
    {
        global.gasolinecutscene = 1;
        quick_ini_write_real(get_savefile_ini(), "cutscene", "gasoline", 1);
    }
};

if (global.gasolinecutscene == noone)
    global.gasolinecutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "gasoline", 0);

if (global.gasolinecutscene)
    instance_destroy();

if (global.mansioncutscene == noone)
    global.mansioncutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "mansion", 0);

if (!global.mansioncutscene && !global.levelcomplete)
    instance_destroy();
