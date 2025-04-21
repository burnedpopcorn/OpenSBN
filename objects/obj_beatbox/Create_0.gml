scr_initenemy();
Volume = 0;
vsp = -11;
beatBoxMusic = 0;
pitch = 1;
snd = fmod_createEventInstance("event:/music/beatbox");

if (!instance_exists(obj_scaryfish))
{
    fmod_event_play(snd);
    fmod_global_setParameter("beatboxstate", 0, 1);
    fmod_global_setParameter("beatboxfade", 1, 0);
}
