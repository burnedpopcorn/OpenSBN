targetplayer = global.coop ? instance_nearest(x, y, obj_player1) : obj_player1;

if (obj_bosscontroller.state == states.arenaintro)
    exit;

if (hp <= 0 && state != UnknownEnum.Value_147 && state != UnknownEnum.Value_164)
{
    if (!thrown && !destroyable)
        boss_destroy(lastplayerid);
}

image_speed = 0.35;

if (knightbuffer > 0)
    knightbuffer--;

switch (phase)
{
    case 0:
        normal_func = boss_garpo_phase1normal;
        break;
    
    case 1:
        normal_func = boss_pizzahead_phase2normal;
        break;
    
    case 2:
        normal_func = boss_pizzahead_phase3normal;
        break;
}

switch (state)
{
    case UnknownEnum.Value_147:
        grav = 0.5;
        break;
    
    case states.normal:
        grav = 0.5;
        normal_func();
        break;
    
    case UnknownEnum.Value_232:
        grav = 0.5;
        boss_garpo_ram();
        break;
    
    case UnknownEnum.Value_228:
        grav = 0.5;
        boss_garpo_moustache();
        break;
    
    case UnknownEnum.Value_230:
        grav = 0.5;
        boss_garpo_eyes();
        break;
    
    case UnknownEnum.Value_229:
        grav = 0.5;
        boss_garpo_mouth();
        break;
    
    case UnknownEnum.Value_231:
        grav = 0.5;
        boss_garpo_nose();
        break;
    
    case UnknownEnum.Value_233:
        boss_garpo_phase2transition();
        break;
    
    case UnknownEnum.Value_234:
        boss_pizzahead_look();
        break;
    
    case UnknownEnum.Value_235:
        boss_pizzahead_fishing();
        break;
    
    case UnknownEnum.Value_237:
        boss_pizzahead_bombrun();
        break;
    
    case UnknownEnum.Value_238:
        boss_pizzahead_npcthrow();
        break;
    
    case UnknownEnum.Value_239:
        boss_pizzahead_portraitthrow();
        break;
    
    case UnknownEnum.Value_240:
        boss_pizzahead_enguarde();
        break;
    
    case UnknownEnum.Value_241:
        boss_pizzahead_sexypicture();
        break;
    
    case UnknownEnum.Value_242:
        boss_pizzahead_pullinglevel();
        break;
    
    case UnknownEnum.Value_243:
        boss_pizzahead_eat();
        break;
    
    case UnknownEnum.Value_244:
        boss_pizzahead_surprisebox();
        break;
    
    case UnknownEnum.Value_245:
        boss_pizzahead_spinningrun();
        break;
    
    case UnknownEnum.Value_246:
        boss_pizzahead_spinningkick();
        break;
    
    case UnknownEnum.Value_247:
        boss_pizzahead_spinningpunch();
        break;
    
    case UnknownEnum.Value_248:
        boss_pizzahead_groundpunch();
        break;
    
    case UnknownEnum.Value_249:
        boss_pizzahead_bigkick();
        break;
    
    case UnknownEnum.Value_250:
        boss_pizzahead_slamhead();
        break;
    
    case UnknownEnum.Value_251:
        boss_pizzahead_slamhead2();
        break;
    
    case states.walk:
        grav = 0.5;
        
        if (grounded)
            state = states.normal;
        
        invincible = 1;
        inv_timer = 2;
        break;
    
    case states.chainsaw:
        grav = 0.5;
        state_boss_chainsaw();
        break;
    
    case states.backbreaker:
        grav = 0.5;
        state_boss_taunt();
        invincible = 1;
        inv_timer = 2;
        break;
    
    case states.Parry:
        grav = 0.5;
        state_boss_parry();
        invincible = 1;
        inv_timer = 2;
        break;
    
    case states.hit:
        grav = 0.5;
        scr_enemy_hit();
        stunned = 30;
        break;
    
    case states.stun:
        grav = 0.5;
        state_boss_stun();
        break;
}

if (phase == 0 && state != UnknownEnum.Value_232)
    invincible = 1;
else
    invincible = 0;

attacking = state == UnknownEnum.Value_232 || state == UnknownEnum.Value_231 || state == UnknownEnum.Value_246 || state == UnknownEnum.Value_247 || state == UnknownEnum.Value_248 || state == UnknownEnum.Value_250 || state == UnknownEnum.Value_251;
colliding = state != UnknownEnum.Value_232;

if (phase > 0)
{
    mask_index = spr_pizzahead_giddy;
    stunfallspr = spr_pizzahead_giddy;
    walkspr = spr_pizzahead_giddy;
}
