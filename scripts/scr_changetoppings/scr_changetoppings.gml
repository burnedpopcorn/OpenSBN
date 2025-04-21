function scr_changetoppings()
{
    with (obj_collect)
    {
        if (ds_list_find_index(global.saveroom, id) == -1)
        {
            if ((obj_player1.character == "P" && obj_player1.spotlight == 1) || (obj_player2.character == "P" && obj_player1.spotlight == 0))
                sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect);
            
            if ((obj_player1.character == "N" && obj_player1.spotlight == 1) || (obj_player2.character == "N" && obj_player1.spotlight == 0))
                sprite_index = choose(spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5);
            
            instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_cloudeffect);
            
            repeat (3)
                instance_create(x + (sprite_width / 2) + random_range(-5, 5), y + (sprite_height / 2) + random_range(-5, 5), obj_cloudeffect);
        }
    }
    
    with (obj_bigcollect)
    {
        if (ds_list_find_index(global.saveroom, id) == -1)
        {
            if ((obj_player1.character == "P" && obj_player1.spotlight == 1) || (obj_player2.character == "P" && obj_player1.spotlight == 0))
                sprite_index = choose(spr_null, spr_null, spr_null);
            
            if ((obj_player1.character == "N" && obj_player1.spotlight == 1) || (obj_player2.character == "N" && obj_player1.spotlight == 0))
                sprite_index = choose(spr_pizzacollect1halloween, spr_pizzacollect2halloween, spr_pizzacollect3halloween, spr_pizzacollect4halloween, spr_pizzacollect5halloween);
            
            instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_cloudeffect);
            
            repeat (3)
                instance_create(x + (sprite_width / 2) + random_range(-10, 10), y + (sprite_height / 2) + random_range(-5, 5), obj_cloudeffect);
        }
    }
    
    with (obj_giantcollect)
    {
        if (ds_list_find_index(global.saveroom, id) == -1)
        {
            if ((obj_player1.character == "P" && obj_player1.spotlight == 1) || (obj_player2.character == "P" && obj_player1.spotlight == 0))
                sprite_index = spr_null;
            
            if ((obj_player1.character == "N" && obj_player1.spotlight == 1) || (obj_player2.character == "N" && obj_player1.spotlight == 0))
                sprite_index = spr_null;
            
            instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_cloudeffect);
            
            repeat (5)
                instance_create(x + (sprite_width / 2) + random_range(-15, 15), y + (sprite_height / 2) + random_range(-5, 5), obj_cloudeffect);
        }
    }
    
    with (obj_destroyable2)
    {
        if (ds_list_find_index(global.saveroom, id) == -1)
        {
            if ((obj_player1.character == "P" && obj_player1.spotlight == 1) || (obj_player2.character == "P" && obj_player1.spotlight == 0))
                sprite_index = spr_destroyable2;
            
            if ((obj_player1.character == "N" && obj_player1.spotlight == 1) || (obj_player2.character == "N" && obj_player1.spotlight == 0))
                sprite_index = spr_destroyable2;
            
            instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_cloudeffect);
            
            repeat (3)
                instance_create(x + (sprite_width / 2) + random_range(-5, 5), y + (sprite_height / 2) + random_range(-5, 5), obj_cloudeffect);
        }
    }
    
    with (obj_destroyable2_big)
    {
        if (ds_list_find_index(global.saveroom, id) == -1)
        {
            if ((obj_player1.character == "P" && obj_player1.spotlight == 1) || (obj_player2.character == "P" && obj_player1.spotlight == 0))
                sprite_index = spr_bigbreakable;
            
            if ((obj_player1.character == "N" && obj_player1.spotlight == 1) || (obj_player2.character == "N" && obj_player1.spotlight == 0))
                sprite_index = spr_bigbreakable;
            
            instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_cloudeffect);
            
            repeat (3)
                instance_create(x + (sprite_width / 2) + random_range(-10, 10), y + (sprite_height / 2) + random_range(-5, 5), obj_cloudeffect);
        }
    }
    
    exit;
}
