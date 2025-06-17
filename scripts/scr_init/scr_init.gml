enum states 
{
	// for some reason the sbn devs added these
	// but its just eggplant states, just shifted by two
	unknown0 = 0,
	unknown1 = 1,
	
	normal = 2,
	revolver = 3,
	dynamite = 4,
	boots = 5,
	grabbed = 6,
	tumble = 7,
	finishingblow = 8,
	ejected = 9,
	transitioncutscene = 10,
	fireass = 11,
	firemouth = 12,
	mort = 13,
	mortjump = 14,
	mortattack = 15,
	morthook = 16,
	hook = 17,
	ghost = 18,
	ghostpossess = 19,
	titlescreen = 20,
	hookshot = 21,
	tacklecharge = 22,
	cheeseball = 23,
	cheeseballclimbwall = 24,
	slap = 25,
	cheesepep = 26,
	cheesepepstick = 27,
	cheesepepjump = 28,
	cheesepepfling = 29,
	cheesepeplaunch = 30,
	cheesepepstickside = 31,
	cheesepepstickup = 32,
	rideweenie = 33,
	motorcycle = 34,
	boxxedpep = 35,
	boxxedpepspin = 36,
	boxxedpepjump = 37,
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
	gottreasure = 48,
	knightpep = 49,
	knightpepattack = 50,
	knightpepbump = 51,
	meteorpep = 52,
	bombpep = 53,
	bombgrab = 54,
	bombpepside = 55,
	bombpepup = 56,
	grabbing = 57,
	chainsawpogo = 58,
	shotgunjump = 59,
	pogo = 60,
	stunned = 61,
	highjump = 62,
	chainsaw = 63,
	facestomp = 64,
	timesup = 66,
	machroll = 67,
	shotgun = 68,
	shotguncrouch = 69,
	shotguncrouchjump = 70,
	shotgunshoot = 71,
	shotgundash = 72,
	shotgunfreefall = 73,
	pistol = 74,
	machfreefall = 75,
	throwing = 76,
	slam = 77,
	superslam = 78,
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
	pizzathrow = 89,
	bossintro = 90,
	gameover = 91,
	keyget = 92,
	tackle = 93,
	jump = 94,
	ladder = 95,
	slipnslide = 96,
	comingoutdoor = 97,
	smirk = 98,
	Sjump = 99,
	victory = 100,
	Sjumpprep = 101,
	crouch = 102,
	crouchjump = 103,
	crouchslide = 104,
	mach1 = 105,
	mach2 = 106,
	machslide = 107,
	bump = 108,
	hurt = 109,
	freefall = 110,
	hang = 111,
	turning = 112,
	freefallland = 113,
	door = 114,
	barrel = 115,
	barreljump = 116,
	barrelclimbwall = 117,
	barrelslide = 118,
	current = 119,
	boulder = 120,
	taxi = 121,
	runonball = 122,
	mach3 = 123,
	freefallprep = 124,
	Sjumpland = 125,
	faceplant = 126,
	
	// Enemy States
	rage = 127,
	idle = 128,
	bounce = 129,
	charge = 130,
	pizzagoblinthrow = 131,
	turn = 132,
	hitceiling = 133,
	hitwall = 134,
	unknown_1 = 135,
	walk = 136,
	fall = 137,
	land = 138,
	hit = 139,
	stun = 140,
	recovery = 141,
	stomped = 142,
	chase = 143,
	spawnenemy = 144,
	arena = 145,
	arenaintro = 146,
	arenaround = 147,
	
	actor = 148,
	Parry = 149,
	golf = 150,
	float = 151,
	tube = 152,
	unused_2 = 153,
	policetaxi = 154,
	shoulderbash = 155,
	pummel = 156,
	staggered = 157,
	thrown = 158,
	boss_supershoulderbash = 159,
	boss_superattackstart = 160,
	boss_superattackcharge = 161,
	boss_superattack = 162,
	boss_shoulderturn = 163,
	boss_fistmatch = 164,
	boss_fistmatchend = 165,
	boss_groundpunchstart = 166,
	slipbanan = 167,
	boss_millionpunch = 168,
	boss_skateboardturn = 169,
	boss_bombkick = 170,
	boss_bombpogo = 171,
	boss_jetpackstart = 172,
	boss_jetpack = 173,
	boss_jetpackcancel = 174,
	boss_jetpackspin = 175,
	boss_shield = 176,
	boss_helicopterhat = 177,
	boss_panicjump = 178,
	boss_smokebombstart = 179,
	boss_smokebombcrawl = 180,
	boss_springshoes = 181,
	boss_cardboard = 182,
	boss_cardboardend = 183,
	boss_mockery = 184,
	bombdelete = 185,
	rocket = 186,
	rocketslide = 187,
	gotoplayer = 188,
	trickjump = 189,
	totem = 190,
	underground = 191,
	ridecow = 192,
	ratmount = 193,
	ratmountjump = 194,
	ratmountattack = 195,
	ratmountspit = 196,
	ratmountclimbwall = 197,
	ratmounthurt = 198,
	ratmountgroundpound = 199,
	ratmountbounce = 200,
	unused_3 = 201,
	ratmountballoon = 202,
	ratmounttumble = 203,
	ratmountgrind = 204,
	ratmounttrickjump = 205,
	ratmountskid = 206,
	ratgrabbed = 207,
	blockstance = 208,
	balloon = 209,
	debugstate = 210,
	trashjumpprep = 211,
	trashjump = 212,
	trashroll = 213,
	stringfling = 214,
	stringjump = 215,
	stringfall = 216,
	noisejetpack = 217,
	spiderweb = 218,
	robotidle = 219,
	robotintro = 220,
	robotroaming = 221,
	robotchase = 222,
	robotinvestigate = 223,
	robotseeking = 224,
	flushidle = 225,
	flushtransition = 226,
	animatronic = 227,
	pizzaface_moustache = 228,
	pizzaface_mouth = 229,
	pizzaface_eyes = 230,
	pizzaface_nose = 231,
	pizzaface_ram = 232,
	pizzaface_phase2transition = 233,
	pizzahead_look = 234,
	pizzahead_fishing = 235,
	unused_4 = 236,
	pizzahead_bombrun = 237,
	pizzahead_npcthrow = 238,
	pizzahead_portraitthrow = 239,
	pizzahead_enguarde = 240,
	pizzahead_sexypicture = 241,
	pizzahead_pullinglevel = 242,
	pizzahead_eat = 243,
	pizzahead_surprisebox = 244,
	pizzahead_spinningrun = 245,
	pizzahead_spinningkick = 246,
	pizzahead_spinningpunch = 247,
	pizzahead_groundpunch = 248,
	pizzahead_bigkick = 249,
	pizzahead_slamhead = 250,
	pizzahead_slamhead2 = 251,
	tv_whitenoise = 252,
	tv_expression = 253,
	playersuperattack = 254,
	unused_5 = 255,
	jetpackjump = 256,
	unused_6 = 257,
	unused_7 = 258,
	bee = 259,
	unused_8 = 260,
	ratmountpunch = 261,
	ratmountcrouch = 262,
	ratmountladder = 263,
	unused_9 = 264,
	unused_10 = 265,
	magnet = 266,
	antigrav = 267,
	secret = 268,
	
	// SBN states
	firemove = 269,
	fishswim = 270,
	fishdash = 271,
	fishground = 272,
	fishhurt = 273,
	waterfloat = 274,
	backtohub = 275,
	oilcutscene = 276
}

randomize();
global.ControlPrompt = "";
global.TransfoPrompt = "";
global.DebugMode = false;

for (var i = 0; i < parameter_count(); i++)
{
    if (string_letters(parameter_string(i)) == "debug")
        global.DebugMode = true;
}

global.bigfont = __scribble_font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.:!0123456789?'", true, 0);
global.grannyfont = __scribble_font_add_sprite_ext(spr_font_granny, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!?,.:-_'`¬()", true, 1);
global.tutorialfont = __scribble_font_add_sprite_ext(spr_tutorialfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!,.:1234567890", true, 0);
global.collectfont = __scribble_font_add_sprite_ext(spr_font_collect, "0123456789", true, 0);
global.combofont = __scribble_font_add_sprite_ext(spr_null, "0123456789/:", true, 0);
global.combofont2 = __scribble_font_add_sprite_ext(spr_font_combobubble, "1234567890", true, 0);
global.timerfont = __scribble_font_add_sprite_ext(spr_font_timer, "1234567890:.", true, 0);
global.smallnumber_fnt = __scribble_font_add_sprite_ext(spr_smallnumber, "1234567890-", true, 0);
global.escapetimerfont = __scribble_font_add_sprite_ext(spr_font_escapetimer, "1234567890:", true, 0);
global.transfopromptfont = __scribble_font_add_sprite_ext(spr_transfopromptfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!?',.:-()1234567890", true, 0);
global.menuperfont = __scribble_font_add_sprite_ext(spr_percentfont, "1234567890.F", true, -1);

function scr_init_options()
{
    ini_open("saveData.ini");
    global.option_fullscreen = ini_read_real("Option", "fullscreen", 1);
    global.option_resolution = ini_read_real("Option", "resolution", 1);
    global.option_aspect_ratio = ini_read_real("Option", "aspect_ratio", 0);
    global.option_texfilter = ini_read_real("Option", "texfilter", 1);
    global.option_focusmute = ini_read_real("Option", "focusmute", 1);
    global.option_master_volume = ini_read_real("Option", "master_volume", 1);
    global.option_music_volume = ini_read_real("Option", "music_volume", 1);
    global.option_sfx_volume = ini_read_real("Option", "sfx_volume", 1);
    global.option_vibration = ini_read_real("Option", "vibration", 1);
    global.option_vsync = ini_read_real("Option", "vsync", 0);
    global.option_screenshake = ini_read_real("Option", "screenshake", 1);
    global.option_timer = ini_read_real("Option", "timer", 1);
    global.option_timer_type = ini_read_real("Option", "timer_type", 0);
    global.option_timer_speedrun = ini_read_real("Option", "timer_speedrun", 0);
    global.option_hud = ini_read_real("Option", "hud", 1);
    global.option_sjump_key = ini_read_real("Option", "sjumpkey", 0);
    global.option_sjump_gp = ini_read_real("Option", "sjumpgp", 0);
    global.option_groundpound_key = ini_read_real("Option", "groundpoundkey", 0);
    global.option_groundpound_gp = ini_read_real("Option", "groundpoundgp", 0);
    global.hasFINALLYSUPERTAUNTED = false;
    global.option_secret_greenifier = ini_read_real("Option", "secret_greenifier", 0);
    global.option_secret_cathud = ini_read_real("Option", "secret_cathud", 0);
    global.option_secret_realistic = ini_read_real("Option", "secret_realistic", 0);
    global.option_secret_rpg = ini_read_real("Option", "secret_rpg", 0);
    global.option_secret_auto = ini_read_real("Option", "secret_auto", 0);
    ini_close();
    display_reset(0, global.option_vsync);
}

function scr_init()
{
    global.coop = false;
    global.currentsavefile = 1;
    global.mach_color1 = make_colour_rgb(255, 132, 231);
    global.mach_color2 = make_colour_rgb(237, 255, 132);
    global.afterimage_color1 = make_colour_rgb(255, 0, 0);
    global.afterimage_color2 = make_colour_rgb(0, 255, 0);
    global.smallnumber_color1 = make_colour_rgb(255, 255, 255);
    global.smallnumber_color2 = make_colour_rgb(248, 0, 0);
    global.optimize = 0;
    global.autotile = 1;
    global.pigreduction = 0;
    global.pigtotal = 0;
    global.levelcomplete = 0;
    global.levelcompletename = -4;
    global.midwaytreasure = 0;
    global.watertreasure = 0;
    global.newtoppin[0] = 0;
    global.newtoppin[1] = 0;
    global.newtoppin[2] = 0;
    global.newtoppin[3] = 0;
    global.newtoppin[4] = 0;
    global.loadeditor = 0;
    pal_swap_init_system(shd_pal_swapper);
    gamesave_async_load();
    global.rank = "none";
    global.lastrank = "none";
    global.throwarc = 1;
    global.hidetiles = 0;
    global.leveltosave = -4;
    global.leveltorestart = -4;
    global.combodropped = 0;
    global.tauntcount = 0;
    global.RedCoinMax = 600;
    global.saveroom = ds_list_create();
    global.escaperoom = ds_list_create();
    global.lap = 0;
    global.timeattack = 0;
    global.laps = 0;
    global.playerhealth = 100;
    global.instancelist = ds_list_create();
    global.followerlist = ds_list_create();
    global.maxrailspeed = 2;
    global.railspeed = global.maxrailspeed;
    global.levelreset = 0;
    global.temperature = 0;
    global.temperature_spd = 0.01;
    global.temp_thresholdnumber = 5;
    global.use_temperature = 0;
    global.timedgatetimer = 0;
    global.timedgatetime = 0;
    global.key_inv = 0;
    global.shroomfollow = 0;
    global.cheesefollow = 0;
    global.tomatofollow = 0;
    global.sausagefollow = 0;
    global.pineapplefollow = 0;
    global.secretfollow = 0;
    global.pepanimatronic = 0;
    global.keyget = 0;
    global.collect = 0;
    global.collectN = 0;
    global.treasure = 0;
    global.combo = 0;
    global.previouscombo = 0;
    global.combotime = 0;
    global.comboscore = 0;
    global.combotimepause = 0;
    global.savedcomboscore = 0;
    global.savedcombo = 0;
    global.heattime = 0;
    global.pizzacoin = 0;
    global.toppintotal = 1;
    global.hit = 0;
    global.baddieroom = ds_list_create();
    global.hp = 2;
    global.gotshotgun = 0;
    global.showgnomelist = 1;
    global.panic = false;
    global.snickchallenge = 0;
    global.golfhit = 0;
    global.oiled = false;
    global.marinatecount = 0;
    global.grinds = 0;
    global.redcoincount = 0;
    global.twoliterpain = false;
    set_option_params();
    
    if (global.option_secret_cathud)
        instance_create(0, 0, obj_cathud);
    
    if (global.option_secret_greenifier)
        instance_create(0, 0, obj_greenifier);
    
    instance_create(0, 0, obj_discord);
    
    if (global.DebugMode)
    {
        instance_create(0, 0, obj_shell, 
        {
            closeFunction: scr_shell_closeconsole,
            openFunction: scr_shell_openconsole,
            openKey: 117,
            screenAnchorPointV: "top",
            prompt: "how bo ",
            saveHistory: true,
            savedHistoryMaxSize: 50
        });
    }
    
    global.style = -1;
    global.secretfound = 0;
    global.shotgunammo = 0;
    global.monsterspeed = 0;
    global.monsterlives = 3;
    global.giantkey = 0;
    global.coop = false;
    global.baddiespeed = 1;
    global.baddiepowerup = 0;
    global.baddierage = 0;
    global.style = 0;
    global.stylethreshold = 0;
    global.pizzadelivery = 0;
    global.failcutscene = 0;
    global.pizzasdelivered = 0;
    global.spaceblockswitch = 1;
    global.gerome = 0;
    global.bullet = 0;
    global.fuel = 3;
    global.font_console = font0;
    global.ammorefill = 0;
    global.ammoalt = 1;
    global.mort = 0;
    global.stylelock = 0;
    global.attackstyle = 0;
    global.pummeltest = 1;
    global.doubleenem = 0;
    global.shithud = 0;
    global.showing_collisions = 0;
    global.performance_mode = 0;
    global.horse = 0;
    global.checkpoint_room = -4;
    global.checkpoint_door = "A";
    global.kungfu = 0;
    global.graffiticount = 0;
    global.graffitimax = 20;
    global.noisejetpack = 0;
    global.hasfarmer = array_create(3, 0);
    global.savedattackstyle = -4;
    global.bobby_x = -100;
    global.bobby_y = -100;
    global.bobbydead = false;
}

function scr_init_saveData()
{
    ini_open_from_string(obj_savesystem.ini_str);
    global.file_minutes = ini_read_real("Game", "minutes", 0);
    global.file_seconds = ini_read_real("Game", "seconds", 0);
    global.bobby_x = ini_read_real("Game", "bobbyX", -100);
    global.bobby_y = ini_read_real("Game", "bobbyY", -100);
    global.bobbydead = global.bobby_x != -100 || global.bobby_y != -100;
    ini_close();
    global.speakerbox = [false, false];
    scr_initMail();
}
