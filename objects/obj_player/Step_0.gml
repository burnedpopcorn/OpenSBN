enum states 
{
	normal = 2,
	revolver = 3,		// doesn't exist anymore
	dynamite = 4,		// doesn't exist anymore
	boots = 5,			// doesn't exist anymore
	grabbed = 6,
	finishingblow = 8,
	tumble = 7,
	titlescreen = 20,
	ejected = 9,
	firemouth = 12,
	fireass = 11,
	transitioncutscene = 10,
	hookshot = 21,
	slap = 25,
	tacklecharge = 22,
	cheesepep = 26,
	cheesepepjump = 28,
	cheesepepfling = 29,
	cheeseball = 23,
	cheeseballclimbwall = 24,
	cheesepepstickside = 31,
	cheesepepstickup = 32,
	cheesepepstick = 27,
	fishswim = 270,
	fishdash = 271,
	fishground = 272,
	fishhurt = 273,
	cheesepeplaunch = 30,
	boxxedpep = 35,
	boxxedpepjump = 37,
	boxxedpepspin = 36,
	pistolaim = 38,
	climbwall = 39,
	knightpepslopes = 40,
	portal = 41,
	secondjump = 42,
	chainsawbump = 43,
	handstandjump = 44,
	lungeattack = 45,
	lungegrab = 46,
	dashtumble = 47,
	shoulderbash = 155,
	gottreasure = 48,
	knightpep = 49,
	knightpepattack = 50,
	knightpepbump = 51,
	meteorpep = 52,
	bombpep = 53,
	bombpepup = 56,
	bombpepside = 55,
	bombgrab = 54,
	grabbing = 57,
	chainsawpogo = 58,
	shotgunjump = 59,
	stunned = 61,
	highjump = 62,
	chainsaw = 63,
	hit = 139,
	thrown = 158,
	facestomp = 64,
	timesup = 66,
	machroll = 67,
	pistol = 74,
	shotgun = 68,
	shotguncrouch = 69,
	shotguncrouchjump = 70,
	shotgunshoot = 71,
	shotgunfreefall = 73,
	shotgundash = 72,
	machfreefall = 75,
	throwing = 76,
	superslam = 78,
	slam = 77,
	skateboard = 79,
	grind = 80,
	grab = 81,
	punch = 82,
	backkick = 83,
	uppunch = 84,
	shoulder = 85,
	backbreaker = 86,
	graffiti = 87,
	bossdefeat = 88,
	bossintro = 90,
	smirk = 98,
	pizzathrow = 89,
	gameover = 91,
	Sjumpland = 125,
	freefallprep = 124,
	runonball = 122,
	boulder = 120,
	keyget = 92,
	tackle = 93,
	slipnslide = 96,
	ladder = 95,
	jump = 94,
	victory = 100,
	comingoutdoor = 97,
	Sjump = 99,
	Sjumpprep = 101,
	crouch = 102,
	crouchjump = 103,
	crouchslide = 104,
	mach1 = 105,		// doesn't exist anymore
	mach2 = 106,
	mach3 = 123,
	machslide = 107,
	bump = 108,
	hurt = 109,
	freefall = 110,
	freefallland = 113,
	hang = 111,
	door = 114,
	barrel = 115,
	barreljump = 116,
	barrelslide = 118,
	barrelclimbwall = 117,
	current = 119,
	taxi = 121,
	pogo = 60,
	rideweenie = 33,
	motorcycle = 34,
	faceplant = 126,
	ghost = 18,
	ghostpossess = 19,
	mort = 13,
	mortjump = 14,
	mortattack = 15,
	morthook = 16,
	hook = 17,
	arenaintro = 146,
	actor = 148,
	Parry = 149,
	golf = 150,
	tube = 152,
	pummel = 156,
	slipbanan = 167,
	bombdelete = 185,
	rocket = 186,
	rocketslide = 187,
	gotoplayer = 188,
	trickjump = 189,
	ridecow = 192,
	ratmount = 193,
	ratmounthurt = 198,
	ratmountjump = 194,
	ratmountattack = 195,
	ratmountspit = 196,
	ratmountclimbwall = 197,
	ratmountgroundpound = 199,
	ratmountbounce = 200,
	ratmountballoon = 202,
	ratmountgrind = 204,
	ratmounttumble = 203,
	ratmountpunch = 261,
	ratmounttrickjump = 205,
	ratmountskid = 206,
	blockstance = 208,
	balloon = 209,
	debugstate = 210,
	trashjump = 212,
	trashroll = 213,
	stringfling = 214,
	stringjump = 215,
	stringfall = 216,
	noisejetpack = 217,
	spiderweb = 218,
	animatronic = 227,
	playersuperattack = 254,
	jetpackjump = 256,
	bee = 259,
	ratmountcrouch = 262,
	ratmountladder = 263,
	antigrav = 267,
	firemove = 269,
	waterfloat = 274,
	backtohub = 275,
	oilcutscene = 276,
	walk = 136,
	stun = 140,
	staggered = 157,
	shield = 176,
}

if (object_index == obj_player2 && state == states.titlescreen)
    exit;

prevhsp = hsp;
prevmove = move;
prevmovespeed = movespeed;
previcemovespeed = icemovespeed;
prevxscale = xscale;

if (grounded && vsp > 0)
    coyote_time = 8;

if (vsp < 0)
    coyote_time = 0;

can_jump = (grounded && vsp > 0) || (coyote_time > 0 && vsp > 0);
var prevmask = mask_index;
var a = instance_place(x, y, obj_secrettile);
secret_array = (a != -4 && instance_exists(a) && a.secretFunction()) ? a.tiles : [];

switch (state)
{
    case states.normal:
        scr_player_normal();
        break;
    
    case states.revolver:
        state_player_revolver();
        break;
    
    case states.dynamite:
        state_player_dynamite();
        break;
    
    case states.boots:
        state_player_boots();
        break;
    
    case states.grabbed:
        state_player_grabbed();
        break;
    
    case states.finishingblow:
        state_player_finishingblow();
        break;
    
    case states.tumble:
        state_player_tumble();
        break;
    
    case states.titlescreen:
        state_player_titlescreen();
        break;
    
    case states.ejected:
        state_player_ejected();
        break;
    
    case states.firemouth:
        state_player_firemouth();
        break;
    
    case states.fireass:
        state_player_fireass();
        break;
    
    case states.transitioncutscene:
        state_player_transitioncutscene();
        break;
    
    case states.hookshot:
        scr_playerN_hookshot();
        break;
    
    case states.slap:
        state_player_slap();
        break;
    
    case states.tacklecharge:
        state_player_tacklecharge();
        break;
    
    case states.cheesepep:
        state_player_cheesepep();
        break;
    
    case states.cheesepepjump:
        state_player_cheesepepjump();
        break;
    
    case states.cheesepepfling:
        state_player_cheesepepfling();
        break;
    
    case states.cheeseball:
        state_player_cheeseball();
        break;
    
    case states.cheeseballclimbwall:
        state_player_cheeseballclimbwall();
        break;
    
    case states.cheesepepstickside:
        state_player_cheesepepstickside();
        break;
    
    case states.cheesepepstickup:
        state_player_cheesepepstickup();
        break;
    
    case states.cheesepepstick:
        state_player_cheesepepstick();
        break;
    
    case states.fishswim:
        state_player_fishswim();
        break;
    
    case states.fishdash:
        state_player_fishdash();
        break;
    
    case states.fishground:
        state_player_fishground();
        break;
    
    case states.fishhurt:
        state_player_fishhurt();
        break;
    
    case states.cheesepeplaunch:
        state_player_cheesepeplaunch();
        break;
    
    case states.boxxedpep:
        state_player_boxxedpep();
        break;
    
    case states.boxxedpepjump:
        state_player_boxxedpepjump();
        break;
    
    case states.boxxedpepspin:
        state_player_boxxedpepspin();
        break;
    
    case states.pistolaim:
        state_player_pistolaim();
        break;
    
    case states.climbwall:
        state_player_climbwall();
        break;
    
    case states.knightpepslopes:
        state_player_knightpepslopes();
        break;
    
    case states.portal:
        state_player_portal();
        break;
    
    case states.secondjump:
        state_player_secondjump();
        break;
    
    case states.chainsawbump:
        state_player_chainsawbump();
        break;
    
    case states.handstandjump:
        state_player_handstandjump();
        break;
    
    case states.lungeattack:
        state_player_lungeattack();
        break;
    
    case states.lungegrab:
        state_player_lungegrab();
        break;
    
    case states.dashtumble:
        state_player_dashtumble();
        break;
    
    case states.shoulderbash:
        state_player_shoulderbash();
        break;
    
    case states.gottreasure:
        state_player_gottreasure();
        break;
    
    case states.knightpep:
        state_player_knightpep();
        break;
    
    case states.knightpepattack:
        state_player_knightpepattack();
        break;
    
    case states.knightpepbump:
        state_player_knightpepbump();
        break;
    
    case states.meteorpep:
        state_player_meteorpep();
        break;
    
    case states.bombpep:
        state_player_bombpep();
        break;
    
    case states.bombpepup:
        state_player_bombpepup();
        break;
    
    case states.bombpepside:
        state_player_bombpepside();
        break;
    
    case states.bombgrab:
        state_player_bombgrab();
        break;
    
    case states.grabbing:
        state_player_grabbing();
        break;
    
    case states.chainsawpogo:
        state_player_chainsawpogo();
        break;
    
    case states.shotgunjump:
        state_player_shotgunjump();
        break;
    
    case states.stunned:
        state_player_stunned();
        break;
    
    case states.highjump:
        state_player_highjump();
        break;
    
    case states.chainsaw:
        state_player_chainsaw();
        break;
    
    case states.hit:
        state_player_hit();
        break;
    
    case states.thrown:
        state_player_thrown();
        break;
    
    case states.facestomp:
        state_player_facestomp();
        break;
    
    case states.timesup:
        state_player_timesup();
        break;
    
    case states.machroll:
        state_player_machroll();
        break;
    
    case states.pistol:
        state_player_pistol();
        break;
    
    case states.shotgun:
        state_player_shotgun();
        break;
    
    case states.shotguncrouch:
        state_player_shotguncrouch();
        break;
    
    case states.shotguncrouchjump:
        state_player_shotguncrouchjump();
        break;
    
    case states.shotgunshoot:
        state_player_shotgunshoot();
        break;
    
    case states.shotgunfreefall:
        state_player_shotgunfreefall();
        break;
    
    case states.shotgundash:
        state_player_shotgundash();
        break;
    
    case states.machfreefall:
        state_player_machfreefall();
        break;
    
    case states.throwing:
        state_player_throwing();
        break;
    
    case states.superslam:
        state_player_superslam();
        break;
    
    case states.slam:
        state_player_slam();
        break;
    
    case states.skateboard:
        state_player_skateboard();
        break;
    
    case states.grind:
        state_player_grind();
        break;
    
    case states.grab:
        state_player_grab();
        break;
    
    case states.punch:
        state_player_punch();
        break;
    
    case states.backkick:
        state_player_backkick();
        break;
    
    case states.uppunch:
        state_player_uppunch();
        break;
    
    case states.shoulder:
        state_player_shoulder();
        break;
    
    case states.backbreaker:
        state_player_backbreaker();
        break;
    
    case states.graffiti:
        state_player_graffiti();
        break;
    
    case states.bossdefeat:
        state_player_bossdefeat();
        break;
    
    case states.bossintro:
        state_player_bossintro();
        break;
    
    case states.smirk:
        state_player_smirk();
        break;
    
    case states.pizzathrow:
        state_player_pizzathrow();
        break;
    
    case states.gameover:
        state_player_gameover();
        break;
    
    case states.Sjumpland:
        state_player_Sjumpland();
        break;
    
    case states.freefallprep:
        state_player_freefallprep();
        break;
    
    case states.runonball:
        state_player_runonball();
        break;
    
    case states.boulder:
        state_player_boulder();
        break;
    
    case states.keyget:
        state_player_keyget();
        break;
    
    case states.tackle:
        state_player_tackle();
        break;
    
    case states.slipnslide:
        state_player_slipnslide();
        break;
    
    case states.ladder:
        state_player_ladder();
        break;
    
    case states.jump:
        scr_player_jump();
        break;
    
    case states.victory:
        state_player_victory();
        break;
    
    case states.comingoutdoor:
        state_player_comingoutdoor();
        break;
    
    case states.Sjump:
        state_player_Sjump();
        break;
    
    case states.Sjumpprep:
        state_player_Sjumpprep();
        break;
    
    case states.crouch:
        state_player_crouch();
        break;
    
    case states.crouchjump:
        state_player_crouchjump();
        break;
    
    case states.crouchslide:
        state_player_crouchslide();
        break;
    
    case states.mach1:
        state_player_mach1();
        break;
    
    case states.mach2:
        state_player_mach2();
        break;
    
    case states.mach3:
        state_player_mach3();
        break;
    
    case states.machslide:
        state_player_machslide();
        break;
    
    case states.bump:
        state_player_bump();
        break;
    
    case states.hurt:
        state_player_hurt();
        break;
    
    case states.freefall:
        state_player_freefall();
        break;
    
    case states.freefallland:
        state_player_freefallland();
        break;
    
    case states.hang:
        state_player_hang();
        break;
    
    case states.door:
        state_player_door();
        break;
    
    case states.barrel:
        state_player_barrel();
        break;
    
    case states.barreljump:
        state_player_barreljump();
        break;
    
    case states.barrelslide:
        state_player_barrelslide();
        break;
    
    case states.barrelclimbwall:
        state_player_barrelclimbwall();
        break;
    
    case states.current:
        state_player_current();
        break;
    
    case states.taxi:
        state_player_taxi();
        break;
    
    case UnknownEnum.Value_154:
        state_player_taxi();
        break;
    
    case states.pogo:
        state_player_pogo();
        break;
    
    case states.rideweenie:
        state_player_rideweenie();
        break;
    
    case states.motorcycle:
        state_player_motorcycle();
        break;
    
    case states.faceplant:
        state_player_faceplant();
        break;
    
    case states.ghost:
        state_player_ghost();
        break;
    
    case states.ghostpossess:
        state_player_ghostpossess();
        break;
    
    case states.mort:
        state_player_mort();
        break;
    
    case states.mortjump:
        state_player_mortjump();
        break;
    
    case states.mortattack:
        state_player_mortattack();
        break;
    
    case states.morthook:
        state_player_morthook();
        break;
    
    case states.hook:
        state_player_hook();
        break;
    
    case states.arenaintro:
        state_player_arenaintro();
        break;
    
    case states.actor:
        state_player_actor();
        break;
    
    case states.Parry:
        state_player_parry();
        break;
    
    case states.golf:
        state_player_golf();
        break;
    
    case states.tube:
        state_player_tube();
        break;
    
    case states.pummel:
        state_player_pummel();
        break;
    
    case states.slipbanan:
        state_player_slipbanan();
        break;
    
    case states.bombdelete:
        state_player_bombdelete();
        break;
    
    case states.rocket:
        state_player_rocket();
        break;
    
    case states.rocketslide:
        state_player_rocketslide();
        break;
    
    case states.gotoplayer:
        state_player_gotoplayer();
        break;
    
    case states.trickjump:
        state_player_trickjump();
        break;
    
    case states.ridecow:
        state_player_ridecow();
        break;
    
    case states.ratmount:
        state_player_ratmount();
        break;
    
    case states.ratmounthurt:
        state_player_ratmounthurt();
        break;
    
    case states.ratmountjump:
        state_player_ratmountjump();
        break;
    
    case states.ratmountattack:
        state_player_ratmountattack();
        break;
    
    case states.ratmountspit:
        state_player_ratmountspit();
        break;
    
    case states.ratmountclimbwall:
        state_player_ratmountclimbwall();
        break;
    
    case states.ratmountgroundpound:
        state_player_ratmountgroundpound();
        break;
    
    case states.ratmountbounce:
        state_player_ratmountbounce();
        break;
    
    case states.ratmountballoon:
        state_player_ratmountballoon();
        break;
    
    case states.ratmountgrind:
        state_player_ratmountgrind();
        break;
    
    case states.ratmounttumble:
        state_player_ratmounttumble();
        break;
    
    case states.ratmountpunch:
        state_player_ratmountpunch();
        break;
    
    case states.ratmounttrickjump:
        state_player_ratmounttrickjump();
        break;
    
    case states.ratmountskid:
        state_player_ratmountskid();
        break;
    
    case states.blockstance:
        state_player_blockstance();
        break;
    
    case states.balloon:
        state_player_balloon();
        break;
    
    case states.debugstate:
        state_player_debugstate();
        break;
    
    case states.trashjump:
        state_player_trashjump();
        break;
    
    case states.trashroll:
        state_player_trashroll();
        break;
    
    case states.stringfling:
        state_player_stringfling();
        break;
    
    case states.stringjump:
        state_player_stringjump();
        break;
    
    case states.stringfall:
        state_player_stringfall();
        break;
    
    case states.noisejetpack:
        state_player_noisejetpack();
        break;
    
    case states.spiderweb:
        state_player_spiderweb();
        break;
    
    case states.animatronic:
        state_player_animatronic();
        break;
    
    case states.playersuperattack:
        state_player_playersuperattack();
        break;
    
    case states.jetpackjump:
        state_player_jetpackjump();
        break;
    
    case states.bee:
        state_player_bee();
        break;
    
    case states.ratmountcrouch:
        state_player_ratmountcrouch();
        break;
    
    case states.ratmountladder:
        state_player_ratmountladder();
        break;
    
    case states.antigrav:
        state_player_antigrav();
        break;
    
    case states.firemove:
        state_player_firemove();
        break;
    
    case states.waterfloat:
        state_player_waterfloat();
        break;
    
    case states.backtohub:
        scr_player_backtohub();
        break;
    
    case states.oilcutscene:
        state_player_oilcutscene();
        break;
}

a = instance_place(x, y, obj_secrettile);
secret_array = (a != -4) ? a.tiles : ["-4"];
scr_playersounds();

if (prevstate != state)
{
    if (prevstate == states.trashroll && prevsprite != spr_null && prevsprite != spr_null)
        create_debris(x, y, spr_player_trashlid);
}

if (!place_meeting(x, y + 1, obj_railparent))
{
    if (state == states.mach3 || state == states.mach2 || state == states.tumble)
        railmovespeed = approach(railmovespeed, 0, 0.1);
    else
        railmovespeed = approach(railmovespeed, 0, 0.5);
}

if (state != states.handstandjump && state != states.tumble)
    crouchslipbuffer = 0;

if (state != states.mach3)
    mach4mode = 0;

if (ratshootbuffer > 0)
    ratshootbuffer--;

if (state != states.animatronic)
{
    animatronic_buffer = 360;
    animatronic_collect_buffer = 0;
}

if (state == states.boxxedpep && grounded && vsp > 0)
    boxxedpepjump = boxxedpepjumpmax;

if (verticalbuffer > 0)
    verticalbuffer--;

if (superchargecombo_buffer > 0)
{
    superchargecombo_buffer--;
}
else if (superchargecombo_buffer == 0)
{
    superchargecombo_buffer = -1;
    global.combotime = 4;
}

if (state != states.normal)
    breakdance_speed = 0.25;

if (!grounded && (state == states.trickjump || state == states.jump || state == states.mach1 || state == states.mach2 || state == states.mach3) && input_check_pressed("jump") && global.noisejetpack == 1)
{
    vsp = -14;
    state = states.jetpackjump;
    sprite_index = spr_player_jetpackstart;
    doublejump = 0;
    
    with (instance_create(x, y, obj_highjumpcloud2))
        sprite_index = spr_null;
}

if (walljumpbuffer > 0)
    walljumpbuffer--;

if (grounded && vsp > 0 && state != states.noisejetpack)
    jetpackfuel = jetpackmax;

if (tauntstoredisgustavo)
{
    isgustavo = 1;
    
    if (state != states.backbreaker && state != states.Parry && state != states.graffiti)
        tauntstoredisgustavo = 0;
}

var splash_check = (state == states.freefall || state == states.freefallprep || state == states.freefallland || state == states.machroll || state == states.tumble) || vsp >= 15;

if (place_meeting(x, y, obj_water))
{
    if (!wet && vsp > 2)
    {
        event_play_oneshot("event:/SFX/misc/watersplash", x, y);
        instance_create(x, bbox_bottom, obj_watersplasheffect, 
        {
            image_index: splash_check ? 0 : 2
        });
    }
    
    wet = true;
}
else
{
    if (wet && vsp < 0)
    {
        event_play_oneshot("event:/SFX/misc/watersplashout", x, y);
        instance_create(x, bbox_bottom, obj_watersplasheffect, 
        {
            image_index: (state == states.fishdash) ? 0 : 2
        });
    }
    
    wet = false;
}

if (state != states.mach3 && (state != states.machslide || sprite_index != spr_mach3boost))
{
    launch = 0;
    launched = 0;
    launch_buffer = 0;
}

if (launch_buffer > 0)
    launch_buffer--;
else
    launched = 0;

if (state != states.finishingblow)
    finishingblow = 0;

if (dash_doubletap > 0)
    dash_doubletap--;

if (cow_buffer > 0)
    cow_buffer--;

if (state == states.lungeattack)
    lunge_buffer = 14;

if (blur_effect > 0)
{
    blur_effect--;
}
else if (breakdance_speed >= 0.6 || mach4mode == 1 || boxxeddash == 1 || state == states.ghost || state == states.tumble || state == states.ratmountbounce || state == states.ratmountattack || state == states.handstandjump || state == states.barrelslide || (state == states.grab && sprite_index == spr_swingding && swingdingdash <= 0) || (state == states.punch && (sprite_index == spr_breakdanceuppercut || sprite_index == spr_breakdanceuppercutend)) || state == states.freefall || state == states.lungeattack || (state == states.ladder && ladderfast == 1) || state == states.fishdash || state == states.Sjump || (state == states.punch && (sprite_index == spr_kungfu1 || sprite_index == spr_kungfu2 || sprite_index == spr_kungfu3 || sprite_index == spr_shotgunsuplexdash || sprite_index == spr_player_kungfujump || sprite_index == spr_kungfuair1transition || sprite_index == spr_kungfuair1 || sprite_index == spr_kungfuair2transition || sprite_index == spr_kungfuair2 || sprite_index == spr_kungfuair3transition || sprite_index == spr_kungfuair3)))
{
    if (visible && !place_meeting(x, y, obj_secretportal) && !place_meeting(x, y, obj_secretportalstart))
    {
        blur_effect = 2;
        
        with (create_blur_afterimage(x, y, sprite_index, image_index, xscale * scale_xs, image_yscale, image_angle))
            playerid = other.id;
    }
}

if (state != states.chainsaw && state != states.bump && state != states.boxxedpep && state != states.boxxedpepspin && state != states.boxxedpepjump)
{
    boxxed = 0;
    boxxeddash = 0;
}

if (state != states.grab)
    grabbingenemy = 0;

if (state != states.mach2 && state != states.mach3 && state != states.trickjump && state != states.ratmounttumble && state != states.ratmounttrickjump)
{
    ramp = 0;
    ramp_points = 0;
}

if (state != states.door && state != states.chainsaw && state != states.hit && place_meeting(x, y, obj_boxofpizza))
    state = states.crouch;

if (shoot_buffer > 0)
    shoot_buffer--;

if (cheesepep_buffer > 0)
    cheesepep_buffer--;

if (state != states.cheesepepstickside)
    yscale = 1;

if (invhurt_buffer > 0)
    invhurt_buffer--;

if (state == states.hurt)
{
    if (hurt_buffer > 0)
    {
        hurt_buffer--;
    }
    else
    {
        invhurt_buffer = invhurt_max;
        hurt_buffer = -1;
    }
}
else
{
    if (hurt_buffer > 0)
        invhurt_buffer = invhurt_max;
    
    hurt_buffer = -1;
}

if (room == Realtitlescreen && instance_exists(obj_mainmenuselect))
    state = states.titlescreen;

if (wallclingcooldown < 10)
    wallclingcooldown++;

if (!instance_exists(superchargedeffectid) && supercharged)
{
    var superchargeStates = [UnknownEnum.Value_2, UnknownEnum.Value_94, UnknownEnum.Value_105, UnknownEnum.Value_106, UnknownEnum.Value_123, UnknownEnum.Value_65];
    
    if (array_contains(superchargeStates, state))
    {
        with (instance_create(x + irandom_range(-25, 25), y + irandom_range(-10, 35), obj_superchargeeffect))
        {
            playerid = other.id;
            other.superchargedeffectid = id;
        }
    }
}

if (state != states.Sjump)
    sjumpvsp = -12;

if (state != states.freefall)
    freefallvsp = 20;

if (supercharge > 9 && state != states.backbreaker)
{
    if (!supercharged)
    {
        ini_open_from_string(obj_savesystem.ini_str);
        
        if (ini_read_real("Game", "supertaunt", false) == 0)
            scr_queueToolTipPrompt(string("[fa_middle][spr_transfopromptfont]{0}{1} Supertaunt", get_control_sprite("up"), get_control_sprite("taunt")));
        
        ini_close();
        event_play_oneshot("event:/sfx/misc/supertauntnotif");
    }
    
    supercharged = 1;
}

if (!instance_exists(pizzashieldid) && pizzashield == 1)
{
    with (instance_create(x, y, obj_pizzashield))
    {
        playerid = other.object_index;
        other.pizzashieldid = id;
    }
}

if (visible == false && state == states.comingoutdoor)
{
    coopdelay++;
    image_index = 0;
    
    if (coopdelay == 50)
    {
        visible = true;
        coopdelay = 0;
    }
}

if (global.coop == true)
{
    if ((state == states.punch || state == states.handstandjump) && !(obj_player2.state == states.punch || obj_player2.state == states.handstandjump))
        fightballadvantage = 1;
    else if (!(obj_player2.state == states.punch || obj_player2.state == states.handstandjump))
        fightballadvantage = 0;
}

if (state != states.pogo && state != states.backbreaker)
{
    pogospeed = 6;
    pogospeedprev = 0;
}

if (grounded)
    doublejump = 0;

if (pogochargeactive == 1)
{
    if (flashflicker == 0)
    {
        if (pogochargeactive == 1 && sprite_index == spr_null)
            sprite_index = spr_null;
        
        if (pogochargeactive == 1 && sprite_index == spr_null)
            sprite_index = spr_null;
    }
    
    flashflicker = 1;
    pogocharge--;
}
else
{
    flashflicker = 0;
}

if (state != states.throwing)
    kickbomb = 0;

if (pogocharge == 0)
{
    pogochargeactive = 0;
    pogocharge = 100;
}

if (flashflicker == 1)
{
    flashflickertime++;
    
    if (flashflickertime == 20)
    {
        flash = 1;
        flashflickertime = 0;
    }
}

if (state != states.mach3 && state != states.grabbed)
    fightball = 0;

if (state != states.grabbed && state != states.hurt)
{
    if (grounded && state != states.grabbing)
        suplexmove = 0;
}

var _state = (state == states.chainsaw || state == states.backbreaker) ? tauntstoredstate : state;

if (_state != states.freefall && _state != states.superslam)
    freefallsmash = -14;

if (state == states.gameover && y > (room_height * 2))
{
    scr_playerreset();
    
    with (instance_create(0, 0, obj_backtohub_fadeout))
        fadealpha = 0.9;
}

if (baddiegrabbedID == obj_null && (state == states.grab || state == states.superslam || state == states.tacklecharge))
    state = states.normal;

if (!(state == states.grab || state == states.superslam || state == states.mach2))
{
    baddiegrabbedID = obj_null;
    heavy = 0;
}

if (cutscene == 1 && state != states.gotoplayer)
    global.heattime = 60;

if (anger == 0)
    angry = 0;

if (anger > 0)
{
    angry = 1;
    anger -= 1;
}

if (sprite_index == spr_winding && state != states.normal)
    windingAnim = 0;

if (state != states.grab)
    swingdingbuffer = 0;

if (state == states.antigrav || state == states.rocket || state == states.rocketslide)
    grav = 0;
else if (state == states.barrel)
    grav = 0.6;
else if (state == states.ghost || state == states.fishswim || state == states.ghostpossess)
    grav = 0;
else if ((boxxed && state != states.boxxedpepspin) || state == states.waterfloat)
    grav = 0.3;
else if (state == states.jetpackjump)
    grav = 0.5;
else if (state == states.boxxedpepspin)
    grav = 0.6;
else
    grav = 0.5;

if (state == states.barrel && input_check_pressed("jump") && !jumpstop)
    grav = 0.4;

if (global.combo >= 25 && !instance_exists(angryeffectid) && state == states.normal && character != "V")
{
    with (instance_create(x, y, obj_angrycloud))
    {
        playerid = other.object_index;
        other.angryeffectid = id;
    }
}

if (object_index == obj_player1)
{
    if (global.combotimepause > 0)
        global.combotimepause--;
    
    if (global.combo != global.previouscombo)
    {
        global.previouscombo = global.combo;
        
        if ((global.combo % 5) == 0 && global.combo != 0)
        {
            instance_destroy(obj_combotitle);
            
            with (instance_create(x, y - 80, obj_combotitle))
                title = floor(global.combo / 5);
        }
    }
    
    if (!(state == states.door || state == states.tube || state == states.taxi || state == states.gottreasure || state == states.victory || state == states.gottreasure || state == states.actor || state == states.comingoutdoor || (state == states.fishhurt && fishthrown == true) || (state == states.knightpep && (sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder)) || instance_exists(obj_fadeout) || place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart)))
    {
        if (global.combotime > 0 && global.combotimepause <= 0)
            global.combotime -= 0.15;
    }
    
    if (global.heattime > 0)
        global.heattime -= 0.15;
    
    if (global.combotime <= 0 && global.combo != 0)
    {
        if (global.combo >= 50)
            tv_do_expression(spr_tv_exprheatcomboend);
        
        global.savedcombo = global.combo;
        global.combotime = 0;
        global.combo = 0;
        supercharge = 0;
    }
    
    if (global.heattime <= 0 && global.style > -1 && global.stylelock == 0)
        global.style -= 0.05;
}

if (coyote_time > 0)
    coyote_time--;

if (input_check_pressed("jump") && !grounded && (state == states.mach2 || state == states.mach3) && (state != (states.climbwall & walljumpbuffer)) <= 0)
    input_buffer_walljump = 24;

if (input_buffer_jump < 8)
    input_buffer_jump++;

if (input_buffer_secondjump < 8)
    input_buffer_secondjump++;

if (input_buffer_highjump < 8)
    input_buffer_highjump++;

if (input_attack_buffer > 0)
    input_attack_buffer--;

if (input_finisher_buffer > 0)
    input_finisher_buffer--;

if (input_up_buffer > 0)
    input_up_buffer--;

if (input_down_buffer > 0)
    input_down_buffer--;

if (input_buffer_walljump > 0)
    input_buffer_walljump--;

if (input_buffer_slap < 8)
    input_buffer_slap++;

if (key_particles == 1)
    create_particle(x + random_range(-25, 25), y + random_range(-35, 25), particle.keyparticles, 0);

if (inv_frames == 0 && hurted == 0 && state != states.ghost)
    image_alpha = 1;

if (state == states.punch || (state == states.jump && sprite_index == spr_null) || state == states.tacklecharge || state == states.skateboard || state == states.knightpep || state == states.cheesepep || state == states.knightpepslopes || state == states.knightpepattack || state == states.bombpep || state == states.facestomp || state == states.machfreefall || state == states.facestomp || state == states.mach3 || state == states.freefall || state == states.Sjump)
    attacking = 1;
else
    attacking = 0;

if (state == states.throwing || state == states.backkick || state == states.shoulder || state == states.uppunch)
    grabbing = 1;
else
    grabbing = 0;

if ((state == states.ratmountbounce && vsp >= 0) || state == states.fishdash || sprite_index == spr_player_Sjumpcancel || sprite_index == spr_swingding || sprite_index == spr_tumble || state == states.boxxedpepspin || state == states.trashroll || state == states.trashjump || state == states.shotgundash || (state == states.shotgunfreefall && (sprite_index == spr_shotgunjump2 || sprite_index == spr_shotgunjump3)) || state == states.Sjump || state == states.rocket || state == states.rocketslide || state == states.chainsawbump || state == states.punch || state == states.faceplant || state == states.rideweenie || state == states.mach3 || (state == states.jump && sprite_index == spr_null) || state == states.freefall || state == states.fireass || state == states.jetpackjump || state == states.firemouth || state == states.hookshot || state == states.jetpackjump || state == states.skateboard || state == UnknownEnum.Value_65 || state == states.Sjump || state == states.machfreefall || state == states.tacklecharge || (state == states.superslam && sprite_index == spr_piledriver) || state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes || state == states.trickjump || state == states.cheesepep || state == states.cheeseball || state == states.ratmounttumble || state == states.ratmountgroundpound || state == states.ratmountpunch || state == states.antigrav || ratmount_movespeed == 12 || state == states.slipbanan || state == states.shoulderbash || sprite_index == spr_mach3boost)
    instakillmove = 1;
else
    instakillmove = 0;

if (state == states.ratmountbounce && vsp < 0)
    stunmove = 1;
else
    stunmove = 0;

if (flash == 1 && alarm[0] <= 0)
    alarm[0] = 0.15 * room_speed;

if (state != states.ladder)
    hooked = 0;

if (state != states.mach3 && state != states.machslide)
    autodash = 0;

if ((state != states.jump && state != states.crouchjump && state != states.slap) || vsp < 0)
    fallinganimation = 0;

if (state != states.freefallland && state != states.normal && state != states.machslide && state != states.jump)
    facehurt = 0;

if (state != states.normal && state != states.machslide)
    machslideAnim = 0;

if (state != states.normal && state != states.ratmount)
{
    idle = 0;
    dashdust = 0;
}

if (state != states.mach1 && state != states.cheesepepjump && state != states.jump && state != states.hookshot && state != states.handstandjump && state != states.normal && state != states.mach2 && state != states.mach3 && state != states.freefallprep && state != states.knightpep && state != states.shotgun && state != states.knightpepslopes)
    momemtum = 0;

if (state != states.Sjump && state != states.Sjumpprep)
    a = 0;

if (state != states.facestomp)
    facestompAnim = 0;

if (state != states.freefall && state != states.facestomp && state != states.superslam && state != states.freefallland)
    superslam = 0;

if (state != states.mach2)
    machpunchAnim = 0;

if (ladderbuffer > 0)
    ladderbuffer--;

if (state != states.jump)
    stompAnim = 0;

var mach_effect_check = state == states.mach3 || state == states.Sjump || (freefallsmash >= 10 && state == states.freefall) || state == states.mach2 || ratmount_movespeed == 12;

if (!place_meeting(x, y, obj_secretportal) && !place_meeting(x, y, obj_secretportalstart))
{
    if (mach_effect_check)
    {
        if (macheffect == 0)
        {
            macheffect = 1;
            toomuchalarm1 = 6;
            create_mach3effect(x, y, sprite_index, image_index - 1, xscale * scale_xs, id, image_yscale);
        }
    }
    
    if (toomuchalarm1 > 0)
    {
        toomuchalarm1 -= 1;
        
        if (toomuchalarm1 <= 0 && mach_effect_check)
        {
            create_mach3effect(x, y, sprite_index, image_index - 1, xscale * scale_xs, id, image_yscale);
            toomuchalarm1 = 6;
        }
    }
}
else
{
    macheffect = 0;
}

if (!mach_effect_check)
    macheffect = 0;

if ((y > (room_height + 300) || y < -800) && !place_meeting(x, y, obj_verticalhallway) && !verticalhallway && state != states.gameover && state != states.backtohub && state != states.gotoplayer)
{
    visible = true;
    
    with (obj_camera)
    {
        shake_mag = 3;
        shake_mag_acc = 3 / room_speed;
    }
    
    if (state == states.ghostpossess)
    {
        state = states.ghost;
        sprite_index = spr_ghostidle;
    }
    
    var store_state = state;
    state = states.actor;
    visible = false;
    hsp = 0;
    vsp = 0;
    event_play_oneshot("event:/SFX/bo/groundpound", x, y);
    
    with (instance_create(x, y + obj_gameFrame.defaultheight, obj_technicaldifficulty))
    {
        storedState = store_state;
        playerid = other.id;
        
        if (!other.isgustavo)
            sprite = choose(spr_technicaldifficulty1, spr_technicaldifficulty2, spr_technicaldifficulty3, spr_technicaldifficulty4);
        else
            sprite = spr_technicaldifficulty_drown;
    }
    
    with (obj_ghostfollow)
    {
        x = xstart;
        y = ystart;
    }
    
    vsp = 10;
}

if (character == "S")
{
    if (state == states.crouchjump || state == states.crouch)
        state = states.normal;
}

if (character != "M")
{
    if (!scr_solid_player(x, y))
    {
        if (state != states.ratmountcrouch && state != states.boxxedpepjump && state != states.boxxedpepspin && !(state == states.bump && sprite_index == spr_tumbleend) && state != states.barrelslide && state != states.barrelclimbwall && sprite_index != spr_knightpepthunder && state != states.stunned && state != states.crouch && state != states.shotguncrouch && state != states.shotguncrouchjump && state != states.boxxedpep && state != states.pistol && sprite_index != spr_null && state != states.Sjumpprep && state != states.crouchslide && state != states.chainsaw && state != states.machroll && state != states.hurt && state != states.crouchjump && state != states.cheesepepstickup && state != states.cheesepepstickside && state != states.tumble)
            mask_index = spr_player_mask;
        else
            mask_index = spr_crouchmask;
    }
    else
    {
        mask_index = spr_crouchmask;
    }
}

if (state == states.gottreasure || sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder || state == states.keyget || state == states.chainsaw || state == states.door || state == states.ejected || state == states.victory || state == states.comingoutdoor || state == states.gameover || state == states.gotoplayer || state == UnknownEnum.Value_154 || state == states.actor || place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
    cutscene = 1;
else
    cutscene = 0;

if (((place_meeting(x, y, obj_door) && !place_meeting(x, y, obj_doorblocked)) || place_meeting(x, y, obj_taxi) || place_meeting(x, y, obj_dialognpc) || place_meeting(x, y, obj_dresser) || place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_filedoor) || place_meeting(x, y, obj_optiondoor) || (place_meeting(x, y, obj_startgate) && grounded && state != states.victory) || (place_meeting(x, y, obj_exitgate) && global.panic == true)) && !instance_exists(obj_uparrow) && scr_solid(x, y + 1) && state == states.normal && obj_player1.spotlight == 1)
{
    with (instance_create(x, y, obj_uparrow))
        playerid = other.object_index;
}

if (movespeed >= 12 && state == states.mach3 && !instance_exists(speedlineseffectid))
{
    with (instance_create(x, y, obj_speedlines))
    {
        playerid = other.object_index;
        other.speedlineseffectid = id;
    }
}

with (obj_ratblock)
    scr_ratblock_destroy();

scr_collide_destructibles();

if (state == states.tube || state == states.gotoplayer || state == states.debugstate)
{
    x += hsp;
    y += vsp;
}

if (state != states.firemove)
{
    angle = 0;
    firemovedir = 0;
}

if (state != states.comingoutdoor)
    image_blend = c_white;

prevstate = state;
prevsprite = sprite_index;

if (state != states.ghostpossess && state != states.gotoplayer && state != states.debugstate && state != states.titlescreen && state != states.tube && state != states.grabbed && state != states.door && state != states.ejected && state != states.comingoutdoor && state != states.boulder && state != states.keyget && state != states.victory && state != states.portal && state != states.timesup && state != states.gottreasure && state != states.gameover)
    scr_collide_player();

if (state == states.boulder)
    scr_collide_player();

if (place_meeting(x, y, obj_water))
{
    if (bubbleBuffer >= bubbleBufferMax)
    {
        bubbleBuffer = 0;
        bubbleBufferMax = irandom_range(25, 50);
        instance_create(x + random_range(-9, 9), y + random_range(-9, 9), obj_waterBubble);
    }
    
    bubbleBuffer++;
}
else
{
    bubbleBuffer = 0;
}

if (state == states.waterfloat && place_meeting(x, y, obj_water))
{
    if (drownBuffer < drownBufferMax)
    {
        drownBuffer++;
        trace(drownBuffer);
    }
    else
    {
        visible = false;
        drownBuffer = 0;
        wet = false;
        
        with (obj_camera)
        {
            shake_mag = 3;
            shake_mag_acc = 3 / room_speed;
        }
        
        if (state == states.ghostpossess)
        {
            state = states.ghost;
            sprite_index = spr_ghostidle;
        }
        
        state = states.actor;
        hsp = 0;
        vsp = 0;
        mail_trigger(UnknownEnum.Value_9);
        event_play_oneshot("event:/SFX/bo/drown", x, y);
        
        with (instance_create(x, y + obj_gameFrame.defaultheight, obj_technicaldifficulty))
        {
            playerid = other.id;
            
            if (!other.isgustavo)
                sprite = choose(spr_technicaldifficulty_drown);
            else
                sprite = spr_technicaldifficulty_drown;
        }
        
        with (instance_create(x, y, obj_playerDrown))
        {
            sprite_index = spr_player_drown;
            buffer = 100;
            vsp = 0;
            hsp = 0;
        }
        
        with (obj_ghostfollow)
        {
            x = xstart;
            y = ystart;
        }
        
        vsp = 10;
    }
}
else
{
    drownBuffer = 0;
}
