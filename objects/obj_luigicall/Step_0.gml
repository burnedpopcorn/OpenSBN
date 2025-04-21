if (ready)
{
    if (event_isplaying(callsnd))
    {
        fmod_global_setParameter("musicMute", 1, false);
    }
    else
    {
        show_debug_message("Luigi Hung Up");
        instance_destroy();
    }
}
