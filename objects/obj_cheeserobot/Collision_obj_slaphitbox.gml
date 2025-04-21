instance_create(x + (obj_player1.xscale * 40), y, obj_punchdust);
state = states.grabbed;
obj_player1.state = states.grab;
instance_destroy(other);
obj_player1.suplexhavetomash = 5;
obj_player1.sprite_index = spr_player_grab;
