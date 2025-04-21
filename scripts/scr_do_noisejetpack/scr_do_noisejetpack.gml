function scr_do_noisejetpack()
{
    if (global.noisejetpack && !grounded && input_check_pressed("jump") && walljumpbuffer <= 0)
    {
        input_buffer_jump = 8;
        trace("noisejetpack");
        state = states.noisejetpack;
        sprite_index = spr_null;
        image_index = 0;
        vsp = -11;
    }
}
