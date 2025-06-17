var i = ds_list_size(global.AfterImageList) - 1;

while (i > -1)
{
    with (ds_list_find_value(global.AfterImageList, i))
    {
        if (lifeTime > 0)
            lifeTime--;
        else
            vanish = true;
        
        if (doesBlink)
        {
            visible = global.BlinkTrail;
            
            if (afterImageType == UnknownEnum.Value_2)
                afterImageIndex = choose(0, 1);
        }
        
        if (afterImageType == UnknownEnum.Value_2)
        {
            if (!(ownerID.state == states.jump && ownerID.sprite_index == spr_null) && ownerID.pizzapepper == 0 && ownerID.state != states.ratmount && ownerID.state != states.grabbing && ownerID.state != states.freefall && ownerID.state != states.Sjump && ownerID.state != states.Parry && ownerID.state != states.chainsawbump && ownerID.state != states.punch && ownerID.state != states.chainsawbump && ownerID.state != states.rideweenie && ownerID.state != states.crouchslide && ownerID.state != states.grabbed && ownerID.pogochargeactive == 0 && ownerID.state != states.tacklecharge && ownerID.state != states.mach3 && ownerID.state != states.climbwall && ownerID.state != states.hookshot && ownerID.state != states.charge && ownerID.state != states.mach2 && ownerID.state != states.handstandjump && ownerID.state != states.machslide && ownerID.state != states.slam && ownerID.state != UnknownEnum.Value_65 && ownerID.state != states.machfreefall && ownerID.state != states.superslam && ownerID.state != states.machroll && ownerID.state != states.chainsaw && ownerID.state != states.Sjump && ownerID.state != states.boxxedpep)
                vanish = true;
            
            image_alpha = 0.65;
            
            if (ownerID.state == states.mach2 || ownerID.state == states.mach1 || ownerID.state == states.mach3)
                image_alpha *= (abs(ownerID.movespeed) / 12);
            
            with (ownerID)
            {
                if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
                    other.vanish = true;
            }
        }
        
        if (vanish)
        {
            fadingAlpha = approach(fadingAlpha, 0, (afterImageType > UnknownEnum.Value_2) ? 0.05 : 0.15);
            
            if (fadingAlpha <= 0)
                ds_list_delete(global.AfterImageList, i);
        }
    }
    
    i--;
}

if (blinkingBuffer > 0)
{
    blinkingBuffer--;
}
else
{
    event_user(0);
    blinkingBuffer = blinkingBufferMax;
}
