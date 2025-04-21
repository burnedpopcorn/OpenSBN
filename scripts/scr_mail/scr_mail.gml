function mailLetter(argument0, argument1 = UnknownEnum.Value_0, argument2 = "") constructor
{
    static checkUnlock = function(argument0)
    {
        if (unlocked)
            exit;
        
        if (trigger == argument0)
        {
            var do_unlock = false;
            
            if (!is_undefined(unlockFunc))
                do_unlock = unlockFunc();
            else
                do_unlock = true;
            
            if (do_unlock)
            {
                unlocked = true;
                
                if (!is_undefined(onUnlock))
                    onUnlock();
                
                quick_ini_write_real(obj_savesystem.ini_str, "Mail", name, 1);
                gamesave_async_save();
            }
        }
    };
    
    static setRead = function()
    {
        if (read)
            exit;
        
        read = true;
        
        if (!is_undefined(onRead))
            onRead();
        
        quick_ini_write_real(obj_savesystem.ini_str, "Mail", name, 2);
        gamesave_async_save();
    };
    
    name = argument0;
    trigger = argument1;
    content = argument2;
    important = false;
    paperspr = spr_mail_paper1;
    envelopespr = spr_letter;
    unlocked = false;
    read = false;
    onRead = undefined;
    onUnlock = undefined;
    unlockFunc = undefined;
}

function addLetter(argument0, argument1, argument2 = "Hey sucker,\r\n  this letter's empty.\r\n  \r\n  \r\n  \r\n  \r\n  \r\n  \r\n  \r\n  Too bad for you,\r\n- Letters Larry\r\n", argument3 = undefined)
{
    var m = new mailLetter(argument0, argument1, argument2);
    var v = quick_ini_read_real(obj_savesystem.ini_str, "Mail", argument0, false);
    var importantArr = ["rankP", "rankS", "rankA", "rankB", "rankC", "rankD", "speeding", "skater", "marinated", "threeliter", "nevermind", "raisinsr", "shadyrabbit", "fishland", "drown", "eclipse", "fishdance", "pillarfightback", "lostpet", "awesome", "bodad", "soundtest", "credits", "sugar", "taxes", "typo", "bro", "shopping", "devil", "devilgrape", "bomom", "mirror", "pink", "closecall", "toppinSMidway", "toppinSWater", "cherryjail", "speakerbox", "savouri"];
    m.unlocked = v >= 1;
    m.read = v >= 2;
    
    if (array_contains(importantArr, argument0))
        m.important = true;
    
    if (!is_undefined(argument3))
        m.unlockFunc = argument3;
    
    trace(string("Added Letter {0}", argument0));
    array_push(global.mailArr, m);
    return m;
}

function mail_trigger(argument0)
{
    if (!variable_global_exists("mailArr"))
        exit;
    
    show_debug_message(concat("Mail Trigger: ", argument0));
    var gotall = true;
    
    for (var i = 0; i < array_length(global.mailArr); i++)
    {
        var mail = global.mailArr[i];
        mail.checkUnlock(argument0);
        
        if (mail.important && !mail.unlocked)
            gotall = false;
    }
    
    if (gotall && argument0 == UnknownEnum.Value_0)
        quick_ini_write_real(obj_savesystem.ini_str, "Game", "allmail", true);
}

function scr_initMail()
{
    global.mailArr = [];
    addLetter("default", UnknownEnum.Value_0, "Bo,\r\n  While you're here\r\n  don't even THINK\r\n  about reading my\r\n  mail.\r\n  \r\n  \r\n  \r\n  \r\n  I'll be watching,\r\n- Mr. Grape");
    addLetter("rankP", UnknownEnum.Value_1, "You did it, Bo!\r\n  You've done what\r\n  I never could!\r\n  \r\n  Despite finding all\r\n  two secrets and going\r\n  straight to the exit,\r\n  `U` never appeared.\r\n  \r\n  Plus-Tastic Job,\r\n- `U`R Biggest Fan", function()
    {
        return string_lower(global.rank) == "p";
    });
    addLetter("rankS", UnknownEnum.Value_1, "Mr. Bo Noise,\r\n  We're writing you to\r\n  let you know that we\r\n  think your performance\r\n  was undeniably\r\n  `Tuc-Tastic`!\r\n  By that we mean\r\n  your movement was\r\n  buttery and crisp.\r\n  Stay delicious,\r\n- Club Tuc", function()
    {
        return string_lower(global.rank) == "s";
    });
    addLetter("rankA", UnknownEnum.Value_1, "Dear Bo,\r\n  You did an `average`\r\n  job, congratulations.\r\n  \r\n  There was no attempt\r\n  to push yourself\r\n  beyond your limits\r\n  and that's okay.\r\n  \r\n  Best Wishes,\r\n- Middle Management", function()
    {
        return string_lower(global.rank) == "a";
    });
    addLetter("rankB", UnknownEnum.Value_1, "BBOO NOOISE,\r\n  HEY BBOO, YOOU\r\n  COOULD HAVE DOONE\r\n  A BBIT BBETTER.\r\n  \r\n  `OO WHALE`,\r\n  YOOU'LL GET IT\r\n  NEXT TIME.\r\n  \r\n  SEA YOOU LATER,\r\n- SEAMUS", function()
    {
        return string_lower(global.rank) == "b";
    });
    addLetter("rankC", UnknownEnum.Value_1, "Hey there Bo,\r\n  Heard you dun went\r\n  and got yourself\r\n  a `Rank`.\r\n  \r\n  Congrats, kid.\r\n  I used to be quite\r\n  `Rank` back in my day.\r\n  \r\n  Keep that up, y'hear?\r\n- C `R` Reynolds", function()
    {
        return string_lower(global.rank) == "c";
    });
    addLetter("rankD", UnknownEnum.Value_1, "Dear Bo,\r\n  Congratulations!\r\n  \r\n  We're proud to\r\n  include you in the\r\n  `F-Rank` Hall of\r\n  Fame as our first\r\n  ever entrant!\r\n  \r\n  You should be proud,\r\n- Failures Weekly Magazine", function()
    {
        return string_lower(global.rank) == "d";
    });
    addLetter("speeding", UnknownEnum.Value_1, "Bo Noise,\r\n  We caught you absolutly\r\n  FLYING past\r\n  our neighborhood.\r\n  \r\n  Really, going those\r\n  speeds ought to be\r\n  a crime!\r\n  \r\n  Slow down!\r\n- Midwayborhood Watch", function()
    {
        if (global.leveltosave == "midway" && global.level_minutes < 3 && global.level_minutes > 0 && global.rank != "none")
            return true;
        
        return false;
    });
    addLetter("skater", UnknownEnum.Value_6, "Bo,\r\n  Me and the boys\r\n  saw you stunt on\r\n  EVERY rail in\r\n  the M.I.D.!\r\n  \r\n  When you're in next,\r\n  hang with us, OK?\r\n  \r\n  You're rad bro,\r\n- Club Railgrind", function()
    {
        return global.grinds >= 36;
    });
    addLetter("marinated", UnknownEnum.Value_5, "Howdy Bo,\r\n  You know, marinating \r\n  food really helps to\r\n  bring out that extra \r\n  flavor kick!\r\n  \r\n  Next time we meet,\r\n  try my adobo verde.\r\n  \r\n  Back to the grill!\r\n- Charcoal Cassidy", function()
    {
        return global.marinatecount >= 20;
    });
    addLetter("threeliter", UnknownEnum.Value_1, "Dear Bo,\r\n  I am SO sorry that\r\n  my dogs have been\r\n  misbehaving lately.\r\n  \r\n  At least they didn't\r\n  hurt you, so remember\r\n  you can't sue me now.\r\n  \r\n  Regards,\r\n- Lady Threeliter", function()
    {
        return global.twoliterpain == false && global.leveltosave == "midway";
    });
    addLetter("nevermind", UnknownEnum.Value_22, "Hey Bo!\r\n  \r\n  \r\n  \r\n  \r\n   \r\n  \r\n  \r\n  \r\n        nevermind\r\n", function()
    {
        return room == midway_3;
    });
    addLetter("raisinsr", UnknownEnum.Value_22, "Dearest Grandson,\r\n  Best of luck with\r\n  your new mansion!\r\n  \r\n  How were you able\r\n  to afford it\r\n  at your age?\r\n  \r\n  \r\n  Have me over soon,\r\n- Raisin Sr.", function()
    {
        return room == midway_7 && camera_get_view_x(view_camera[0]) < (room_width / 2);
    });
    addLetter("shadyrabbit", UnknownEnum.Value_22, "Dear Friend,\r\n  Thank you for save me.\r\n  \r\n  I hope you know you'll \r\n  be my pal forever.\r\n  \r\n  I'm going back\r\n  to my corner now.\r\n\r\n  I love you,\r\n- Shade E. Rabbit", function()
    {
        return room == midway_7 && camera_get_view_x(view_camera[0]) > (room_width / 2);
    });
    addLetter("fishland", UnknownEnum.Value_8, "Dear Bo N.,\r\n  Stop pretending to\r\n  be an endangered fish.\r\n  \r\n  It's not funny, we\r\n  get worried everytime.\r\n  \r\n  \r\n  \r\n  Stop wasting our time,\r\n- Animal Rescue Services");
    addLetter("drown", UnknownEnum.Value_9, "Hello Bo,\r\n  We saw you drown\r\n  in the lake earlier.\r\n  \r\n  Maybe next time\r\n  you should wear\r\n  some floaties.\r\n  \r\n  \r\n  \r\n- The Safety Team");
    addLetter("eclipse", UnknownEnum.Value_12, "Wonderful Stranger,\r\n  As if they were one\r\n  \r\n  Intwined in a\r\n  cosmic dance\r\n  \r\n  dark eclipses light.\r\n  \r\n  Thank you for\r\n  this insight,\r\n- Mr. Red", function()
    {
        return global.redcoincount >= 48 && global.leveltosave == "fish";
    });
    addLetter("fishdance", UnknownEnum.Value_11, "Hi Bo,\r\n  Thanks for dancing\r\n  with me earlier.\r\n  \r\n  Come back soon,\r\n  I'll be working\r\n  on my moves.\r\n  \r\n  \r\n  \r\n- S. Fish");
    addLetter("pillarfightback", UnknownEnum.Value_10, "Good day Bo,\r\n  Ha! Got you old boy!\r\n  \r\n  Bet you didn't\r\n  think that these\r\n  shriveled arms\r\n  packed a punch!\r\n  \r\n  \r\n  Take care now,\r\n- Raisin");
    addLetter("bobby1", UnknownEnum.Value_7, "Dear Bo,\r\n  Please Help me!\r\n\r\n  I've lost my baby\r\n  in Lake Eerie!\r\n\r\n  It's no coincidence\r\n  that he looks just\r\n  like you!\r\n\r\n- Concerned Parent");
    addLetter("bobby2", UnknownEnum.Value_7, "Bo,\r\n  How could you\r\n  so ruthlessly kill\r\n  your own clone?\r\n\r\n  He only wanted to\r\n  pose and laugh\r\n  with his loved ones.\r\n\r\n  You make me sick.\r\n- Detective G");
    addLetter("lostpet", UnknownEnum.Value_22, "Dear Bo,\r\n  Thanks for finding\r\n  my lost pet.\r\n\r\n  It will rest in the cave \r\n  and live on in my \r\n  heart forever.\r\n\r\n  \r\n  I'm finally at peace,\r\n- Relieved Pet Owner", function()
    {
        return room == water_9;
    });
    addLetter("awesome", UnknownEnum.Value_2, "Dear Bo,\r\n  Never before have we\r\n  witnessed such control\r\n  over the elements.\r\n  \r\n  Given the OPTION,\r\n  we would like to admit\r\n  you into the council.\r\n  Your TYPE is rare.\r\n  Simply `AWESOME`,\r\n- Secret Council of Control", function()
    {
        if (room != hub_world1)
            return false;
        
        with (obj_player1)
        {
            if (state == states.firemove)
                return true;
        }
        
        return false;
    });
    addLetter("bodad", UnknownEnum.Value_22, "Heya sport!\r\n  It's your old man!\r\n\r\n  Heard you broke into\r\n  some guy's mansion.\r\n  \r\n  \r\n  \r\n  \r\n   Keep it up,\r\n- Bo Dad", function()
    {
        return room == hub_world1;
    });
    addLetter("soundtest", UnknownEnum.Value_2, "Hey Bo,\r\n  Tanks fr visit, bro!\r\n  \r\n  Hop U lov my\r\n  awsom cool music!\r\n  \r\n  I payed a lot\r\n  fo rthe speakers.\r\n  \r\n  Rock on,\r\n- Bub", function()
    {
        return room == hub_soundtest;
    });
    addLetter("credits", UnknownEnum.Value_21, "Dear Bo,\r\n  Thank you for\r\n  viewing the credits.\r\n  We're happy that\r\n  you watched them all\r\n  but did you need\r\n  to throw tomatoes?\r\n  \r\n  We'd like more TUCs\r\n  next time,\r\n- Dee Veloper");
    addLetter("sugar", UnknownEnum.Value_22, "Bo,\r\n  Why didn't you\r\n  let me out?\r\n  \r\n  Please come back\r\n  and get me out\r\n  of this place!\r\n  \r\n  \r\n  Any day now...\r\n- P `S` T", function()
    {
        return room == hub_secretdanceroom;
    });
    addLetter("exhibition", UnknownEnum.Value_22, "Bo,\r\n  I've seen the light\r\n  of the outside world\r\n  for the first time in\r\n  years.\r\n\r\n  I don't think I'll be\r\n  gone for long, I grew\r\n  to like that water bottle.\r\n  Be back soon,\r\n- P `S` T", function()
    {
        if (room != hub_secretdanceroom)
            return false;
        
        return current_year <= 2025 && current_month == 1 && current_day < 14;
    });
    addLetter("taxes", UnknownEnum.Value_1, "Dear Mr. Grape,\r\n  This is yet another\r\n  reminder regarding\r\n  your overdue tax \r\n  payments relating to \r\n  the purchase of\r\n  `Grape Manor`.\r\n  \r\n  \r\n  Awaiting your response,\r\n- Internal Revenue Service", function()
    {
        return global.leveltosave == "midway";
    });
    addLetter("typo", UnknownEnum.Value_1, "Dear Bo\r\n  `,c(og ,cc stAlg`\r\n  \r\n  FUCK\r\n  \r\n  I had a hyper typo\r\n  \r\n  I meant to say\r\n  \r\n  `Hello!`\r\n- Little", function()
    {
        return global.leveltosave == "fish";
    });
    addLetter("bro", UnknownEnum.Value_22, "Hey Bro,\r\n  Where did you park\r\n  my car?\r\n\r\n  I needed it tonight!\r\n\r\n  Now I'm going to\r\n  miss my `hot` date.\r\n\r\n  SO not cool, bro.\r\n- Bro Noise", function()
    {
        return room == hub_secretmidway;
    });
    addLetter("shopping", UnknownEnum.Value_22, "Shopping List\r\n  - Milk\r\n  - Eggs\r\n  - Chicken Legs\r\n  - Cereal\r\n  - Yogurt\r\n  - NO GRAPES\r\n   I MEAN IT\r\n\r\n  DON'T FUCK IT UP\r\n- ME", function()
    {
        return room == water_2;
    });
    
    addLetter("devil", UnknownEnum.Value_22, "Wretched Soul,\r\n  Send this letter\r\n  to five-thousand\r\n  other people and\r\n  I'll THINK about\r\n  not hexing you.\r\n\r\n  I'll have you soon,\r\n- Devil", function()
    {
        return room == water_5;
    }).onUnlock = function()
    {
        mail_trigger(UnknownEnum.Value_13);
    };
    
    addLetter("devilgrape", UnknownEnum.Value_13, "Bo,\r\n  Wretched Soul,\r\n   Send this letter\r\n   to five-thousand\r\n   other people and\r\n   I'll THINK about\r\n   not hexing you.\r\n  \r\n   I'll have you soon,\r\n  - Devil\r\n- Mr Grape");
    addLetter("bomom", UnknownEnum.Value_22, "Dear Bo,\r\n  I baked cookies!\r\n  I stapled a sample\r\n  in this letter\r\n  \r\n  \r\n  (it seems only\r\n  crumbs are left)\r\n  \r\n  With love, \r\n- Bo Mom", function()
    {
        return room == midway_2;
    });
    addLetter("mirror", UnknownEnum.Value_1, "Mr. Grape,\r\n  I'm writing to\r\n  inquire about the\r\n  special properties\r\n  of your unique mirror\r\n\r\n  What was it that\r\n  you needed to do\r\n  to activate it?\r\n  Regards,\r\n- Perry Turkee", function()
    {
        return string_lower(global.lastrank == "p") && string_lower(global.rank == "p");
    });
    addLetter("pink", UnknownEnum.Value_22, "LUCKIEST WINNER,\r\n  IF YOU RECEIVED THIS\r\n  THEN YOU NEED TO\r\n  KISS YOUR HAND\r\n  FIVE TIMES AND\r\n  REPOST THIS MESSAGE\r\n  TWICE TO FIND A\r\n  PINK IPAD UNDER\r\n  YOUR PILLOW TONIGHT!\r\n  ACT NOW,\r\n- PRIZEWIN LLC", function()
    {
        return room == water_8;
    });
    addLetter("closecall", UnknownEnum.Value_15, "BO,\r\n  STOP RUNNING.\r\n  IF YOU'RE GOING\r\n  TO LIVE IN MY\r\n  HOUSE, YOU\r\n  MIGHT AS WELL\r\n  FIGHT ME.\r\n  \r\n  \r\n  UP YOURS,\r\n- Mr. Grape");
    addLetter("toppinSMidway", UnknownEnum.Value_1, "Hello Bo,\r\n  It is I, your OC.\r\n\r\n  Now that you released\r\n  me unto your world,\r\n  you shall also\r\n  be blessed with\r\n  freedom.\r\n  \r\n  Regards, \r\n-Bo Crystal", function()
    {
        return quick_ini_read_real(obj_savesystem.ini_str, "Toppin", "midwayS", 0) > 0;
    });
    addLetter("toppinSWater", UnknownEnum.Value_1, "Hii Bob man!!\r\n  Tanks for helping\r\n  me out! That cave\r\n  was too cramped!!\r\n\r\n  ok, mayb it was\r\n  a litle comfy.\r\n\r\n\r\n  With love, \r\n-Sette", function()
    {
        return quick_ini_read_real(obj_savesystem.ini_str, "Toppin", "fishS", 0) > 0;
    });
    addLetter("cherryjail", UnknownEnum.Value_4, "Fuck you Bo,\r\n  I'm in prison after\r\n  you made me kill\r\n  that grape.\r\n  \r\n  The guilt that I\r\n  feel is unbearable.\r\n  \r\n  \r\n  Rot in hell,\r\n- Cher `E` Spit");
    addLetter("speakerbox", UnknownEnum.Value_14, "Hey Bo,\r\n  You found me twice.\r\n\r\n  That's not nice.\r\n\r\n  Please stop running.\r\n\r\n  Or I start killing.\r\n\r\n- Speaker Box", function()
    {
        return global.speakerbox[0] == true && global.speakerbox[1] == true;
    });
    addLetter("savouri", UnknownEnum.Value_1, "Bo,\r\n  Why did you free\r\n  all my Savouri?\r\n\r\n  I needed those\r\n  to help pay off\r\n  my mansion!\r\n  \r\n  Now I'm done for!\r\n\r\n  Fuck you,\r\n- Mr. Grape", function()
    {
        var levels = ["midway", "fish"];
        var toppincount = 0;
        var level_count = array_length(levels);
        
        for (var i = 0; i < level_count; i++)
        {
            var level = levels[i];
            
            for (var t = 1; t < 6; t++)
            {
                if (quick_ini_read_real(obj_savesystem.ini_str, "Toppin", string("{0}{1}", level, t), 0))
                    toppincount++;
            }
        }
        
        return toppincount >= (level_count * 5);
    });
    addLetter("christmas", UnknownEnum.Value_0, "Dear Bo,\r\n  I'm so sorry that\r\n  your pony got lost\r\n  in the post last\r\n  year.\r\n\r\n  I'll make it up by\r\n  bringing one myself\r\n  this time.\r\n  Happy Christmas,\r\n- S. Claus", function()
    {
        return current_month == 12 && (current_day > 21 && current_day < 30);
    });
    addLetter("halloween", UnknownEnum.Value_0, "Boo Nooise,\r\n  I creeped out of\r\n  my coffin kept\r\n  hidden in my\r\n  secret crypt to send\r\n  you this message...\r\n  \r\n  BOO!!!\r\n  \r\n  Happy Halloween,\r\n- Count Raisin", function()
    {
        return (current_month == 10 && current_day > 28) || (current_month == 11 && current_day < 4);
    });
    addLetter("valentine", UnknownEnum.Value_0, "Bo...\r\n  \r\n  \r\n  \r\n  \r\n  I want you..\r\n  \r\n  \r\n  \r\n  \r\n- It's A Secret", function()
    {
        return current_month == 2 && current_day == 14;
    });
    addLetter("fool", UnknownEnum.Value_0, "Hey sucker,\r\n  this letter's empty.\r\n  \r\n  \r\n  \r\n  \r\n  \r\n  \r\n  \r\n  Too bad for you,\r\n- Letters Larry\r\n", function()
    {
        return current_month == 4 && current_day == 1;
    });
    addLetter("luigicall", UnknownEnum.Value_17, "Hey Yellow Bro,\r\n  Where did you get\r\n  my number?\r\n  \r\n  I thought I\r\n  wiped it from every\r\n  menu out there!\r\n  \r\n  \r\n  Please stop calling,\r\n-L");
    addLetter("kittentalk", UnknownEnum.Value_20, "Hellow Meowster,\r\n  Meow! Meow!\r\n  Miau! Miau!\r\n  Mau! Mau!\r\n  Miaou! Miaou!\r\n  Myau! Myau!\r\n  Nyan! Nyan!\r\n  \r\n  \r\n  \r\n- The Polyglot Kittens");
    addLetter("maxlevel", UnknownEnum.Value_19, "Dear Bo the Powerful,\r\n  Congratulations on\r\n  maximizing your\r\n  potential!\r\n\r\n  The guild celebrates\r\n  your achievement with\r\n  this ROCKET POWERED\r\n  GRENADE!\r\n  Regards,\r\n- Max Level Guild");
    addLetter("maxdefense", UnknownEnum.Value_18, "Dearest Reader,\r\n  This message may\r\n  seem a tad heavier\r\n  than normal.\r\n\r\n  It's because this\r\n  is actually\r\n  chain-mail!\r\n\r\n  Ha!\r\n- Mr Armour");
}

function scr_mailContent()
{
}
