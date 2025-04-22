targetplayer = global.coop ? instance_nearest(x, y, obj_player1) : obj_player1;

if (hp <= 0 && state != UnknownEnum.Value_147)
{
    if (!destroyed && !thrown && !destroyable)
        boss_destroy(lastplayerid);
}

if (chooseparry_buffer > 0)
    chooseparry_buffer--;

if ((state == states.handstandjump || state == states.crouchslide || state == UnknownEnum.Value_169 || state == UnknownEnum.Value_173 || state == UnknownEnum.Value_175 || (state == states.pogo && pogochargeactive) || state == states.skateboard) && alarm[0] <= 0)
    alarm[0] = 6;

switch (state)
{
    case UnknownEnum.Value_147:
        grav = 0.5;
        state_boss_arenaround();
        movespeed = 0;
        inv_timer = 2;
        invincible = 1;
        break;
    
    case states.normal:
        grav = 0.5;
        boss_noise_normal();
        break;
    
    case states.bump:
        grav = 0.5;
        state_boss_bump();
        break;
    
    case states.handstandjump:
        grav = 0.5;
        boss_noise_handstandjump();
        break;
    
    case states.crouchslide:
        grav = 0.5;
        boss_noise_crouchslide();
        break;
    
    case states.skateboard:
        grav = 0.5;
        boss_noise_skateboard();
        break;
    
    case UnknownEnum.Value_169:
        grav = 0.5;
        boss_noise_skateboardturn();
        break;
    
    case states.jump:
        grav = 0.5;
        boss_noise_jump();
        break;
    
    case states.throwing:
        grav = 0.5;
        boss_noise_throwing();
        break;
    
    case states.pogo:
        grav = 0.5;
        boss_noise_pogo();
        break;
    
    case UnknownEnum.Value_172:
        grav = 0.5;
        boss_noise_jetpackstart();
        break;
    
    case UnknownEnum.Value_173:
        grav = 0.5;
        boss_noise_jetpack();
        break;
    
    case UnknownEnum.Value_175:
        grav = 0.5;
        boss_noise_jetpackspin();
        break;
    
    case enemystates.walk:
        grav = 0.5;
        state_boss_walk(boss_noise_do_attack);
        inv_timer = 2;
        invincible = 1;
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
    
    case enemystates.hit:
        grav = 0.5;
        scr_enemy_hit();
        stunned = targetstunned;
        break;
    
    case enemystates.stun:
        grav = 0.5;
        state_boss_stun();
        break;
}

angry = phase > 6;
attacking = state == states.handstandjump || state == states.crouchslide || state == states.skateboard || state == UnknownEnum.Value_169 || state == states.pogo || state == UnknownEnum.Value_172 || state == UnknownEnum.Value_173 || state == UnknownEnum.Value_175 || state == states.throwing;
