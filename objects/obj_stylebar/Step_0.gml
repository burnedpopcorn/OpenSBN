visible = obj_tv.visible;
var pop = 0;
var idle = 0;

if (sprite == pop && floor(index) == (sprite_get_number(sprite) - 1))
    sprite = idle;

if (global.style < 0 && global.stylethreshold == 0)
    global.style = 0;

if (global.stylethreshold == 3 && global.style > 55)
    global.style = 55;

visible = obj_tv.visible;

if (obj_player1.y < 200)
    alpha = 0.3;
else if (!(room == rank_room || room == timesuproom || room == Realtitlescreen))
    alpha = 1;

index += 0.35;
global.stylemultiplier = (global.style + (global.stylethreshold * 55)) / 220;
