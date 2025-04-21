var nm = ds_map_find_value(global.musicMap, room);
fmod_event_play(nm.music_inst);
fmod_event_setPause(nm.music_inst, false);
