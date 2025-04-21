function scr_pausemusic()
{
    with (obj_music)
    {
        if (music != -4)
        {
            other.savedPauseMusic = fmod_event_getPause(music.music_inst);
            other.savedPauseSecret = fmod_event_getPause(music.secret_inst);
            fmod_event_setPause(music.music_inst, true);
            fmod_event_setPause(music.secret_inst, true);
        }
        
        other.savedPauseEscape = event_isplaying(escapeMusic);
        fmod_event_setPause(escapeMusic, true);
        other.savedPausePillar = event_isplaying(pillarMusic);
        fmod_event_setPause(pillarMusic, true);
    }
    
    if (event_isplaying(global.RedCoinMusic))
        fmod_event_setPause(global.RedCoinMusic, true);
}

function scr_unpausemusic()
{
    with (obj_music)
    {
        if (music != -4)
        {
            if (music.music_inst != -4)
                fmod_event_setPause(music.music_inst, other.savedPauseMusic);
            
            if (music.secret_inst != -4)
                fmod_event_setPause(music.secret_inst, other.savedPauseSecret);
        }
        
        fmod_event_setPause(escapeMusic, !(global.panic && !global.inSecret));
        fmod_event_setPause(pillarMusic, true);
    }
    
    if (room == hub_soundtest)
    {
        with (obj_soundtest)
        {
            for (var i = 0; i < array_length(musicArr); i++)
            {
                var s = musicArr[i];
                
                if (i != pos_playing)
                {
                    fmod_event_setPause(s.event, true);
                    s.stop(true);
                }
            }
            
            var mu = musicArr[pos_playing];
            
            if (mu.is_paused)
                fmod_event_setPause(mu.event, true);
        }
    }
    
    if (global.redcoin > 0)
        fmod_event_setPause(global.RedCoinMusic, false);
    
    with (obj_pauseNew)
    {
        fmod_event_stop(pauseMusic, false);
        fmod_event_setPause(pauseMusic, true);
    }
}

function scr_pauseinstances()
{
    fmod_event_setPause_all(true);
    ds_list_clear(global.PauseInstances);
    
    for (var i = 0; i < instance_count; i++)
    {
        var me = instance_find(-3, i);
        
        if (instance_exists(me) && me.object_index != obj_fmod && me.object_index != obj_pauseNew && me.object_index != obj_inputController && me.object_index != obj_music)
            ds_list_add(global.PauseInstances, me);
    }
    
    instance_deactivate_all(true);
    instance_activate_object(obj_fmod);
    instance_activate_object(obj_gameFrame);
    instance_activate_object(obj_savesystem);
    instance_activate_object(obj_pauseNew);
    instance_activate_object(obj_music);
    instance_activate_object(obj_inputController);
    instance_activate_object(obj_globaltimer);
}

function scr_unpauseinstances()
{
    fmod_event_setPause_all(false);
    
    for (var i = 0; i < ds_list_size(global.PauseInstances); i++)
        instance_activate_object(ds_list_find_value(global.PauseInstances, i));
}

function pause_all_sounds(argument0)
{
    trace(concat("pause_all_sounds()", string(argument0)));
    
    for (var i = 0; i < ds_list_size(global.FMOD_OneShotList); i++)
    {
        var snd_id = ds_list_find_value(global.FMOD_OneShotList, i).id;
        
        if (snd_id != -4 && !is_undefined(snd_id))
            fmod_event_setPause(snd_id, argument0);
    }
}

function stop_all_sounds()
{
    trace("stop_all_sounds()");
    
    for (var i = 0; i < ds_list_size(global.FMOD_OneShotList); i++)
    {
        var snd_id = ds_list_find_value(global.FMOD_OneShotList, i).id;
        
        if (snd_id != -4 && !is_undefined(snd_id))
            kill_sounds(snd_id);
    }
    
    ds_list_clear(global.FMOD_OneShotList);
}
