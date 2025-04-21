if (!(place_meeting(x, y, obj_player1) && touched))
    touched = false;

if (fresh && event_isplaying(flysnd))
    fmod_event_stop(flysnd, 1);

event_quick3D(flysnd);
scr_collide();
