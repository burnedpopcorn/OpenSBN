scr_initenemy();
grav = 0.5;
hsp = 0;
vsp = 0;
movespeed = 3;
state = states.walk;
stunned = 0;
alarm[0] = 150;
roaming = 1;
collectdrop = 5;
flying = 0;
straightthrow = 0;
cigar = 0;
cigarcreate = 0;
stomped = 0;
shot = 0;
reset = 0;
flash = 0;
landspr = spr_twoliter_idle;
idlespr = spr_twoliter_idle;
fallspr = spr_twoliter_fall;
stunfallspr = spr_twoliter_stunned;
walkspr = spr_twoliter_walk;
turnspr = spr_twoliter_walk;
recoveryspr = spr_twoliter_stunned;
grabbedspr = spr_twoliter_stunned;
scaredspr = spr_twoliter_scared;
ragespr = spr_twoliter_stunned;
spr_dead = spr_twoliter_stunned;
image_xscale = -1;
hp = 2;
slapped = 0;
grounded = true;
birdcreated = 0;
boundbox = 0;
important = 0;
heavy = 0;
depth = 0;
paletteselect = 1;
spr_palette = palette_grape;
grabbedby = 0;
momentum = 5;
hitboxcreate = 0;
image_speed = 0.35;
steppy = 0;
stuntouchbuffer = 0;
bonebuffer = 100;
jumping = 0;
explodeInstant = false;
sprite_index = spr_twoliter_idle;
targetX = x;
_afterimage = 8;
