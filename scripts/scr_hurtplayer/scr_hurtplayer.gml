function scr_hurtplayer(argument0)
{
    var _hurt = false;
    
    with (argument0)
    {
        if (global.failcutscene) { }
        else if (state == states.Parry || state == states.debugstate || state == states.golf || state == states.slipbanan) { }
        else if (state == states.handstandjump && flash == 1) { }
        else if (state == states.backbreaker || state == states.chainsaw) { }
        else if (global.kungfu)
        {
            if (state == states.blockstance)
            {
                if (sprite_index != spr_null)
                {
                    instance_create(x, y, obj_parryeffect);
                    image_index = 0;
                }
                
                sprite_index = spr_null;
                hsp = -xscale * 2;
            }
            else if (state != states.thrown && state != states.hit && !hurted)
            {
                instance_create(x, y, obj_parryeffect);
                
                repeat (5)
                {
                    with (create_debris(x, y, spr_slapstar))
                        vsp = irandom_range(-6, -11);
                }
                
                hitLag = 3;
                hitxscale = (x != other.x) ? sign(other.x - x) : -other.image_xscale;
                state = states.hit;
                hitstunned = 50;
                hurted = 1;
                alarm[7] = hitstunned + 30;
                hithsp = 12;
                hitvsp = -5;
                hitX = x;
                hitY = y;
                sprite_index = spr_hurt;
                
                if (global.hp > 1)
                {
                    global.hp--;
                    
                    with (obj_camera)
                        healthshaketime = 60;
                }
                else
                {
                    with (obj_music)
                        arena = 0;
                    
                    global.kungfu = 0;
                    
                    if (!instance_exists(obj_fadeout))
                    {
                        with (obj_player1)
                            targetRoom = lastroom;
                        
                        instance_create(x, y, obj_fadeout);
                    }
                }
            }
        }
        else if (isgustavo)
        {
            if (!hurted)
            {
                state = states.ratmounthurt;
                movespeed = 6;
                vsp = -9;
                flash = 1;
                alarm[8] = 100;
                hurted = 1;
                instance_create(x, y, obj_spikehurteffect);
                _hurt = 1;
            }
        }
        else if (state == states.shotgundash) { }
        else if (state == states.fishhurt) { }
        else if ((state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes || state == states.knightpepbump) && cutscene == 0) { }
        else if (state == states.ghost) { }
        else if (state == states.ghostpossess)
        {
            if (instance_exists(possessID) && object_get_parent(possessID) == obj_characterselect)
            {
                state = states.ghost;
                
                with (obj_baddie)
                {
                    if (is_controllable && state == states.ghostpossess && playerid == other.id)
                        instance_destroy();
                }
            }
        }
        else if (state == states.slipnslide) { }
        else if (state == states.trickjump) { }
        else if (state == states.chainsawbump) { }
        else if (state == states.bombpep && hurted == 0) { }
        else if (state == states.rideweenie) { }
        else if (state == states.slipnslide) { }
        else if (state == states.boxxedpep)
        {
            hsp = -xscale * 4;
            vsp = -5;
            state = states.bump;
            sprite_index = spr_bump;
            alarm[5] = 2;
            alarm[8] = 60;
            alarm[7] = 120;
            hurted = 1;
        }
        else if (pizzashield == 1)
        {
            pizzashield = 0;
            
            with (instance_create(x, y, obj_baddieDead))
                sprite_index = spr_pizzashield_collectible;
            
            hsp = -xscale * 4;
            vsp = -5;
            state = states.bump;
            sprite_index = spr_bump;
            invhurt_buffer = 120;
            alarm[8] = 60;
            alarm[7] = 120;
            hurted = 1;
        }
        else if (state != states.hurt && state != states.ratmounthurt && state != states.grabbed && (hurted == 0 || state == states.cheesepep || state == states.cheesepepstickside || state == states.cheesepepstickup) && cutscene == 0)
        {
            if (state == states.mort || state == states.morthook || state == states.mortjump || state == states.mortattack)
            {
                with (instance_create(x, y, obj_mortflyaway))
                    image_xscale = -other.xscale;
            }
            
            _hurt = true;
            
            if (character == "V")
                global.playerhealth -= 25;
            
            if (state == states.barrel || state == states.barrelclimbwall || state == states.barreljump || state == states.barrelslide)
            {
                repeat (4)
                    create_debris(x, y, spr_barreldebris);
            }
            
            if (global.kungfu)
            {
                if (global.hp > 1)
                {
                    global.hp--;
                    
                    with (obj_camera)
                        healthshaketime = 60;
                }
                else
                {
                    with (obj_music)
                        arena = 0;
                    
                    global.kungfu = 0;
                    
                    if (!instance_exists(obj_fadeout))
                    {
                        with (obj_player1)
                            targetRoom = lastroom;
                        
                        instance_create(x, y, obj_fadeout);
                    }
                }
            }
            
            if (state == states.grabbed)
            {
                if (object_index == obj_player1)
                    y = obj_player2.y;
                else
                    y = obj_player1.y;
            }
            
            alarm[8] = 100;
            alarm[7] = 150;
            hurted = 1;
            event_play_oneshot("event:/SFX/bo/hurt", x, y);
            
            if (chance(50))
                fmod_event_play(voice_hurt);
            
            if (xscale == other.image_xscale)
                sprite_index = spr_hurtjump;
            else
                sprite_index = spr_hurt;
            
            movespeed = 8 / getRPGMulti("defense");
            vsp = -14 / getRPGMulti("defense");
            timeuntilhpback = 300;
            instance_create(x, y, obj_spikehurteffect);
            
            if (state == states.fishdash || state == states.fishswim || state == states.fishground)
                state = states.fishhurt;
            else
                state = states.hurt;
            
            image_index = 0;
            flash = 1;
            global.player_damage++;
        }
        
        if (_hurt)
        {
            global.combotime -= 25;
            global.style -= 25;
            global.hurtcounter += 1;
            var loseamount = 50 * (global.stylethreshold + 1);
            
            if (!instance_exists(obj_bosscontroller) && global.collect > 0)
            {
                with (instance_create(190, 65, obj_negativenumber))
                    number = concat("-", loseamount);
            }
            
            if (!global.pizzadelivery)
            {
                if (global.collect > loseamount)
                    global.collect -= loseamount;
                else
                    global.collect = 0;
                
                if (global.collect != 0)
                {
                    if (character == "P" || character == "V")
                    {
                        repeat (10)
                        {
                            with (instance_create(x, y, obj_pizzaloss))
                                sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect);
                        }
                    }
                    else
                    {
                        repeat (10)
                            instance_create(x, y, obj_pizzaloss);
                    }
                }
            }
        }
    }
}
