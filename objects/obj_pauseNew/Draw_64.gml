if (room == rm_mainmenu)
    exit;

if (state == UnknownEnum.Value_0)
{
    gpu_set_blendenable(false);
    draw_sprite_ext(pause_spr, 0, 0, 0, 1, 1, 0, c_white, 1);
    gpu_set_blendenable(true);
}

if (pauseScale < 5 && realPauseAlpha > 0)
{
    if (!surface_exists(bg_surf))
    {
        bg_surf = surface_create(obj_gameFrame.defaultwidth, obj_gameFrame.defaultheight);
    }
    else
    {
        surface_set_target(bg_surf);
        draw_sprite_ext(spr_pause_filter, 0, 0, 0, 1, 1, 0, c_white, pauseAlpha / 2);
        draw_sprite_ext(spr_pause_bg, selected, 0, 0, 1, 1, 0, c_white, 1);
        draw_sprite_ext(spr_pause_bo, savedPanic, 0, 0, 1, 1, 0, c_white, 1);
        
        if (savedJanitor)
            draw_sprite_ext(spr_pause_janitor, 0, 0, 0, 1, 1, 0, c_white, 1);
        
        var pad = 80;
        var xx = 96;
        var yy = 266;
        
        for (var i = 0; i < array_length(toppin_sprite); i++)
            draw_sprite_ext(toppin_sprite[i], toppin_has[i], 0, 0, 1, 1, 0, c_white, 1);
        
        for (var s = 0; s < savedSecrets; s++)
            draw_sprite_ext(spr_pause_secrets, s, 0, 0, 1, 1, 0, c_white, 1);
        
        pad = 48;
        draw_text_scribble(480, 500, string("[fa_center][shake][spr_transfopromptfont]{0}", global.TransfoPrompt));
        surface_reset_target();
        var _px = -280 * (pauseScale - 1);
        var _py = -80 * (pauseScale - 1);
        draw_surface_ext(bg_surf, _px, _py, pauseScale, pauseScale, 0, c_white, realPauseAlpha);
        
        if (global.option_timer_speedrun)
        {
            with (obj_globaltimer)
                event_perform(ev_draw, ev_gui);
        }
    }
}
