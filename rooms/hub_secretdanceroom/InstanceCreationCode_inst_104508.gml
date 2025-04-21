var mailcheck = quick_ini_read_real(obj_savesystem.ini_str, "Mail", "exhibition", 0);
var datecheck = current_year <= 2025 && current_month == 1 && current_day < 14;

if (mailcheck >= 2 && datecheck)
{
    var lay_PZ = layer_get_id("Assets_PIZZELLE");
    layer_set_visible(lay_PZ, false);
}
else if (mailcheck < 2 && datecheck)
{
    var lay_DM = layer_get_id("Assets_DEMOPOSTER");
    layer_set_visible(lay_DM, true);
}
else
{
    var lay_FG = layer_get_id("Assets_FULLGAMEPOSTER");
    layer_set_visible(lay_FG, true);
    var lay_DM = layer_get_id("Assets_DEMOPOSTER");
    layer_set_visible(lay_DM, false);
}
