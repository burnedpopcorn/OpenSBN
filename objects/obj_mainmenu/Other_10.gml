if (loading)
    exit;

loading = true;
global.currentsavefile = selected;
gamesave_async_load();
