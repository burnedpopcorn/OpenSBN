draw_sprite(sprite_index, found, x, y);

if (found)
    draw_sprite(treasurespr, treasureindex, x + xoff, y + yoff + Wave(-5, 5, 2, 2));
