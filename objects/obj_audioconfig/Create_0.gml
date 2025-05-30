audio_select = 0;
audiosaved_master = global.option_master_volume * 100;
audiosaved_music = global.option_music_volume * 100;
audiosaved_sfx = global.option_sfx_volume * 100;
selecting = -1;
player = 0;
stickpressed = 0;
key_buffer = 0;
key_max = 5;
updown_buffer = 0;
updown_max = 10;
depth = -100;

function set_audio_config()
{
    global.option_master_volume = audiosaved_master / 100;
    global.option_music_volume = audiosaved_music / 100;
    global.option_sfx_volume = audiosaved_sfx / 100;
    ini_open("saveData.ini");
    ini_write_real("Option", "master_volume", global.option_master_volume);
    ini_write_real("Option", "music_volume", global.option_music_volume);
    ini_write_real("Option", "sfx_volume", global.option_sfx_volume);
    ini_close();
    set_option_params();
    exit;
}
