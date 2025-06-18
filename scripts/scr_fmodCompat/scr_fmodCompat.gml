function fmod_init(argument0)
{
    return fmod_studio_system_init(argument0, FMOD_STUDIO_INIT.NORMAL, FMOD_INIT.NORMAL);
}

function fmod_loadBank(argument0)
{
    return fmod_studio_system_load_bank_file(argument0, FMOD_STUDIO_LOAD_BANK.NORMAL);
}

function fmod_event_play(argument0)
{
    return fmod_studio_event_instance_start(argument0);
}

function fmod_update()
{
    return fmod_studio_system_update();
}

function fmod_create()
{
    return fmod_studio_system_create();
}

function fmod_bank_loadSampleData(argument0)
{
    return fmod_studio_bank_load_sample_data(argument0);
}

function fmod_createEventInstance(argument0)
{
    var event_description = fmod_studio_system_get_event(argument0);
    var event_instance = fmod_studio_event_description_create_instance(event_description);
    array_push(global.FMOD_EventInstances, [event_instance, fmod_studio_event_description_get_path(event_description)]);
    return event_instance;
}

function fmod_event_setParameter(argument0, argument1, argument2, argument3 = false)
{
    return fmod_studio_event_instance_set_parameter_by_name(argument0, argument1, argument2, argument3);
}

function fmod_getBus(argument0)
{
    return fmod_studio_system_get_bus(argument0);
}

function fmod_bus_getVolume(argument0)
{
    return fmod_studio_bus_get_volume(argument0);
}

function fmod_bus_setVolume(argument0, argument1)
{
    return fmod_studio_bus_set_volume(argument0, argument1);
}

function fmod_bus_getMute(argument0)
{
    return fmod_studio_bus_get_mute(argument0);
}

function fmod_bus_setMute(argument0, argument1)
{
    return fmod_studio_bus_set_mute(argument0, argument1);
}

function fmod_event_getParameter(argument0, argument1)
{
    var param = fmod_studio_event_instance_get_parameter_by_name(argument0, argument1);
    return param.value;
}

function fmod_event_set3DPosition(argument0, argument1, argument2, argument3 = 0)
{
    var attributes = global.FMOD_default3DAttributes;
    attributes.position = 
    {
        x: argument1,
        y: argument2,
        z: argument3
    };
    fmod_studio_event_instance_set_3d_attributes(argument0, attributes);
}

function fmod_release()
{
    fmod_system_release();
}

function fmod_global_setParameter(argument0, argument1, argument2)
{
    return fmod_studio_system_set_parameter_by_name(argument0, argument1, argument2);
}

function fmod_global_getParameter(argument0)
{
    var param = fmod_studio_system_get_parameter_by_name(argument0);
    return param.value;
}

function fmod_event_setPause(argument0, argument1)
{
    return fmod_studio_event_instance_set_paused(argument0, argument1);
}

function fmod_event_release(argument0)
{
    return fmod_studio_event_instance_release(argument0);
}

function fmod_event_stop(argument0, argument1)
{
    return fmod_studio_event_instance_stop(argument0, argument1);
}

function fmod_event_setTimelinePosition(argument0, argument1)
{
    return fmod_studio_event_instance_set_timeline_position(argument0, argument1);
}

function fmod_event_getTimelinePosition(argument0)
{
    return fmod_studio_event_instance_get_timeline_position(argument0);
}

function fmod_event_getVolume(argument0)
{
    return fmod_studio_event_instance_get_volume(argument0);
}

function fmod_event_setVolume(argument0, argument1)
{
    return fmod_studio_event_instance_set_volume(argument0, argument1);
}

function fmod_event_setPitch(argument0, argument1)
{
    return fmod_studio_event_instance_set_pitch(argument0, argument1);
}

function fmod_event_getPitch(argument0)
{
    return fmod_studio_event_instance_get_pitch(argument0);
}

function fmod_event_getReverb(argument0)
{
    return fmod_studio_event_instance_get_reverb_level(argument0, 0);
}

function fmod_event_setReverb(argument0, argument1)
{
    return fmod_studio_event_instance_set_reverb_level(argument0, 0, argument1);
}

function fmod_getEventLength(argument0)
{
    var event_description = fmod_studio_system_get_event(argument0);
    return fmod_studio_event_description_get_length(event_description);
}

function fmod_event_getPlaybackState(argument0)
{
    return fmod_studio_event_instance_get_playback_state(argument0);
}

function fmod_event_getPause(argument0)
{
    return fmod_studio_event_instance_get_paused(argument0);
}

function fmod_event_setPause_all(argument0)
{
    for (var i = 0; i < array_length(global.FMOD_EventInstances); i++)
    {
        if (fmod_studio_event_instance_is_valid(global.FMOD_EventInstances[i][0]))
            fmod_studio_event_instance_set_paused(global.FMOD_EventInstances[i][0], argument0);
    }
}

function fmod_event_release_all()
{
    for (var i = 0; i < array_length(global.FMOD_EventInstances); i++)
    {
        if (fmod_studio_event_instance_is_valid(global.FMOD_EventInstances[i][0]))
            fmod_studio_event_instance_release(global.FMOD_EventInstances[i][0]);
    }
}

function fmod_event_stop_all(argument0)
{
    for (var i = 0; i < array_length(global.FMOD_EventInstances); i++)
    {
        if (fmod_studio_event_instance_is_valid(global.FMOD_EventInstances[i][0]))
            fmod_studio_event_instance_stop(global.FMOD_EventInstances[i][0], argument0);
    }
}

function fmod_event_getEventPath(argument0)
{
    var event_description = fmod_studio_event_instance_get_description(argument0);
    return fmod_studio_event_description_get_path(event_description);
}
