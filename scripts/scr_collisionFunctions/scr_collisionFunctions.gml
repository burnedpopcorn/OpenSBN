function scr_checkPositionSolidAngle(argument0, argument1, argument2, argument3, argument4, argument5, argument6 = UnknownEnum.Value_0)
{
    var point_a = 
    {
        x: argument0,
        y: argument1,
        targetX: argument0,
        targetY: argument1
    };
    var point_b = 
    {
        x: argument0,
        y: argument1,
        targetX: argument0,
        targetY: argument1
    };
    point_a.x += lengthdir_x(argument2, 90 + argument5);
    point_a.y += lengthdir_y(argument2, 90 + argument5);
    point_b.x += lengthdir_x(argument3, -90 + argument5);
    point_b.y += lengthdir_y(argument3, -90 + argument5);
    point_a.targetX = point_a.x + lengthdir_x(argument4, argument5);
    point_a.targetY = point_a.y + lengthdir_y(argument4, argument5);
    point_b.targetX = point_b.x + lengthdir_x(argument4, argument5);
    point_b.targetY = point_b.y + lengthdir_y(argument4, argument5);
    
    while (point_distance(point_a.x, point_a.y, point_a.targetX, point_a.targetY) > 0)
    {
        if (position_meeting_collision(point_a.x, point_a.y, argument6))
            break;
        
        point_a.x += lengthdir_x(1, argument5);
        point_a.y += lengthdir_y(1, argument5);
    }
    
    while (point_distance(point_b.x, point_b.y, point_b.targetX, point_b.targetY) > 0)
    {
        if (position_meeting_collision(point_b.x, point_b.y, argument6))
            break;
        
        point_b.x += lengthdir_x(1, argument5);
        point_b.y += lengthdir_y(1, argument5);
    }
    
    if (global.ShowCollision)
    {
        draw_point_color(point_a.x, point_a.y, c_blue);
        draw_point_color(point_b.x, point_b.y, c_yellow);
        draw_line_width_color(point_a.x, point_a.y, point_a.targetX, point_a.targetY, 2, c_red, c_black);
        draw_line_width_color(point_b.x, point_b.y, point_b.targetX, point_b.targetY, 2, c_green, c_black);
        draw_point_color(point_a.targetX, point_a.targetY, c_white);
        draw_point_color(point_b.targetX, point_b.targetY, c_white);
    }
    
    return point_direction(point_a.x, point_a.y, point_b.x, point_b.y) - 180;
}

function triangle_meeting(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7)
{
    var old_x = x;
    var old_y = y;
    x = argument0;
    y = argument1;
    
    if (rectangle_in_triangle(bbox_left, bbox_top, bbox_right, bbox_bottom, argument2, argument3, argument4, argument5, argument6, argument7) > 0)
    {
        x = old_x;
        y = old_y;
        return true;
    }
    
    x = old_x;
    y = old_y;
    return false;
}
