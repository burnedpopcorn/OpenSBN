/// @desc Checks the angle of the surface of the collided collision object.
/// @param {any*} x The x position to check.
/// @param {any*} y The y position to check.
/// @param {real} pdist_a Distance of Point A from the center point.
/// @param {real} pdist_b Distance of Point B from the center point.
/// @param {real} len Magnitude of the point to check.
/// @param {real} dir Direction of the point to check.
/// @param {real} [exclude] Using the EXLCUDE flags you can exclude types of objects. Ex: (Exclude.SLOPES|Exclude.PLATFORMS). You can also invert it like so: (~Exclude.MOVING).
/// @returns {real} Angle of the surface of the collided collision object.
function scr_checkPositionSolidAngle(x, y, pdist_a, pdist_b, len, dir, exclude = Exclude.NONE) {
	// To Do: Research better ways of doing this if possible.
	
	// Initialize Variables.
	var point_a = { 
		x : x, 
		y : y, 
		targetX : x, 
		targetY : y 
	}, point_b = { 
		x : x, 
		y : y, 
		targetX : x, 
		targetY : y 
	};
	
	// Determine Starting Positions.
	point_a.x += lengthdir_x(pdist_a, 90 + dir);
	point_a.y += lengthdir_y(pdist_a, 90 + dir);
	point_b.x += lengthdir_x(pdist_b, -90 + dir);
	point_b.y += lengthdir_y(pdist_b, -90 + dir);
	
	// Determine Target Positions.
	point_a.targetX = point_a.x + lengthdir_x(len, dir);
	point_a.targetY = point_a.y + lengthdir_y(len, dir);
	point_b.targetX = point_b.x + lengthdir_x(len, dir);
	point_b.targetY = point_b.y + lengthdir_y(len, dir);
	
	// Approach Target Position.
	while (point_distance(point_a.x, point_a.y, point_a.targetX, point_a.targetY) > 0) {
		if (position_meeting_collision(point_a.x, point_a.y, exclude)) {
			break;
		}
		point_a.x += lengthdir_x(1, dir);
		point_a.y += lengthdir_y(1, dir);
	}
	while (point_distance(point_b.x, point_b.y, point_b.targetX, point_b.targetY) > 0) {
		if (position_meeting_collision(point_b.x, point_b.y, exclude)) {
			break;
		}
		point_b.x += lengthdir_x(1, dir);
		point_b.y += lengthdir_y(1, dir);
	}
	// Return Angle
	
	
	return (point_direction(point_a.x, point_a.y, point_b.x, point_b.y) - 180);
}

/// @desc Returns true if object collision collides with a given triangle
/// @param  {real} sx The x position to check for.
/// @param  {real} sy The y position to check for.
/// @param  {real} x1 x-coordinate of 1st point of triangle.
/// @param  {real} y1 y-coordinate of 1st point of triangle.
/// @param  {real} x2 x-coordinate of 2nd point of triangle.
/// @param  {real} y2 y-coordinate of 2nd point of triangle.
/// @param  {real} x3 x-coordinate of 3rd point of triangle.
/// @param  {real} y3 y-coordinate of 3rd point of triangle.
/// @returns {bool}

function triangle_meeting(sx, sy, x1, y1, x2, y2, x3, y3)
{
	var old_x = x;
	var old_y = y;
	x = sx;
	y = sy;

	if rectangle_in_triangle(bbox_left, bbox_top, bbox_right, bbox_bottom, x1, y1, x2, y2, x3, y3) > 0 {
		x = old_x;
		y = old_y;
		return true;	
	}
	x = old_x;
	y = old_y;	
	return false;
}

function unown_absfloor(a) {
	return (a > 0 ? floor(a) : ceil(a))
}