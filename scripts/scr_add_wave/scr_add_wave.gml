function scr_add_wave(_wave, _enemynumber, _obj, _random, _spawnpoint)
{
    baddie_arr[_wave][_enemynumber] = _obj;
    baddie_random[_wave][_enemynumber] = _random;
    
    if (!_random)
        baddie_spawnpoint[_wave][_enemynumber] = _spawnpoint;
}
