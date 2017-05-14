<?php
    define('PERCH_LICENSE_KEY', 'P21509-NVW458-UUV452-LNX045-UUB007');

    define("PERCH_DB_USERNAME", 'web');
    define("PERCH_DB_PASSWORD", 'Lpfdopfrs');
    define("PERCH_DB_SERVER", "localhost");
    define("PERCH_DB_DATABASE", "riyo_cz");
    define("PERCH_DB_PREFIX", "perch2_");
    
    define('PERCH_TZ', 'Europe/Prague');

    define('PERCH_EMAIL_FROM', 'Mlch@mail.ctk.cz');
    define('PERCH_EMAIL_FROM_NAME', 'Petr Mlch');

    define('PERCH_LOGINPATH', '/perch');
    define('PERCH_PATH', str_replace(DIRECTORY_SEPARATOR.'config', '', __DIR__));
    define('PERCH_CORE', PERCH_PATH.DIRECTORY_SEPARATOR.'core');

    define('PERCH_RESFILEPATH', PERCH_PATH . DIRECTORY_SEPARATOR . 'resources');
    define('PERCH_RESPATH', PERCH_LOGINPATH . '/resources');
    
    define('PERCH_MAP_JS', 'js/maps.js');
    define('PERCH_HTML5', true);
    define('PERCH_RWD', true);

    // define('PERCH_DEBUG', true);
    