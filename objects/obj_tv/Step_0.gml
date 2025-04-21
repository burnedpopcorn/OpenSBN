if (promptTimer > 0)
{
    promptAlpha = approach(promptAlpha, 1, 0.05);
    promptTimer--;
}
else
{
    promptAlpha = approach(promptAlpha, 0, 0.05);
}

if (global.hurtcounter >= global.hurtmilestone && global.hurtcounter >= 10)
{
    scr_queueToolTipPrompt(string("[spr_tutorialfont]You have hurt Bo Noise {0} times...", global.hurtmilestone), -4, 150);
    global.hurtmilestone += 10;
}

tv_x = obj_gameFrame.defaultwidth - 115;
tv_y = approach(tv_y, 80, 10);
timer_xstart = (obj_gameFrame.defaultwidth / 2) + timer_xplus;
timer_ystart = obj_gameFrame.defaultheight + timer_yplus;

if (global.combotime > 0 && global.combo > 0)
    visualcombo = global.combo;

if (room == Realtitlescreen || room == rm_mainmenu || room == creditsroom || room == hub_world1 || room == hub_soundtest || room == rm_evilleafyishere || room == hub_entrancehall || room == hub_mansion || room == hub_secretdanceroom || room == hub_secretmidway || room == rank_room || room == rm_levelselect || room == timesuproom || room == hub_loadingscreen || (string_copy(room_get_name(room), 1, 5) == "hub" && !global.panic))
{
    visible = false;
    sprite_index = spr_tv_off;
}
else
{
    visible = true;
}

if (!global.showhud)
    visible = false;

if (targetgolf != -4 && !instance_exists(targetgolf))
    targetgolf = -4;

if (targetgolf != -4 && !view_visible[1])
{
    view_visible[1] = true;
    view_enabled = true;
}

if (bubblespr != -4 && bubblespr != spr_tv_bubbleclosed)
{
    if (prompt != -4)
        prompt_buffer = 2;
    
    bubbleindex += image_speed;
    
    if (floor(bubbleindex) == sprite_get_number(bubblespr))
    {
        bubbleindex = 0;
        
        switch (bubblespr)
        {
            case spr_tv_bubbleopen:
                bubblespr = spr_tv_bubble;
                break;
            
            case spr_tv_bubbleclose:
                bubblespr = spr_tv_bubbleclosed;
                
                if (prompt == -4 || prompt == "")
                    bubblespr = -4;
                
                break;
        }
    }
}

image_speed = 0.35;
var _state = states.normal;
var _tauntstate = UnknownEnum.Value_2;
var _sp = spr_null;
var _player = -4;

with (obj_player1)
{
    _state = state;
    _tauntstate = tauntstoredstate;
    
    if (_state == 1)
        _state = _tauntstate;
    
    _sp = sprite_index;
    _player = id;
    scr_setTransfoTip(_state);
    
    if (other.oldPromptText != global.TransfoPrompt)
    {
        other.oldPromptText = global.TransfoPrompt;
        
        if (global.TransfoPrompt != "")
            scr_queueToolTipPrompt(global.TransfoPrompt);
    }
}

switch (state)
{
    case states.normal:
        idlespr = spr_tv_idle;
        
        if (_player.ispeppino)
            idlespr = spr_tv_idleN;
        
        if (global.panic)
        {
            idlespr = spr_tv_exprpanic;
        }
        else if (global.combo >= 3 && global.stylethreshold < 3 && !_player.isgustavo && global.combotime > 0 && !instance_exists(obj_comboend))
        {
            idlespr = spr_tv_exprcombo;
            
            if (global.combo >= 50)
                idlespr = spr_tv_exprheat;
        }
        
        if (_player.isgustavo)
        {
            idlespr = spr_null;
            
            if (global.panic)
                idlespr = spr_null;
        }
        
        if (_state == states.backbreaker || _state == states.chainsaw)
            _state = _tauntstate;
        
        var _transfo = true;
        var _transfospr = scr_tv_get_transfo_sprite();
        
        if (_transfospr == spr_null || _transfospr == -4)
            _transfo = false;
        else
            idlespr = _transfospr;
        
        if (!_player.ispeppino)
        {
            var spr = sprite_get_name(idlespr);
            spr = asset_get_index(concat(spr, "N"));
            
            if (spr > -1)
                idlespr = spr;
        }
        
        if (!_transfo)
        {
            with (_player)
            {
                var s = state;
                var ts = tauntstoredstate;
                
                if (s == UnknownEnum.Value_86 || s == UnknownEnum.Value_63)
                    s = ts;
                
                if (mach4mode == 1)
                    tv_do_expression(spr_tv_exprmach4);
                else if (s == UnknownEnum.Value_123 || sprite_index == spr_mach3boost)
                    tv_do_expression(spr_tv_exprmach3);
                else if (s == UnknownEnum.Value_109 || state == states.fishhurt)
                    tv_do_expression(spr_tv_exprhurt);
            }
        }
        
        switch (sprite_index)
        {
            case spr_tv_off:
                if (visible)
                {
                    sprite_index = spr_tv_open;
                    image_index = 0;
                }
                
                break;
            
            case spr_tv_open:
                if (floor(image_index) == (image_number - 1))
                    sprite_index = idlespr;
                
                break;
            
            case spr_tv_idle:
            case spr_tv_idleN:
                if (idleanim > 0)
                    idleanim--;
                
                if (sprite_index != idlespr)
                    sprite_index = idlespr;
                
                if (idleanim <= 0 && floor(image_index) == (image_number - 1))
                {
                    sprite_index = choose(spr_tv_idleanim1N, spr_tv_idleanim2N);
                    image_index = 0;
                }
                
                break;
            
            case spr_tv_idleanim1N:
            case spr_tv_idleanim2N:
                if (floor(image_index) == (image_number - 1))
                {
                    sprite_index = idlespr;
                    idleanim = 240 + (60 * irandom_range(-1, 2));
                }
                
                if (idlespr != spr_tv_idle && idlespr != spr_tv_idleN)
                    sprite_index = idlespr;
                
                break;
            
            default:
                sprite_index = idlespr;
        }
        
        if (sprite_index != spr_tv_open)
        {
            if (!ds_list_empty(tvprompts_list))
            {
                var b = ds_list_find_value(tvprompts_list, 0);
                prompt_buffer = prompt_max;
                
                if (b[0] != "" && b[0] != -4)
                {
                    bubblespr = spr_tv_bubbleopen;
                    bubbleindex = 0;
                    prompt = b[0];
                    promptspd = b[3];
                    promptx = promptxstart;
                }
                else
                {
                    if (bubblespr != -4 && bubblespr != spr_tv_bubbleclosed)
                        bubblespr = spr_tv_bubbleclose;
                    
                    if (bubblespr == spr_tv_bubbleclosed)
                        bubblespr = -4;
                    
                    bubbleindex = 0;
                    promptx = promptxstart;
                    prompt = -4;
                }
                
                if (b[1] == UnknownEnum.Value_0)
                {
                    sprite_index = spr_tv_open;
                    image_index = 0;
                    tvsprite = b[2];
                    
                    if (!_player.ispeppino)
                    {
                        var spr = sprite_get_name(tvsprite);
                        spr = asset_get_index(concat(spr, "N"));
                        
                        if (spr > -1)
                            tvsprite = spr;
                    }
                }
                else
                {
                    tvsprite = b[2];
                    
                    if (!_player.ispeppino)
                    {
                        var spr = sprite_get_name(tvsprite);
                        spr = asset_get_index(concat(spr, "N"));
                        
                        if (spr > -1)
                            tvsprite = spr;
                    }
                    
                    sprite_index = tvsprite;
                    image_index = 0;
                }
                
                state = states.transitioncutscene;
            }
            else
            {
                bubblespr = -4;
            }
        }
        
        break;
    
    case states.transitioncutscene:
        if (sprite_index == spr_tv_open && floor(image_index) == (image_number - 1))
            sprite_index = tvsprite;
        
        if (sprite_index == tvsprite)
        {
            if (prompt_buffer > 0)
            {
                prompt_buffer--;
            }
            else
            {
                promptx = promptxstart;
                ds_list_delete(tvprompts_list, 0);
                state = states.normal;
            }
        }
        
        break;
    
    case UnknownEnum.Value_252:
        var playOnce = [spr_tv_exprheatcomboend];
        
        if (array_contains(playOnce, sprite_index))
        {
            if (floor(image_index) == (image_number - 1))
                image_index = floor(image_index);
        }
        
        if (tv_trans >= sprite_get_number(spr_tv_whitenoise))
        {
            if (expressionsprite != -4)
            {
                state = UnknownEnum.Value_253;
                sprite_index = expressionsprite;
            }
            else
            {
                state = states.normal;
            }
            
            image_index = 0;
        }
        
        break;
    
    case UnknownEnum.Value_253:
        var s = state;
        var es = expressionsprite;
        var _transfospr = scr_tv_get_transfo_sprite();
        
        switch (expressionsprite)
        {
            case spr_tv_exprhurt:
                if (_player.state != states.hurt)
                {
                    if (expressionbuffer > 0)
                    {
                        expressionbuffer--;
                    }
                    else
                    {
                        state = UnknownEnum.Value_252;
                        expressionsprite = -4;
                    }
                }
                
                break;
                
                if (_player.state != states.ratmounthurt)
                {
                    if (expressionbuffer > 0)
                    {
                        expressionbuffer--;
                    }
                    else
                    {
                        state = UnknownEnum.Value_252;
                        expressionsprite = -4;
                    }
                }
                
                break;
            
            case spr_tv_exprcombo:
                if (global.combo < 3 || _player.isgustavo || _player.mach4mode || _player.state == states.hurt || _player.state == states.mach3 || _player.sprite_index == _player.spr_mach3boost || global.stylethreshold >= 3)
                {
                    state = UnknownEnum.Value_252;
                    expressionsprite = -4;
                    
                    if (_player.state == states.hurt || _player.state == states.fishhurt)
                        tv_do_expression(spr_tv_exprhurt);
                }
                
                break;
            
            case spr_tv_exprcollect:
                if (expressionbuffer > 0)
                {
                    expressionbuffer--;
                }
                else
                {
                    state = UnknownEnum.Value_252;
                    expressionsprite = -4;
                }
                
                break;
            
            case spr_tv_exprmach3:
                with (obj_player1)
                {
                    if (state != states.mach3 && state != states.climbwall && (state != states.chainsaw || (tauntstoredstate != states.mach3 && tauntstoredstate != states.climbwall)) && sprite_index != spr_mach3boost && mach4mode == 0)
                    {
                        other.state = UnknownEnum.Value_252;
                        other.expressionsprite = -4;
                    }
                    
                    if (mach4mode)
                        tv_do_expression(spr_tv_exprmach4);
                }
                
                break;
            
            case spr_tv_exprmach4:
                with (obj_player1)
                {
                    if (mach4mode == 0 && (state != states.chainsaw || (tauntstoredstate != states.mach3 && tauntstoredstate != states.climbwall)))
                    {
                        other.state = UnknownEnum.Value_252;
                        other.expressionsprite = -4;
                    }
                }
                
                break;
            
            case spr_tv_exprheat:
                var _transfo = false;
                
                with (obj_player1)
                {
                    if (_transfospr != spr_null && _transfospr != -4)
                        _transfo = true;
                    
                    if (isgustavo)
                        _transfo = true;
                }
                
                if (global.stylethreshold < 3 || _transfo || _player.mach4mode || _player.state == states.hurt || _player.state == states.mach3 || _player.sprite_index == _player.spr_mach3boost)
                {
                    state = UnknownEnum.Value_252;
                    expressionsprite = -4;
                }
                
                break;
            
            case spr_tv_exprheatcomboend:
                var _transfo = false;
                
                if (floor(image_index) == (image_number - 1))
                    image_index = floor(image_index);
                
                if (expressionbuffer > 0)
                {
                    expressionbuffer--;
                }
                else if (floor(image_index) == (image_number - 1) && !instance_exists(obj_comboend))
                {
                    expressionsprite = -4;
                    expressionbuffer = 0;
                    state = UnknownEnum.Value_252;
                }
                
                break;
            
            case spr_tv_exprpanic:
                var _transfo = false;
                
                with (obj_player1)
                {
                    if (_transfospr)
                        _transfo = true;
                    
                    if (isgustavo)
                        _transfo = true;
                }
                
                if (!global.panic || _transfo || _player.mach4mode || _player.state == states.hurt || _player.state == states.mach3 || _player.sprite_index == _player.spr_mach3boost)
                {
                    state = UnknownEnum.Value_252;
                    expressionsprite = -4;
                }
                
                break;
            
            case spr_tv_exprsecret:
                var _secret = false;
                
                with (obj_secretportal)
                {
                    if (secret)
                        _secret = true;
                }
                
                if (!_secret)
                {
                    state = UnknownEnum.Value_252;
                    expressionsprite = -4;
                }
                
                break;
        }
        
        if (!ds_list_empty(tvprompts_list))
        {
            state = UnknownEnum.Value_252;
            tv_trans = 0;
            expressionsprite = -4;
        }
        
        break;
}

if (state != UnknownEnum.Value_252)
    tv_trans = 0;
else
    tv_trans += 0.35;

var change_pos = 0;

if (obj_player1.x > (room_width - 224) && obj_player1.y < 387)
    change_pos = 1;

if (bubblespr != -4 && obj_player1.x > 316 && obj_player1.y < 101)
    change_pos = 1;

var spd = 15;

if (change_pos)
    hud_posY = approach(hud_posY, -300, spd);
else
    hud_posY = approach(hud_posY, 0, spd);

garpo_index += 0.05;
hand_index += 0.35;
johnface_index += 0.15;

if (global.panic && global.fill > 0)
{
    juice_index += 0.05;
    showtime_buffer = 100;
    
    if (!instance_exists(obj_ghostcollectibles))
        timer_y = approach(timer_y, timer_ystart, 1);
    else
        timer_y = approach(timer_y, timer_ystart + 212, 4);
}
else if (global.panic)
{
    if (garpo_sprite == spr_timer_Garpo)
    {
        garpo_sprite = spr_timer_wakeup;
        garpo_index = 0;
        juice_index = 0;
    }
    else if (garpo_sprite == spr_timer_wakeup)
    {
        garpo_index += 0.25;
        garpo_index = clamp(garpo_index, 0, sprite_get_number(garpo_sprite) - 1);
        
        if (showtime_buffer > 0)
            showtime_buffer--;
        else
            timer_y = approach(timer_y, timer_ystart + 212, 1);
    }
}
else
{
    garpo_sprite = spr_timer_Garpo;
    hand_sprite = spr_null;
    timer_y = timer_ystart + 212;
}

if (global.panic && global.fill < (chunkmax / 5))
    hand_sprite = spr_null;

barfill_x -= 0.2;

if (barfill_x < -173)
    barfill_x = 0;

if (garpo_index >= sprite_get_number(garpo_sprite))
    garpo_index = frac(garpo_index);

if (juice_index >= sprite_get_number(spr_timer_juice))
    juice_index = frac(juice_index);

if (hand_index >= sprite_get_number(hand_sprite))
    hand_index = frac(hand_index);

if (johnface_index >= sprite_get_number(johnface_sprite))
    johnface_index = frac(johnface_index);

combo_posX = Wave(-5, 5, 2, 20);

if (global.combotime > 0 && global.combo != 0)
{
    switch (combo_state)
    {
        case 0:
            combo_posY += combo_vsp;
            combo_vsp += 0.5;
            
            if (combo_posY > 20)
                combo_state++;
            
            break;
        
        case 1:
            combo_posY = lerp(combo_posY, 0, 0.05);
            
            if (combo_posY < 1)
            {
                combo_posY = 0;
                combo_vsp = 0;
                combo_state++;
            }
            
            break;
        
        case 2:
            if (global.combotime < 30)
            {
                combo_posY += combo_vsp;
                
                if (combo_vsp < 20)
                    combo_vsp += 0.5;
                
                if (combo_posY > 0)
                {
                    combo_posY = 0;
                    combo_vsp = -1;
                    
                    if (global.combotime < 15)
                        combo_vsp = -2;
                }
            }
            else
            {
                combo_posY = approach(combo_posY, 0, 10);
            }
            
            break;
    }
}
else
{
    combo_posY = approach(combo_posY, -500, 5);
    combo_vsp = 0;
    combo_state = 0;
}

combofill_index += 0.35;

if (combofill_index > (sprite_get_number(spr_tv_combobubblefill) - 1))
    combofill_index = frac(combofill_index);
