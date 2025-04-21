if (room == rm_blank)
    exit;

draw_set_font(global.bigfont);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_alpha(1);

if (!global.option_hud || is_bossroom() || instance_exists(obj_granny))
    exit;

var collect_x = irandom_range(-collect_shake, collect_shake);
var collect_y = irandom_range(-collect_shake, collect_shake);
var _cx = tv_x + combo_posX;
var _cy = tv_y + 150 + hud_posY + combo_posY;
var _perc = global.combotime / 60;
var _minX = _cx - 70;
var _maxX = _cx + 55;
combofill_x = lerp(combofill_x, _maxX + ((_minX - _maxX) * _perc), 0.5);
combofill_y = _cy + 35 + Wave(-1, 1, 1, 0);
var _isP = !global.combodropped && global.prank_enemykilled;
var _barspr = spr_combotuc;
var _pointerspr = spr_combopointer;

if (_isP)
{
    _barspr = spr_combotucP;
    _pointerspr = spr_combopointerP;
}

var _tper = clamp(1 - (floor(100 * _perc) / 100), 0, 1);
var _tucindex = _tper * sprite_get_number(_barspr);
_tucindex = floor(clamp(_tucindex, 0, sprite_get_number(_barspr) - 1));

if (_tucindex > tucindex)
{
    var c = [combofill_x + irandom_range(2, -6), combofill_y + irandom_range(-5, -70), 2, random_range(-4, 2)];
    array_push(c, irandom_range(0, sprite_get_number(spr_tuccrumb) - 1));
    array_push(tucCrumbs, c);
}

tucindex = _tucindex;
draw_sprite(_barspr, tucindex, _cx, _cy);
draw_sprite(_pointerspr, combofill_index, combofill_x, combofill_y);

for (var i = 0; i < array_length(tucCrumbs); i++)
{
    var crumb = tucCrumbs[i];
    var _xx = crumb[0];
    var _yy = crumb[1];
    crumb[0] += crumb[2];
    crumb[1] += crumb[3];
    
    if (crumb[3] < 12)
        crumb[3] += 0.2;
    
    if (_xx > camera_get_view_width(view_camera[0]) || _yy > camera_get_view_height(view_camera[0]) || _xx < 0 || _yy < 0)
        array_delete(tucCrumbs, i, 1);
    else
        draw_sprite(spr_tuccrumb, crumb[4], _xx, _yy);
}

draw_set_font(global.combofont2);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _tx = _cx - 19;
var _ty = _cy + 30;

if (global.combo > 0 && global.combotime != 0)
    savedCombo = global.combo;

var _str = string(savedCombo);
var num = string_length(_str);

for (var i = num; i > 0; i--)
{
    var char = string_char_at(_str, i);
    draw_text(_tx, _ty, char);
    _tx -= 22;
    _ty -= 4;
}

if (!surface_exists(bgsurface))
    bgsurface = surface_create(175, 130);

surface_set_target(bgsurface);
draw_clear_alpha(c_black, 0);
var tvbg = tv_bg_index;
var noEscapeVar = [spr_tv_bg, spr_tv_bg_secret];

if (global.panic && !array_contains(noEscapeVar, tvbg))
{
    var escapevar = asset_get_index(concat(sprite_get_name(tvbg), "Panic"));
    
    if (sprite_exists(escapevar))
        tvbg = escapevar;
}

draw_sprite(tvbg, 0, 101, 59);
gpu_set_blendmode(bm_subtract);
draw_sprite(spr_tv_mask, 0, 0, 0);
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(bgsurface, (tv_x + collect_x) - 101, (tv_y + collect_y + hud_posY) - 59);
shader_set(global.Pal_Shader);
pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0);
draw_sprite_ext(sprite_index, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);

if (sprite_index == spr_tv_exprpanicN)
    draw_sprite_ext(spr_tv_panic_fogN, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha - 0.5);

if (global.noisejetpack)
{
    pal_swap_set(obj_player1.spr_palette, 2, 0);
    draw_sprite_ext(sprite_index, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
}

if (state == UnknownEnum.Value_252)
    draw_sprite(spr_tv_whitenoise, tv_trans, tv_x + collect_x, tv_y + collect_y + hud_posY);

draw_set_font(global.smallnumber_fnt);
draw_set_halign(fa_center);

if (global.panic)
{
    var _fill = global.fill;
    var _currentbarpos = chunkmax - _fill;
    _perc = _currentbarpos / chunkmax;
    _perc = clamp(_perc, 0, 1);
    var _max_x = 299;
    var _barpos = _max_x * _perc;
    var barmask = spr_timer_mask;
    var barw = sprite_get_width(barmask);
    var barh = sprite_get_height(barmask);
    
    if (!surface_exists(bar_surface))
        bar_surface = surface_create(barw, barh);
    
    var _barfillpos = floor(_barpos) + 13;
    
    if (_barfillpos > 0)
    {
        var surf_mask = surface_create(barw, barh);
        surface_set_target(surf_mask);
        draw_clear(c_black);
        gpu_set_blendmode(bm_subtract);
        draw_sprite(barmask, 0, 0, 0);
        surface_reset_target();
        gpu_set_blendmode(bm_normal);
        surface_resize(bar_surface, _barfillpos + 1, barh);
        surface_set_target(bar_surface);
        draw_clear_alpha(c_black, 0);
        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_sprite_tiled(spr_timer_fill, 0, 4 * _barpos, 3);
        var clip_x = timer_x + 12;
        var clip_y = timer_y + 33;
        gpu_set_blendmode(bm_subtract);
        draw_surface(surf_mask, 0, 0);
        gpu_set_blendmode(bm_normal);
        surface_reset_target();
        surface_free(surf_mask);
        draw_surface(bar_surface, clip_x, clip_y);
    }
    
    draw_sprite(spr_timer_straw, -1, timer_x, timer_y);
    draw_sprite(johnface_sprite, johnface_index, timer_x + 13 + _barpos, timer_y + 46);
    draw_sprite(garpo_sprite, garpo_index, timer_x + 320, timer_y + 24);
    draw_sprite(spr_timer_juice, juice_index, timer_x - 9, timer_y + 35);
    var timeinsecs = floor(global.fill / 60);
    var minutes = string(max(floor(timeinsecs / 60), 0));
    var seconds = string(max(timeinsecs % 60, 0));
    
    if (minutes < 10)
        minutes = concat("0", minutes);
    
    if (seconds < 10)
        seconds = concat("0", seconds);
    
    if (max(floor(timeinsecs / 60), 0) <= 0)
        draw_set_color(c_red);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(global.escapetimerfont);
    draw_text(timer_x + 152, timer_y + 18, concat(minutes, ":", seconds));
    draw_set_color(c_white);
}
else if (surface_exists(bar_surface))
{
    surface_free(bar_surface);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(promptAlpha);
var py = (timer_y < 532) ? (timer_y - 32) : 500;
draw_text_scribble(480, py, string("[fa_center][shake][spr_tutorialfont]{0}", global.ControlPrompt));
draw_set_alpha(1);
