function event_play_oneshot(argument0, argument1 = undefined, argument2 = undefined, argument3 = 0)
{
    var event_id = fmod_createEventInstance(argument0);
    fmod_event_play(event_id);
    
    if (!is_undefined(argument1) && !is_undefined(argument2))
        fmod_event_set3DPosition(event_id, argument1, argument2, argument3);
    
    fmod_event_release(event_id);
    return event_id;
}

function event_isplaying(argument0)
{
    return fmod_event_getPlaybackState(argument0) == UnknownEnum.Value_0;
}

function event_play_multiple(argument0, argument1 = undefined, argument2 = undefined, argument3 = 0)
{
}

function event_quick3D(argument0, argument1 = x, argument2 = y, argument3 = 0)
{
    fmod_event_set3DPosition(argument0, argument1, argument2, argument3);
}

function kill_sounds(argument0)
{
    trace(concat("kill_sounds(): ", string(argument0)));
    
    if (is_array(argument0))
    {
        for (var i = 0; i < array_length(argument0); i++)
        {
            var snd = argument0[i];
            fmod_event_stop(snd, true);
            fmod_event_release(snd);
        }
    }
    else
    {
        fmod_event_stop(argument0, true);
        fmod_event_release(argument0);
    }
}

function kill_sound_list(argument0)
{
    trace(concat("kill_sound_list(): ", string(argument0)));
    
    if (is_array(argument0))
    {
        for (var i = 0; i < array_length(argument0); i++)
        {
            var snd_id = argument0[i];
            
            for (var p = 0; p < ds_list_size(global.FMOD_OneShotList); p++)
            {
                var entry = ds_list_find_value(global.FMOD_OneShotList, p);
                
                if (entry != -4 && !is_undefined(entry) && entry.id == snd_id)
                {
                    kill_sounds(snd_id);
                    ds_list_delete(global.FMOD_OneShotList, p);
                    p--;
                }
            }
        }
    }
    else
    {
        var snd_id = argument0;
        
        for (var p = 0; p < ds_list_size(global.FMOD_OneShotList); p++)
        {
            var entry = ds_list_find_value(global.FMOD_OneShotList, p);
            
            if (entry != -4 && !is_undefined(entry) && entry.id == snd_id)
            {
                kill_sounds(snd_id);
                ds_list_delete(global.FMOD_OneShotList, p);
            }
        }
    }
}

function fmod_create_ext(argument0)
{
    var a = fmod_createEventInstance(argument0);
    ds_list_add(global.FMOD_OneShotList, 
    {
        id: a,
        name: argument0,
        one_shot: false
    });
    return a;
}

function set_option_params()
{
    fmod_global_setParameter("musicVolume", global.option_music_volume, true);
    fmod_global_setParameter("sfxVolume", global.option_sfx_volume, true);
    fmod_global_setParameter("masterVolume", global.option_master_volume, true);
}

function add_music(argument0, argument1, argument2 = undefined, argument3 = undefined)
{
    var q = 
    {
        music_inst: -4,
        secret_inst: -4,
        music_name: argument1,
        secret_name: argument2,
        roomstart: -4
    };
    
    with (q)
    {
        music_inst = fmod_createEventInstance(argument1);
        
        if (argument2 != undefined)
            secret_inst = fmod_createEventInstance(argument2);
        
        if (argument3 != undefined)
            roomstart = method(self, argument3);
    }
    
    ds_map_set(global.musicMap, argument0, q);
}

function stop_music(argument0 = true)
{
    with (obj_music)
    {
        if (music != -4)
        {
            fmod_event_stop(music.music_inst, argument0);
            fmod_event_stop(music.secret_inst, argument0);
        }
        
        fmod_event_stop(pillarMusic, 1);
        fmod_event_stop(escapeMusic, 1);
    }
}

function wrap_music(argument0, argument1)
{
    return clamp(argument0 % argument1, 1, argument1);
}
