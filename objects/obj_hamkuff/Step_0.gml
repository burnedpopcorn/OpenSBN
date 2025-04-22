if (room == rm_blank)
    exit;

switch (state)
{
    case enemystates.idle:
        scr_enemy_idle();
        break;
    
    case enemystates.turn:
        scr_enemy_turn();
        break;
    
    case enemystates.walk:
        break;
    
    case states.blockstance:
        if (!instance_exists(playerid))
        {
            state = enemystates.walk;
            break;
        }
        else
        {
            if (x != playerid.x)
                image_xscale = -sign(x - playerid.x);
            
            var _is_brick = playerid.object_index == obj_brickcomeback;
            
            if (!_is_brick)
            {
                with (playerid)
                {
                    if (state == UnknownEnum.Value_154)
                    {
                        other.state = enemystates.walk;
                    }
                    else if (!launched)
                    {
                        var _xs = 0;
                        
                        if (x != other.x)
                            _xs = -sign(x - other.x);
                        
                        var dis = (abs(hsp) < 12) ? 100 : 180;
                        var m = (abs(x - other.x) > dis) ? abs(hsp) : (abs(hsp) - max(0, abs(hsp) - 2));
                        
                        if (hsp == 0)
                            m = _xs;
                        
                        if (!(state == states.machslide && sprite_index == spr_mach3boost))
                            hsp_carry = _xs * abs(m);
                        else
                            hsp_carry = -hsp;
                        
                        if (state == states.mach3 || (state == states.machslide && sprite_index == spr_mach3boost))
                            launch = 1;
                        
                        if (state == states.machslide && sprite_index == spr_mach3boost && launch)
                            movespeed -= 0.6;
                        
                        freefallsmash = 0;
                        
                        if (state == states.grind || state == states.climbwall || state == states.Sjumpprep || state == states.Sjump || state == states.Sjumpland || y < (other.y - 400))
                        {
                            vsp = -4;
                            hsp = -3 * xscale;
                            state = states.bump;
                            sprite_index = spr_bump;
                            image_index = 0;
                        }
                        
                        if (distance_to_object(other) > 300)
                        {
                            other.attract_player = 1;
                            launched = 0;
                        }
                        else if (other.attract_player && x == other.x && y == other.y)
                        {
                            launched = 0;
                            other.attract_player = 0;
                            state = states.normal;
                        }
                        
                        if (other.attract_player)
                        {
                            launched = 0;
                            x = other.x;
                            y = other.y;
                            sprite_index = spr_machfreefall;
                            state = states.jump;
                            other.attract_player = 0;
                        }
                        
                        if (launched)
                        {
                            other.state = enemystates.walk;
                            instance_destroy(other);
                            global.combotime = 60;
                        }
                    }
                }
                
                if (playerid.launch)
                    sprite_index = spr_hamkuff_chain2;
                else
                    sprite_index = spr_hamkuff_chain1;
            }
            else
            {
                with (playerid)
                {
                    var tx = other.x + (other.image_xscale * 32);
                    var ty = other.y;
                    
                    if (distance_between_points(x, y, tx, ty) > 10)
                    {
                        var _dir = point_direction(x, y, tx, ty);
                        x += lengthdir_x(10, _dir);
                        y += lengthdir_y(10, _dir);
                    }
                }
            }
            
            break;
        }
    
    case enemystates.land:
        scr_enemy_land();
        break;
    
    case enemystates.hit:
        scr_enemy_hit();
        break;
    
    case enemystates.stun:
        scr_enemy_stun();
        break;
    
    case enemystates.pthrow:
        scr_pizzagoblin_throw();
        break;
    
    case enemystates.grabbed:
        scr_enemy_grabbed();
        break;
    
    case enemystates.pummel:
        scr_enemy_pummel();
        break;
    
    case enemystates.staggered:
        scr_enemy_staggered();
        break;
    
    case enemystates.rage:
        scr_enemy_rage();
        break;
    
    case enemystates.ghostpossess:
        scr_enemy_ghostpossess();
        break;
}

if (state == enemystates.stun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != enemystates.walk)
    attract_player = 0;

var _dis = 300;

if (state == enemystates.walk && obj_player1.isgustavo && !obj_player1.cutscene && obj_player1.state != states.taxi && ((distance_to_object(obj_player1) < _dis && obj_player1.brick) || distance_to_object(obj_ratmountgroundpound) < _dis || (distance_to_object(obj_brickcomeback) < _dis && instance_exists(obj_brickcomeback) && !obj_brickcomeback.trapped) || distance_to_object(obj_brickball) < _dis))
{
    state = states.blockstance;
    sprite_index = spr_hamkuff_chain1;
    var x1 = obj_player1.x;
    var y1 = obj_player1.y;
    
    if (instance_exists(obj_ratmountgroundpound))
    {
        x1 = obj_ratmountgroundpound.x;
        y1 = obj_ratmountgroundpound.y;
    }
    else if (instance_exists(obj_brickcomeback))
    {
        x1 = obj_brickcomeback.x;
        y1 = obj_brickcomeback.y;
    }
    else if (instance_exists(obj_brickball))
    {
        x1 = obj_brickball.x;
        y1 = obj_brickball.y;
    }
    
    instance_destroy(obj_ratmountgroundpound, false);
    instance_destroy(obj_brickcomeback, false);
    instance_destroy(obj_brickball, false);
    
    with (instance_create(x1, y1, obj_brickcomeback))
    {
        trapped = 1;
        baddieID = other.id;
        other.playerid = id;
    }
    
    with (obj_player1)
    {
        brick = 0;
        sprite_index = spr_lonegustavo_idle;
        state = states.ratmount;
    }
}

if (state != enemystates.stun)
    birdcreated = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != enemystates.grabbed)
    depth = 0;

if (state != enemystates.stun)
    thrown = false;
