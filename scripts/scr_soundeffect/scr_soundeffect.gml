function scr_soundeffect()
{
    if (instance_exists(self))
        show_message(string("Defunct sound function in id: {0}, object_index: {1}", id, object_index));
    else
        show_message("Defunct sound function found Somewhere!");
    
    exit;
}

function scr_soundeffect_3d(argument0, argument1, argument2)
{
    if (instance_exists(self))
        show_message(string("Defunct sound function in id: {0}, object_index: {1}", id, object_index));
    else
        show_message("Defunct sound function found Somewhere!");
    
    exit;
}

function scr_soundeffect_randpitch()
{
    if (instance_exists(self))
        show_message(string("Defunct sound function in id: {0}, object_index: {1}", id, object_index));
    else
        show_message("Defunct sound function found Somewhere!");
    
    exit;
}

function sfx_gain(argument0)
{
    audio_sound_gain(argument0, audio_sound_get_gain(argument0) * global.option_sfx_volume, 0);
    exit;
}
