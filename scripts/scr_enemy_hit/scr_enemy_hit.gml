function scr_enemy_hit()
{
    x = hitX + random_range(-6, 6);
    y = hitY + random_range(-6, 6);
    hitLag--;
    sprite_index = stunfallspr;
    
    if (hitLag <= 0)
    {
        x = hitX;
        y = hitY;
        var _player = obj_player1;
        
        if (_player.tauntstoredstate == states.mach2 || _player.tauntstoredstate == states.tumble || _player.state == states.mach2 || _player.state == states.tumble)
            thrown = false;
        else
            thrown = true;
        
        vsp = hitvsp;
        hsp = hithsp;
        global.hit += 1;
        
        if (other.object_index == obj_pizzaball)
            global.golfhit += 1;
        
        if (thrown)
            global.combotime = 60;
        
        global.heattime = 60;
        alarm[1] = 5;
        var _hp = 0;
        
        if ((global.attackstyle == 3 || global.attackstyle == 0) && !global.kungfu)
            _hp = -1;
        
        if (((!elite && (hp <= _hp || mach3destroy)) || (elite && elitehit <= 0 && mach3destroy)) && object_get_parent(object_index) != 16 && destroyable)
        {
            instance_destroy();
            instance_create(x, y, obj_genericpoofeffect);
        }
        
        stunned = 200;
        state = enemystates.stun;
    }
    
    exit;
}
