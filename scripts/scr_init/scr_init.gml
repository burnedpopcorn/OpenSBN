randomize();
global.ControlPrompt = "";
global.TransfoPrompt = "";
global.DebugMode = false;

for (var i = 0; i < parameter_count(); i++)
{
    if (string_letters(parameter_string(i)) == "debug")
        global.DebugMode = true;
}

global.bigfont = __scribble_font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.:!0123456789?'", true, 0);
global.grannyfont = __scribble_font_add_sprite_ext(spr_font_granny, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!?,.:-_'`¬()", true, 1);
global.tutorialfont = __scribble_font_add_sprite_ext(spr_tutorialfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!,.:1234567890", true, 0);
global.collectfont = __scribble_font_add_sprite_ext(spr_font_collect, "0123456789", true, 0);
global.combofont = __scribble_font_add_sprite_ext(spr_null, "0123456789/:", true, 0);
global.combofont2 = __scribble_font_add_sprite_ext(spr_font_combobubble, "1234567890", true, 0);
global.timerfont = __scribble_font_add_sprite_ext(spr_font_timer, "1234567890:.", true, 0);
global.smallnumber_fnt = __scribble_font_add_sprite_ext(spr_smallnumber, "1234567890-", true, 0);
global.escapetimerfont = __scribble_font_add_sprite_ext(spr_font_escapetimer, "1234567890:", true, 0);
global.transfopromptfont = __scribble_font_add_sprite_ext(spr_transfopromptfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!?',.:-()1234567890", true, 0);
global.menuperfont = __scribble_font_add_sprite_ext(spr_percentfont, "1234567890.F", true, -1);

function scr_init_options()
{
    ini_open("saveData.ini");
    global.option_fullscreen = ini_read_real("Option", "fullscreen", 1);
    global.option_resolution = ini_read_real("Option", "resolution", 1);
    global.option_aspect_ratio = ini_read_real("Option", "aspect_ratio", 0);
    global.option_texfilter = ini_read_real("Option", "texfilter", 1);
    global.option_focusmute = ini_read_real("Option", "focusmute", 1);
    global.option_master_volume = ini_read_real("Option", "master_volume", 1);
    global.option_music_volume = ini_read_real("Option", "music_volume", 1);
    global.option_sfx_volume = ini_read_real("Option", "sfx_volume", 1);
    global.option_vibration = ini_read_real("Option", "vibration", 1);
    global.option_vsync = ini_read_real("Option", "vsync", 0);
    global.option_screenshake = ini_read_real("Option", "screenshake", 1);
    global.option_timer = ini_read_real("Option", "timer", 1);
    global.option_timer_type = ini_read_real("Option", "timer_type", 0);
    global.option_timer_speedrun = ini_read_real("Option", "timer_speedrun", 0);
    global.option_hud = ini_read_real("Option", "hud", 1);
    global.option_sjump_key = ini_read_real("Option", "sjumpkey", 0);
    global.option_sjump_gp = ini_read_real("Option", "sjumpgp", 0);
    global.option_groundpound_key = ini_read_real("Option", "groundpoundkey", 0);
    global.option_groundpound_gp = ini_read_real("Option", "groundpoundgp", 0);
    global.hasFINALLYSUPERTAUNTED = false;
    global.option_secret_greenifier = ini_read_real("Option", "secret_greenifier", 0);
    global.option_secret_cathud = ini_read_real("Option", "secret_cathud", 0);
    global.option_secret_realistic = ini_read_real("Option", "secret_realistic", 0);
    global.option_secret_rpg = ini_read_real("Option", "secret_rpg", 0);
    global.option_secret_auto = ini_read_real("Option", "secret_auto", 0);
    ini_close();
    display_reset(0, global.option_vsync);
}

function scr_init()
{
    global.coop = false;
    global.currentsavefile = 1;
    global.mach_color1 = make_colour_rgb(255, 132, 231);
    global.mach_color2 = make_colour_rgb(237, 255, 132);
    global.afterimage_color1 = make_colour_rgb(255, 0, 0);
    global.afterimage_color2 = make_colour_rgb(0, 255, 0);
    global.smallnumber_color1 = make_colour_rgb(255, 255, 255);
    global.smallnumber_color2 = make_colour_rgb(248, 0, 0);
    global.optimize = 0;
    global.autotile = 1;
    global.pigreduction = 0;
    global.pigtotal = 0;
    global.levelcomplete = 0;
    global.levelcompletename = -4;
    global.midwaytreasure = 0;
    global.watertreasure = 0;
    global.newtoppin[0] = 0;
    global.newtoppin[1] = 0;
    global.newtoppin[2] = 0;
    global.newtoppin[3] = 0;
    global.newtoppin[4] = 0;
    global.loadeditor = 0;
    pal_swap_init_system(shd_pal_swapper);
    gamesave_async_load();
    global.rank = "none";
    global.lastrank = "none";
    global.throwarc = 1;
    global.hidetiles = 0;
    global.leveltosave = -4;
    global.leveltorestart = -4;
    global.combodropped = 0;
    global.tauntcount = 0;
    global.RedCoinMax = 600;
    global.saveroom = ds_list_create();
    global.escaperoom = ds_list_create();
    global.lap = 0;
    global.timeattack = 0;
    global.laps = 0;
    global.playerhealth = 100;
    global.instancelist = ds_list_create();
    global.followerlist = ds_list_create();
    global.maxrailspeed = 2;
    global.railspeed = global.maxrailspeed;
    global.levelreset = 0;
    global.temperature = 0;
    global.temperature_spd = 0.01;
    global.temp_thresholdnumber = 5;
    global.use_temperature = 0;
    global.timedgatetimer = 0;
    global.timedgatetime = 0;
    global.key_inv = 0;
    global.shroomfollow = 0;
    global.cheesefollow = 0;
    global.tomatofollow = 0;
    global.sausagefollow = 0;
    global.pineapplefollow = 0;
    global.secretfollow = 0;
    global.pepanimatronic = 0;
    global.keyget = 0;
    global.collect = 0;
    global.collectN = 0;
    global.treasure = 0;
    global.combo = 0;
    global.previouscombo = 0;
    global.combotime = 0;
    global.comboscore = 0;
    global.combotimepause = 0;
    global.savedcomboscore = 0;
    global.savedcombo = 0;
    global.heattime = 0;
    global.pizzacoin = 0;
    global.toppintotal = 1;
    global.hit = 0;
    global.baddieroom = ds_list_create();
    global.hp = 2;
    global.gotshotgun = 0;
    global.showgnomelist = 1;
    global.panic = false;
    global.snickchallenge = 0;
    global.golfhit = 0;
    global.oiled = false;
    global.marinatecount = 0;
    global.grinds = 0;
    global.redcoincount = 0;
    global.twoliterpain = false;
    set_option_params();
    
    if (global.option_secret_cathud)
        instance_create(0, 0, obj_cathud);
    
    if (global.option_secret_greenifier)
        instance_create(0, 0, obj_greenifier);
    
    instance_create(0, 0, obj_discord);
    
    if (global.DebugMode)
    {
        instance_create(0, 0, obj_shell, 
        {
            closeFunction: scr_shell_closeconsole,
            openFunction: scr_shell_openconsole,
            openKey: 117,
            screenAnchorPointV: "top",
            prompt: "how bo ",
            saveHistory: true,
            savedHistoryMaxSize: 50
        });
    }
    
    global.style = -1;
    global.secretfound = 0;
    global.shotgunammo = 0;
    global.monsterspeed = 0;
    global.monsterlives = 3;
    global.giantkey = 0;
    global.coop = false;
    global.baddiespeed = 1;
    global.baddiepowerup = 0;
    global.baddierage = 0;
    global.style = 0;
    global.stylethreshold = 0;
    global.pizzadelivery = 0;
    global.failcutscene = 0;
    global.pizzasdelivered = 0;
    global.spaceblockswitch = 1;
    global.gerome = 0;
    global.bullet = 0;
    global.fuel = 3;
    global.font_console = font0;
    global.ammorefill = 0;
    global.ammoalt = 1;
    global.mort = 0;
    global.stylelock = 0;
    global.attackstyle = 0;
    global.pummeltest = 1;
    global.doubleenem = 0;
    global.shithud = 0;
    global.showing_collisions = 0;
    global.performance_mode = 0;
    global.horse = 0;
    global.checkpoint_room = -4;
    global.checkpoint_door = "A";
    global.kungfu = 0;
    global.graffiticount = 0;
    global.graffitimax = 20;
    global.noisejetpack = 0;
    global.hasfarmer = array_create(3, 0);
    global.savedattackstyle = -4;
    global.bobby_x = -100;
    global.bobby_y = -100;
    global.bobbydead = false;
}

function scr_init_saveData()
{
    ini_open_from_string(obj_savesystem.ini_str);
    global.file_minutes = ini_read_real("Game", "minutes", 0);
    global.file_seconds = ini_read_real("Game", "seconds", 0);
    global.bobby_x = ini_read_real("Game", "bobbyX", -100);
    global.bobby_y = ini_read_real("Game", "bobbyY", -100);
    global.bobbydead = global.bobby_x != -100 || global.bobby_y != -100;
    ini_close();
    global.speakerbox = [false, false];
    scr_initMail();
}
