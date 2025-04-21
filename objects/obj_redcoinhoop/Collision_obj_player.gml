instance_destroy();
instance_create(x, y, obj_genericpoofeffect);
scr_queueToolTipPrompt("Collect the Eclipse Coins!");
ds_list_add(global.saveroom, id);
global.redcoin = global.RedCoinMax;
global.redcoins = 0;
global.combotime = 60;
