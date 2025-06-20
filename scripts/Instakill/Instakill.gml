function Instakill()
{
    if (other.baddieID.elitegrab == 0)
    {
        other.baddieID.grabbedby = 1;
        
        if (object_index == obj_player2)
            other.baddieID.grabbedby = 2;
        
        if (state == states.mach3 && sprite_index != spr_mach3hit && (character == "P" || character == "V"))
        {
            if (fightball == 0)
                sprite_index = spr_mach3hit;
            
            image_index = 0;
        }
        
        if (state == states.chainsawbump && sprite_index != spr_player_chainsawhit)
        {
            image_index = 0;
            sprite_index = spr_player_chainsawhit;
        }
        
        other.baddieID.invtime = 25;
        suplexmove = 1;
        
        if (object_index == obj_player1)
            other.baddieID.grabbedby = 1;
        else
            other.baddieID.grabbedby = 2;
        
        gamepad_vibrate_constant(5, 5);
        event_play_oneshot("event:/SFX/bo/punch", x, y);
        
        if (other.baddieID.elite && other.baddieID.object_index != obj_robot)
            other.baddieID.elitehit = 0;
        
        if (!other.baddieID.important)
            global.style += (2 + global.combo);
        
        if (!other.baddieID.elite || other.baddieID.elitehit <= 0)
            other.baddieID.mach3destroy = 1;
        
        if (!other.baddieID.killprotection && !global.kungfu && (!other.baddieID.elite || other.baddieID.elitehit <= 0))
            other.baddieID.instakilled = 1;
        
        if (!other.baddieID.important)
        {
            global.combotime = 60;
            global.heattime = 60;
        }
        
        global.hit += 1;
        
        if (!grounded && state != states.boxxedpepspin && state != states.freefall && (input_check("jump") || input_buffer_jump == 0))
        {
            suplexmove = 0;
            vsp = -11;
        }
        
        if (state == states.boxxedpepspin)
        {
            if (input_check("jump"))
                vsp = -10;
            
            boxxedpepjump = 10;
        }
        
        if (character == "M" && state == states.freefall)
        {
            vsp = -11;
            state = states.jump;
            sprite_index = spr_jump;
        }
        
        if (state != states.chainsaw)
        {
            tauntstoredmovespeed = movespeed;
            tauntstoredsprite = sprite_index;
            tauntstoredstate = state;
            tauntstoredvsp = vsp;
        }
        
        if (state == states.handstandjump && !input_check("slap"))
        {
            other.baddieID.thrown = 1;
            other.baddieID.shoulderbashed = 1;
            tauntstoredstate = 92;
            tauntstoredvsp = -5;
            
            if (input_check("attack"))
                tauntstoredstate = 104;
            
            if (input_check("jump") || input_check("up"))
                tauntstoredvsp = -15;
            
            image_index = 0;
            jumpAnim = 1;
            jumpstop = 1;
            
            if (grounded)
                sprite_index = spr_player_groundedattack;
            else
                sprite_index = spr_player_ungroundedattack;
            
            tauntstoredsprite = spr_null;
        }
        
        if (state == states.chainsawbump && !global.kungfu)
        {
            sprite_index = spr_player_chainsawhit;
            image_index = 0;
        }
        
        var lag = 5;
        other.baddieID.hitLag = lag;
        other.baddieID.hitX = other.baddieID.x;
        other.baddieID.hitY = other.baddieID.y;
        other.baddieID.hp -= 1;
        hitLag = lag;
        hitX = x;
        hitY = y;
        other.baddieID.alarm[3] = 3;
        other.baddieID.state = states.hit;
        other.baddieID.image_xscale = -xscale;
        
        if (!global.performance_mode)
        {
            instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect);
            instance_create(x, y, obj_slapstar);
            instance_create(x, y, obj_slapstar);
            instance_create(x, y, obj_slapstar);
            instance_create(x, y, obj_baddiegibs);
            instance_create(x, y, obj_baddiegibs);
            instance_create(x, y, obj_baddiegibs);
        }
        
        with (obj_camera)
        {
            shake_mag = 3;
            shake_mag_acc = 3 / room_speed;
        }
        
        other.baddieID.hithsp = xscale * (movespeed + 2);
        
        if (state != states.mach2 && state != states.tumble)
        {
            with (instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect))
                sprite_index = spr_kungfueffect;
        }
        
        if (abs(other.baddieID.hithsp) < 10)
            other.baddieID.hithsp = xscale * 10;
        
        other.baddieID.hitvsp = -5;
        state = states.chainsaw;
    }
    else
    {
        other.baddieID.state = states.stun;
        other.baddieID.vsp = -4;
        other.baddieID.stunned = 40;
        scr_hurtplayer(id);
    }
    
    exit;
}
