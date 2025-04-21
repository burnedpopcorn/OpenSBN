menuarr = [];
var option_backto_base = new optionRedirect("BACK", UnknownEnum.Value_0);

option_backto_base.onActivate = function()
{
    with (obj_optionNew)
    {
        if (menuprev <= UnknownEnum.Value_4)
            selected = clamp(menuprev - 1, 0, UnknownEnum.Value_4);
    }
};

var option_backto_controls = new optionRedirect("BACK", UnknownEnum.Value_4);
var option_backto_gamepad = new optionRedirect("BACK", UnknownEnum.Value_6);
var menu_base = new optionMenu(UnknownEnum.Value_0, bg_options_general, true);
menu_base.ypad = 48;
menu_base.xpad = 0;
var option_goto_audio = new optionRedirect("AUDIO", UnknownEnum.Value_1, [spr_optionIcon, 0]);
var option_goto_video = new optionRedirect("VIDEO", UnknownEnum.Value_2, [spr_optionIcon, 1]);
var option_goto_game = new optionRedirect("GAME", UnknownEnum.Value_3, [spr_optionIcon, 2]);
var option_goto_controls = new optionRedirect("CONTROLS", UnknownEnum.Value_4, [spr_optionIcon, 3]);
menu_base.addOption(option_goto_audio, option_goto_video, option_goto_game, option_goto_controls);
array_push(menuarr, menu_base);
var menu_audio = new optionMenu(UnknownEnum.Value_1, bg_options_sound);
menu_audio.ypad = 70;
var option_volume_master = new optionSlide("Master Volume", "option_master_volume", "master_volume", 100, "event:/SFX/ui/slidermaster");
var option_volume_music = new optionSlide("Music Volume", "option_music_volume", "music_volume", 100, "event:/SFX/ui/slidermusic");
var option_volume_sfx = new optionSlide("SFX Volume", "option_sfx_volume", "sfx_volume", 100, "event:/SFX/ui/slidersfx");
var option_focusmute = new optionToggle("UNFOCUS MUTE", "option_focusmute", "focusmute");
menu_audio.addOption(option_backto_base, option_volume_master, option_volume_music, option_volume_sfx, option_focusmute);
array_push(menuarr, menu_audio);
var menu_video = new optionMenu(UnknownEnum.Value_2, bg_options_video);
var option_window_fullscreen = new optionMultiple("FULLSCREEN", "option_fullscreen", "fullscreen", ["OFF", "ON", "BORDERLESS"]);

option_window_fullscreen.onActivate = function()
{
    with (obj_gameFrame)
        alarm[2] = 1;
};

var res_string = [["480x270", "960x540", "1024x576", "1280x720", "1600x900", "1920x1080"], ["640x480", "800x600", "1024x768", "1152x864", "1440x1080"]];
var option_window_resolution = new optionMultiple("RESOLUTION", "option_resolution", "resolution", res_string[global.option_aspect_ratio]);

option_window_resolution.onActivate = function()
{
    var resolution = global.resolutions[global.option_aspect_ratio][global.option_resolution];
    obj_gameFrame.alarm[0] = 1;
    window_center();
};

var option_window_aspectRatio = new optionMultiple("ASPECT RATIO", "option_aspect_ratio", "aspect_ratio", ["16:9", "4:3"]);

option_window_aspectRatio.onActivate = function()
{
    obj_gameFrame.alarm[0] = 1;
    global.option_resolution = 1;
    ini_open_from_string(obj_savesystem.ini_str_options);
    ini_write_real("Option", "resolution", 1);
    obj_savesystem.ini_str_options = ini_close();
    
    with (obj_optionNew)
        event_user(0);
    
    window_center();
};

var option_window_vsync = new optionToggle("VSYNC", "option_vsync", "vsync");

option_window_vsync.onActivate = function()
{
    display_reset(0, global.option_vsync);
};

var option_window_texfilter = new optionToggle("TEXTURE FILTERING", "option_texfilter", "texfilter");
var option_window_showhud = new optionToggle("SHOW HUD", "option_hud", "hud");
menu_video.addOption(option_backto_base, option_window_fullscreen, option_window_resolution, option_window_vsync, option_window_texfilter, option_window_showhud);
array_push(menuarr, menu_video);
var menu_game = new optionMenu(UnknownEnum.Value_3, bg_options_timer);
var option_game_screenshake = new optionToggle("SCREEN SHAKE", "option_screenshake", "screenshake");
var option_game_timer = new optionToggle("DISPLAY TIMER", "option_timer", "timer");
var option_game_timertype = new optionMultiple("TIMER TYPE", "option_timer_type", "timer_type", ["PER LEVEL", "PER SAVE", "BOTH"]);
var option_game_timer_speedrun = new optionToggle("SPEEDRUN TIMER", "option_timer_speedrun", "timer_speedrun");
menu_game.addOption(option_backto_base, option_game_screenshake, option_game_timer, option_game_timertype, option_game_timer_speedrun);
array_push(menuarr, menu_game);
var menu_controls = new optionMenu(UnknownEnum.Value_4, bg_options_controls);
var option_goto_keyboard = new optionRedirect("KEYBOARD", UnknownEnum.Value_5);
var option_goto_gamepad = new optionRedirect("CONTROLLER", UnknownEnum.Value_6);
menu_controls.addOption(option_backto_base, option_goto_keyboard, option_goto_gamepad);
array_push(menuarr, menu_controls);
var menu_keyboard = new optionMenu(UnknownEnum.Value_5, bg_options_controls);
var option_keyboard_bindings = new optionPress("BINDINGS");

option_keyboard_bindings.onActivate = function()
{
    if (!instance_exists(obj_option_keyconfig))
    {
        with (instance_create(x, y, obj_option_keyconfig))
            gamepad = false;
    }
};

var option_keyboard_superjump = new optionToggle("SUPERJUMP KEY", "option_sjump_key", "sjumpkey");
var option_keyboard_groundpound = new optionToggle("GROUNDPOUND KEY", "option_groundpound_key", "groundpoundkey");
menu_keyboard.addOption(option_backto_controls, option_keyboard_bindings, option_keyboard_superjump, option_keyboard_groundpound);
array_push(menuarr, menu_keyboard);
var menu_gamepad = new optionMenu(UnknownEnum.Value_6, bg_options_controls);
var option_gamepad_bindings = new optionPress("BINDINGS");

option_gamepad_bindings.onActivate = function()
{
    if (!instance_exists(obj_option_keyconfig))
    {
        with (instance_create(x, y, obj_option_keyconfig))
            gamepad = true;
    }
};

var option_goto_deadzone = new optionRedirect("DEADZONES", UnknownEnum.Value_7);
var option_gamepad_superjump = new optionToggle("SUPERJUMP BUTTON", "option_sjump_gp", "sjumpgp");
var option_gamepad_groundpound = new optionToggle("GROUNDPOUND BUTTON", "option_groundpound_gp", "groundpoundgp");
menu_gamepad.addOption(option_backto_controls, option_gamepad_bindings, option_goto_deadzone, option_gamepad_superjump, option_gamepad_groundpound);
array_push(menuarr, menu_gamepad);
var menu_deadzone = new optionMenu(UnknownEnum.Value_7, bg_options_controls);
menu_deadzone.ypad = 64;
var option_deadzone_master = new optionSlide("GENERAL", "deadzones", "deadzoneMaster", 100, undefined, true, UnknownEnum.Value_0);
option_deadzone_master.value_max = 99;
option_deadzone_master.value_min = 1;
var option_deadzone_horizontal = new optionSlide("HORIZONTAL", "deadzones", "deadzoneHorizontal", 100, undefined, true, UnknownEnum.Value_2);
option_deadzone_horizontal.value_max = 99;
option_deadzone_horizontal.value_min = 1;
var option_deadzone_vertical = new optionSlide("VERTICAL", "deadzones", "deadzoneVertical", 100, undefined, true, UnknownEnum.Value_1);
option_deadzone_vertical.value_max = 99;
option_deadzone_vertical.value_min = 1;
var option_deadzone_press = new optionSlide("PRESS", "deadzones", "deadzonePress", 100, undefined, true, UnknownEnum.Value_3);
option_deadzone_press.value_max = 99;
option_deadzone_press.value_min = 1;
var option_deadzone_sjump = new optionSlide("SUPERJUMP", "deadzones", "deadzoneSJump", 100, undefined, true, UnknownEnum.Value_4);
option_deadzone_sjump.value_max = 99;
option_deadzone_sjump.value_min = 1;
var option_deadzone_crouch = new optionSlide("CROUCHWALK", "deadzones", "deadzoneCrouch", 100, undefined, true, UnknownEnum.Value_5);
option_deadzone_crouch.value_max = 99;
option_deadzone_crouch.value_min = 1;
menu_deadzone.addOption(option_backto_gamepad, option_deadzone_master, option_deadzone_horizontal, option_deadzone_vertical, option_deadzone_press, option_deadzone_sjump, option_deadzone_crouch);
array_push(menuarr, menu_deadzone);
var menu_secret = new optionMenu(UnknownEnum.Value_8, bg_options_secret);
var option_toggle_cathud = new optionToggle("CAT HUD", "option_secret_cathud", "secret_cathud");

option_toggle_cathud.onActivate = function()
{
    if (global.option_secret_cathud)
    {
        instance_create(0, 0, obj_cathud);
    }
    else
    {
        with (obj_cathud)
            instance_destroy();
    }
};

var option_toggle_greenifier = new optionToggle("GREENIFIER", "option_secret_greenifier", "secret_greenifier");

option_toggle_greenifier.onActivate = function()
{
    if (global.option_secret_greenifier)
    {
        instance_create(0, 0, obj_greenifier);
    }
    else
    {
        with (obj_greenifier)
            instance_destroy();
    }
};

var option_goto_secretagain = new optionRedirect("SECRET OPTIONS", UnknownEnum.Value_8);
var option_toggle_rpg = new optionToggle("RPG MODE", "option_secret_rpg", "secret_rpg");
var option_press_retro = new optionPress("RETRO BO");

option_press_retro.onActivate = function()
{
    if (!instance_exists(obj_retroController))
        instance_create(0, 0, obj_retroController);
};

var option_press_luigi = new optionPress("CALL LUIGI");

option_press_luigi.onActivate = function()
{
    if (!instance_exists(obj_luigicall))
        instance_create(0, 0, obj_luigicall);
};

menu_secret.addOption(option_backto_base, option_toggle_cathud, option_toggle_greenifier, option_goto_secretagain, option_toggle_rpg, option_press_retro, option_press_luigi);
array_push(menuarr, menu_secret);
