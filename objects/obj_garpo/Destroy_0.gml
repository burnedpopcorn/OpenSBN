var _x = savedx;
var _y = savedy;

while (_x > (obj_gameFrame.defaultwidth - 100))
    _x -= 20;

while (_y > (obj_gameFrame.defaultheight - 100))
    _y -= 20;

while (_x < 100)
    _x += 20;

while (_y < 100)
    _y += 20;

show_debug_message(string("Spawning obj_shakeanddie: ({0}, {1})", _x, _y));

with (instance_create(_x, _y, obj_shakeanddie))
    sprite_index = spr_garpo_dead;

event_play_oneshot("event:/SFX/bo/groundpound", x, y);
event_play_oneshot("event:/SFX/misc/explosion", x, y);
fmod_event_stop(grapeSnd, true);
