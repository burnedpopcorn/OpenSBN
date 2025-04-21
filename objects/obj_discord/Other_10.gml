var img = "biglogo";
var tvbg = scr_tv_get_bg();
var noEscapeVar = [spr_tv_bg, spr_tv_bg_secret];

if (global.panic && !array_contains(noEscapeVar, tvbg))
{
    var escapevar = asset_get_index(concat(sprite_get_name(tvbg), "Panic"));
    
    if (sprite_exists(escapevar))
        tvbg = escapevar;
}

switch (tvbg)
{
    case spr_tv_bg_midway1:
        img = "midway1";
        break;
    
    case spr_tv_bg_midway1Panic:
        img = "midway1escape";
        break;
    
    case spr_tv_bg_midway2:
        img = "midway2";
        break;
    
    case spr_tv_bg_midway2Panic:
        img = "midway2escape";
        break;
    
    case spr_tv_bg_midway3:
        img = "midway3";
        break;
    
    case spr_tv_bg_midway3Panic:
        img = "midway3escape";
        break;
    
    case spr_tv_bg_water1:
        img = "water1";
        break;
    
    case spr_tv_bg_water1Panic:
        img = "water1escape";
        break;
    
    case spr_tv_bg_water2:
        img = "water2";
        break;
    
    case spr_tv_bg_water2Panic:
        img = "water2escape";
        break;
    
    case spr_tv_bg_water3:
        img = "water3";
        break;
    
    case spr_tv_bg_water3Panic:
        img = "water3esacpe";
        break;
    
    case spr_tv_bg_mario2:
        img = "mario";
        break;
    
    case spr_tv_bg_secret:
        img = "secret";
}

largeimage = img;
