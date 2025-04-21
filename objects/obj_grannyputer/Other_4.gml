switch (room)
{
    case hub_world1:
        self.addlevel("midway", 0);
        self.addlevel("fish", 1);
        break;
}

var levelmulti = array_length(levelarray) / 4;
var oldxs = text_xscale;
text_xscale *= levelmulti;
text_xpad += (((sprite_get_width(spr_grannyputerbubble) * oldxs) - (sprite_get_width(spr_grannyputerbubble) * text_xscale)) / 2);
level_xpad = (sprite_get_width(spr_grannyputerbubble) * text_xscale) / array_length(levelarray);
