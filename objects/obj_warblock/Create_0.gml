destroy = 0;

if (global.warcutscene == noone)
    global.warcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "war", 0);

if (global.warcutscene)
{
    destroy = 0;
    instance_destroy();
}
