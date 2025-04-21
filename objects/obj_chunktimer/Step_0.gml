if (global.panic == true && global.fill > 0 && !instance_exists(obj_ghostcollectibles))
    global.fill -= 1;

if (global.fill <= 0 && global.panic == true && (!instance_exists(obj_garpo) && !instance_exists(obj_endlevelfade)))
{
    show_debug_message(string("Creating obj_garbo: ({0}, {1})", obj_player1.x, obj_player1.y));
    instance_create(obj_player1.x, obj_player1.y, obj_garpo);
    event_play_oneshot("event:/SFX/grape/laugh");
}
