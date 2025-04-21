targetplayer = global.coop ? instance_nearest(x, y, obj_player1) : obj_player1;

if (hp <= 0 && state != UnknownEnum.Value_147)
{
    if (!destroyed && !thrown && !destroyable)
        boss_destroy(lastplayerid);
}

switch (state)
{
    case UnknownEnum.Value_147:
        grav = 0.5;
        state_boss_arenaround();
        break;
    
    case states.normal:
        grav = 0.5;
        boss_mrstick_normal();
        break;
    
    case states.shield:
        grav = 0.5;
        boss_mrstick_shield();
        break;
    
    case UnknownEnum.Value_177:
        grav = 0.5;
        boss_mrstick_helicopterhat();
        break;
    
    case UnknownEnum.Value_178:
        grav = 0.5;
        boss_mrstick_panicjump();
        break;
    
    case states.jump:
        grav = 0.5;
        boss_mrstick_jump();
        break;
    
    case UnknownEnum.Value_179:
        grav = 0.5;
        boss_mrstick_smokebombstart();
        break;
    
    case UnknownEnum.Value_180:
        grav = 0.5;
        boss_mrstick_smokebombcrawl();
        break;
    
    case UnknownEnum.Value_181:
        grav = 0.5;
        boss_mrstick_springshoes();
        break;
    
    case UnknownEnum.Value_182:
        grav = 0.5;
        boss_mrstick_cardboard();
        break;
    
    case UnknownEnum.Value_183:
        grav = 0.5;
        boss_mrstick_cardboardend();
        break;
    
    case UnknownEnum.Value_184:
        grav = 0.5;
        boss_mrstick_mockery();
        break;
    
    case states.walk:
        grav = 0.5;
        state_boss_walk(boss_mrstick_decide_attack);
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

colliding = !(state == states.jump || state == UnknownEnum.Value_182 || state == UnknownEnum.Value_183);
attacking = state == states.shield || state == states.jump || state == UnknownEnum.Value_182 || state == UnknownEnum.Value_183 || state == UnknownEnum.Value_179;
