scr_initenemy();
is_controllable = 1;
grav = 0.5;
hsp = 0;
vsp = 0;
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
hp = 1;
hitboxcreate = 0;
grounded = true;
idlespr = spr_bobby_idle;
stunfallspr = spr_bobby_stunned;
walkspr = spr_bobby_crawl;
grabbedspr = spr_bobby_crawl;
scaredspr = spr_bobby_crawl;
tauntspr = spr_bobby_taunt;
sprite_index = spr_bobby_crawl;
flash = 0;
slapped = 0;
birdcreated = 0;
boundbox = 0;
spr_dead = spr_bobby_corpsefresh;
important = 0;
heavy = 0;
depth = 0;
paletteselect = 0;
spr_palette = palette_tack;
grabbedby = 0;
stuntouchbuffer = 0;
ragedash = 0;
ragecooldown = 0;
image_speed = 0.15;
movespeed = 1;
idlebuffer = irandom_range(200, 500);
killspeed = 9;
mask_index = spr_player_mask;
