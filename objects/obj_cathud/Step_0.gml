if (!global.option_secret_cathud)
{
    instance_destroy();
    exit;
}

if (show == false)
    exit;

for (var i = 0; i < array_length(cats); i++)
{
    var c = cats[i];
    c.step();
}
