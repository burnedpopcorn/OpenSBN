scr_collision_init();
scale = 1;
vsp = 1;
terminalVelocity = 5;
grav = 0.25;
angle = 0;
randomize();
spinspeed = choose(0, 0, 0, 10, 20);
cigar = 0;
stomped = 0;
buffer = 10;
alarm[0] = 100;

if (x != obj_player1.x)
    image_xscale = -sign(x - obj_player1.x);

depth = -10;
paletteselect = 0;
spr_palette = spr_plug;
usepalette = false;
