hsp = 0;
vsp = 0;
grav = 0.5;
grounded = false;
playerid = !place_meeting(x, y, obj_player1) ? instance_nearest(x, y, obj_player1) : instance_place(x, y, obj_player1);
movespeed = 6;
image_speed = 0.35;
countdown = 120;
depth = -10;
playercollision = 1;
obj_explosion = 388;
kick = 0;
mask_index = spr_player_mask;
platformid = -4;
hsp_carry = 0;
vsp_carry = 0;
