function scr_collision_init()
{
    goesDownSlopes = true;
    usesCollision = true;
    grounded = false;
    groundedSlope = false;
    terminalVelocity = 10;
    onMovingPlatform = -4;
    grav = 0;
    hsp = 0;
    vsp = 0;
    prevHsp = 0;
    prevVsp = 0;
    hsp_carry = 0;
    vsp_carry = 0;
}

function scr_collision()
{
    grounded = false;
    groundedSlope = false;
    onMovingPlatform = -4;
    
    with (obj_movingPlatform)
    {
        var _hspeed = x - xprevious;
        var _vspeed = y - yprevious;
        
        with (other.id)
        {
            x += _hspeed;
            y += _vspeed;
            
            if (place_meeting_collision(x, y + 1, UnknownEnum.Value_m5) && place_meeting(x, y + 1, other))
                onMovingPlatform = other.id;
            
            x -= _hspeed;
            y -= _vspeed;
        }
    }
    
    if (instance_exists(onMovingPlatform))
        kinematics_movingPlatforms(id, onMovingPlatform, true);
    
    var true_hsp = hsp;
    var true_vsp = vsp;
    hsp += hsp_carry;
    vsp += vsp_carry;
    hsp_carry = 0;
    vsp_carry = 0;
    hsp = (hsp > 0) ? floor(hsp) : ceil(hsp);
    vsp = (vsp > 0) ? floor(vsp) : ceil(vsp);
    var move_hsp = clamp(abs(hsp), 0, bbox_right - bbox_left) * sign(hsp);
    
    repeat (ceil(abs(hsp) / (bbox_right - bbox_left)))
    {
        if (!place_meeting_collision(x + move_hsp, y) && !(place_meeting_collision(x, y + 1) && !place_meeting_collision(x + move_hsp, y + 1)))
        {
            x += move_hsp;
        }
        else
        {
            repeat (abs(move_hsp))
            {
                y -= slope_check_up(x + sign(move_hsp), y);
                
                if (goesDownSlopes)
                    y += slope_check_down(x + sign(move_hsp), y);
                
                y += reverseSlope_check_down(x + sign(move_hsp), y);
                
                if (vsp <= 0 && place_meeting_collision(x, y - 1))
                    y -= reverseSlope_check_up(x + sign(move_hsp), y);
                
                if (!place_meeting_collision(x + sign(move_hsp), y))
                {
                    x += sign(move_hsp);
                }
                else
                {
                    true_hsp = 0;
                    move_hsp = 0;
                    hsp = 0;
                    break;
                }
            }
            
            break;
        }
    }
    
    var move_vsp = clamp(abs(vsp), 0, bbox_bottom - bbox_top) * sign(vsp);
    
    repeat (ceil(abs(vsp) / (bbox_bottom - bbox_top)))
    {
        if (!place_meeting_collision(x, y + move_vsp))
        {
            y += move_vsp;
        }
        else
        {
            repeat (abs(move_vsp))
            {
                if (!place_meeting_collision(x, y + sign(move_vsp)))
                {
                    y += sign(move_vsp);
                }
                else
                {
                    true_vsp = 0;
                    move_vsp = 0;
                    vsp = 0;
                    break;
                }
            }
            
            break;
        }
    }
    
    hsp = true_hsp;
    vsp = true_vsp;
    
    if (vsp < terminalVelocity)
        vsp += grav;
    
    grounded = place_meeting_collision(x, y + 1);
    groundedSlope = place_meeting_slope(x, y + 1);
    prevHsp = hsp;
    prevVsp = vsp;
    goesDownSlopes = true;
}

function kinematics_movingPlatforms(argument0, argument1, argument2 = true)
{
    with (argument1)
    {
        var _hsp = round(x - xprevious);
        var _vsp = round(y - yprevious);
        
        if (!argument2)
        {
            with (argument0)
            {
                x += _hsp;
                y += _vsp;
            }
        }
        else
        {
            with (argument0)
            {
                repeat (abs(_hsp))
                {
                    if (!place_meeting_collision(x + sign(_hsp), y))
                    {
                        x += sign(_hsp);
                    }
                    else
                    {
                        _hsp = 0;
                        break;
                    }
                }
                
                repeat (abs(_vsp))
                {
                    if (!place_meeting_collision(x, y + sign(_vsp)))
                    {
                        y += sign(_vsp);
                    }
                    else
                    {
                        _vsp = 0;
                        break;
                    }
                }
            }
        }
    }
}

function slope_check_up(argument0, argument1, argument2 = 4)
{
    for (var i = argument2; i > 0; i--)
    {
        var _check = true;
        var _z = i - 1;
        
        repeat (i - 1)
        {
            if (!place_meeting_collision(argument0, argument1 - _z))
                _check = false;
            
            _z--;
        }
        
        if (place_meeting_collision(argument0, argument1) && _check && !place_meeting_collision(argument0, argument1 - i))
            return i;
    }
    
    return 0;
}

function slope_check_down(argument0, argument1, argument2 = 4)
{
    for (var i = 1; i < (argument2 + 1); i++)
    {
        var _check = true;
        var _z = 1;
        
        repeat (i)
        {
            if (place_meeting_collision(argument0, argument1 + _z))
                _check = false;
            
            _z++;
        }
        
        if (!place_meeting_collision(argument0, argument1) && _check && place_meeting_collision(argument0, argument1 + (i + 1)))
            return i;
    }
    
    return 0;
}

function slope_check_left(argument0, argument1, argument2 = 4)
{
    for (var i = 0; i < argument2; i++)
    {
        if (place_meeting_collision(argument0, argument1) && !place_meeting_collision(argument0 - i, argument1))
            return i;
    }
    
    return 0;
}

function slope_check_right(argument0, argument1, argument2 = 4)
{
    for (var i = 0; i < argument2; i++)
    {
        if (place_meeting_collision(argument0, argument1) && !place_meeting_collision(argument0 + i, argument1))
            return i;
    }
    
    return 0;
}

function reverseSlope_check_down(argument0, argument1, argument2 = 4)
{
    for (var i = 0; i < argument2; i++)
    {
        if (place_meeting_collision(argument0, argument1) && !place_meeting_collision(argument0, argument1 + i))
            return i;
    }
    
    return 0;
}

function reverseSlope_check_up(argument0, argument1, argument2 = 4)
{
    for (var i = 0; i < argument2; i++)
    {
        if (!place_meeting_collision(argument0, argument1) && !place_meeting_collision(argument0, argument1 - i) && place_meeting_collision(argument0, argument1 - (i + 1)))
            return i;
    }
    
    return 0;
}
