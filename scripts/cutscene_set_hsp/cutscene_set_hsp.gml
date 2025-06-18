function cutscene_set_hsp(_obj, _hsp)
{
    with (_obj)
        hsp = _hsp;
    
    cutscene_end_action();
    exit;
}

function cutscene_set_vsp(argument0, argument1)
{
    with (argument0)
        vsp = argument1;
    
    cutscene_end_action();
}
