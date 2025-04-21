for (var i = 0; i < maxcats; i++)
{
    fmod_event_stop(purrsnd[i], true);
    fmod_event_release(purrsnd[i]);
}
