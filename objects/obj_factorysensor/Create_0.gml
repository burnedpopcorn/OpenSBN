closed = 0;
graffiti = 0;

if (global.factorygraffiti == noone)
    global.factorygraffiti = quick_ini_read_real(get_savefile_ini(), "cutscene", "factorygraffiti", 0);

if (global.graffiticutscene == noone)
    global.graffiticutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "graffiti", 0);

if (global.factorygraffiti)
    graffiti = 1;
