x = obj_player1.x;
y = (sprite_get_bbox_top(obj_player1.sprite_index) + obj_player1.y) - 40;
image_xscale = obj_player1.xscale;

if (obj_player1.state == states.knightpepslopes || obj_player1.state == states.knightpep || room == rank_room)
    visible = false;
else if (global.cowboyhat == 1)
    visible = true;
else
    visible = false;
