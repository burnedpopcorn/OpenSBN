var _channels = 256;
var _coreflags = UnknownEnum.Value_0;
var _studioflags = UnknownEnum.Value_0;
fmod_studio_system_create();
show_debug_message("fmod_studio_system_create: " + string(fmod_last_result()));
fmod_studio_system_init(_channels, _studioflags, _coreflags);
show_debug_message("fmod_studio_system_init: " + string(fmod_last_result()));
system = fmod_studio_system_get_core_system();
var banks = ["sound/Desktop/Master.strings.bank", "sound/Desktop/Master.bank", "sound/Desktop/music.bank", "sound/Desktop/sfx.bank"];

for (var i = 0; i < array_length(banks); i++)
{
    var b = working_directory + banks[i];
    var bank = fmod_studio_system_load_bank_file(b, UnknownEnum.Value_0);
    show_debug_message(concat("Loaded ", banks[i], ": ", string(fmod_last_result())));
    fmod_studio_bank_load_sample_data(bank);
    show_debug_message(concat("Sample data for ", banks[i], ": ", string(fmod_last_result())));
}

z = 0;
global.FMOD_default3DAttributes = 
{
    position: 
    {
        x: 0,
        y: 0,
        z: 0
    },
    velocity: 
    {
        x: 0,
        y: 0,
        z: 0
    },
    forward: 
    {
        x: 0,
        y: 0,
        z: 1
    },
    up: 
    {
        x: 0,
        y: 1,
        z: 0
    }
};
attributes3D = global.FMOD_default3DAttributes;
attributes3D.position = 
{
    x: camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2),
    y: camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2),
    z: 0
};
fmod_studio_system_set_num_listeners(1);
fmod_studio_system_set_listener_attributes(0, attributes3D);
fmod_studio_system_set_listener_weight(0, 1);
ini_open("saveData.ini");
global.option_fullscreen = ini_read_real("Option", "fullscreen", 1);
global.option_resolution = ini_read_real("Option", "resolution", 1);
global.option_master_volume = ini_read_real("Option", "master_volume", 1);
global.option_music_volume = ini_read_real("Option", "music_volume", 1);
global.option_sfx_volume = ini_read_real("Option", "sfx_volume", 1);
global.option_vibration = ini_read_real("Option", "vibration", 1);
set_option_params();
ini_close();
global.FMOD_OneShotList = ds_list_create();
global.FMOD_EventInstances = [];
global.initMusic = fmod_createEventInstance("event:/music/init");
fmod_event_play(global.initMusic);
