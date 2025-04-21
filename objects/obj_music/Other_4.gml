if (!global.panic)
{
    var nm = ds_map_find_value(global.musicMap, room);
    
    if (!is_undefined(nm))
    {
        var pm = music;
        
        if (pm == -4 || pm.music_name != nm.music_name)
        {
            alarm[0] = 1;
            
            if (pm != -4)
            {
                fmod_event_stop(pm.music_inst, true);
                
                if (pm.secret_inst != -4)
                    fmod_event_stop(pm.secret_inst, true);
            }
            
            music = nm;
        }
    }
    
    if (instance_exists(obj_hungrypillar))
    {
        fmod_event_play(pillarMusic);
        fmod_event_setPause(pillarMusic, false);
        fmod_global_setParameter("pillarfade", 0, true);
    }
    else
    {
        fmod_event_stop(pillarMusic, true);
    }
    
    if (music != -4 && music.roomstart != -4)
        music.roomstart(room, music.music_inst, music.secret_inst);
}

if (global.inSecret)
{
    if (music != -4 && music.secret_inst != -4)
    {
        fmod_event_play(music.secret_inst);
        savedMusicPos = fmod_event_getTimelinePosition(music.music_inst);
        var length = savedMusicPos / fmod_getEventLength(music.music_name);
        var pos = length * fmod_getEventLength(music.secret_name);
        fmod_event_setTimelinePosition(music.secret_inst, pos);
        fmod_event_setPause(music.music_inst, true);
        fmod_event_setPause(music.secret_inst, false);
    }
    
    if (global.panic)
    {
        savedPanicPos = fmod_event_getTimelinePosition(escapeMusic);
        fmod_event_setPause(escapeMusic, true);
    }
}
else if (global.inSecretend)
{
    global.inSecretend = false;
    
    if (music != -4)
    {
        fmod_event_stop(music.secret_inst, true);
        fmod_event_setTimelinePosition(music.music_inst, savedMusicPos);
        fmod_event_setPause(music.music_inst, false);
    }
    
    if (global.panic)
    {
        fmod_event_setTimelinePosition(escapeMusic, savedPanicPos);
        fmod_event_setPause(escapeMusic, false);
    }
}

if (room == rank_room)
    stop_music();
