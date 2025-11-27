destroy = 0;

if (global.factoryblock == noone)
    global.factoryblock = quick_ini_read_real(get_savefile_ini(), "cutscene", "factoryblock", 0);

if (global.factoryblock)
{
    destroy = 0;
    instance_destroy();
}
