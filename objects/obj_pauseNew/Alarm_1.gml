global.levelreset = 0;
scr_playerreset();
global.levelreset = 1;
room_goto(global.leveltorestart);
obj_player1.targetDoor = "A";

if (instance_exists(obj_player2))
    obj_player2.targetDoor = "A";
