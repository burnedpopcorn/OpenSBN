targetplayer = global.coop ? instance_nearest(x, y, obj_player1) : obj_player1;

if (obj_bosscontroller.state == states.arenaintro)
    exit;

if (hp <= 0 && state != UnknownEnum.Value_147 && state != UnknownEnum.Value_164)
{
    if (!thrown && !destroyable)
        boss_destroy(lastplayerid);
}

if (chooseparry_buffer > 0)
    chooseparry_buffer--;

switch (phase)
{
    case 1:
    case 2:
        normal_func = boss_pepperman_normal;
        break;
    
    case 3:
    case 4:
    case 5:
    case 6:
        normal_func = boss_pepperman_phase3normal;
        break;
}

switch (state)
{
    case UnknownEnum.Value_147:
        grav = 0.5;
        state_boss_arenaround();
        break;
    
    case states.normal:
        grav = 0.5;
        normal_func();
        break;
    
    case states.jump:
        grav = 0.5;
        boss_pepperman_jump();
        invincible = 1;
        inv_timer = 2;
        break;
    
    case states.freefall:
        grav = 0.5;
        boss_pepperman_freefall();
        break;
    
    case states.freefallland:
        grav = 0.5;
        boss_pepperman_freefallland();
        break;
    
    case states.freefallprep:
        grav = 0.5;
        boss_pepperman_freefallprep();
        break;
    
    case states.shoulderbash:
        grav = 0.5;
        boss_pepperman_shoulderbash();
        break;
    
    case UnknownEnum.Value_159:
        grav = 0.5;
        boss_pepperman_supershoulderbash();
        break;
    
    case UnknownEnum.Value_160:
        grav = 0.5;
        boss_pepperman_superattackstart();
        break;
    
    case UnknownEnum.Value_161:
        grav = 0.5;
        boss_pepperman_superattackcharge();
        break;
    
    case states.superslam:
        grav = 0.5;
        boss_pepperman_superslam();
        break;
    
    case UnknownEnum.Value_164:
        grav = 0.5;
        boss_pepperman_fistmatch();
        break;
    
    case UnknownEnum.Value_165:
        grav = 0.5;
        boss_pepperman_fistmatchend();
        break;
    
    case states.shoulder:
        grav = 0.5;
        boss_pepperman_shoulder();
        break;
    
    case UnknownEnum.Value_163:
        grav = 0.5;
        boss_pepperman_shoulderturn();
        break;
    
    case states.walk:
        grav = 0.5;
        state_boss_walk(boss_pepperman_decide_attack);
        invincible = 1;
        inv_timer = 2;
        break;
    
    case UnknownEnum.Value_130:
        grav = 0.5;
        boss_pepperman_charge();
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
        stunned = targetstunned;
        break;
    
    case states.stun:
        grav = 0.5;
        state_boss_stun();
        break;
}

xscale = image_xscale;
colliding = !(state == states.superslam || state == UnknownEnum.Value_164 || state == UnknownEnum.Value_160 || state == UnknownEnum.Value_161);
attacking = state == states.shoulderbash || state == states.freefall || state == states.freefallprep || state == UnknownEnum.Value_159 || state == states.shoulder || state == states.superslam || state == UnknownEnum.Value_164 || state == UnknownEnum.Value_160 || state == UnknownEnum.Value_161 || state == states.walk;
