function scr_editor_init_objects()
{
    add_object(0, "SOLID", spr_wall, obj_solid, 16, 16);
    add_object(0, "PLATFORM", spr_baddie, obj_platform, 16, 16);
    add_object(0, "SLOPE", spr_slope, obj_slope, 16, 16);
    add_object(1, "grape", spr_grapemove, obj_grape, 32, 32);
    add_object(1, "tack", spr_tack_idle, obj_tack, 32, 32);
}
