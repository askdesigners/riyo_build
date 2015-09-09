<?php
    define('PERCH_LICENSE_KEY', 'P21509-NVW458-UUV452-LNX045-UUB007');

    define("PERCH_DB_USERNAME", 'riyo');
    define("PERCH_DB_PASSWORD", 'bKj5SG3DXnJKxBzc');
    define("PERCH_DB_SERVER", "localhost");
    define("PERCH_DB_DATABASE", "riyo_bd");
    define("PERCH_DB_PREFIX", "perch2_");
    
    define('PERCH_TZ', 'Europe/Prague');

    define('PERCH_EMAIL_FROM', 'ryan@askdesigners.eu');
    define('PERCH_EMAIL_FROM_NAME', 'Ryan Cole');

    define('PERCH_LOGINPATH', '/riyo_build/perch');
    define('PERCH_PATH', str_replace(DIRECTORY_SEPARATOR.'config', '', __DIR__));
    define('PERCH_CORE', PERCH_PATH.DIRECTORY_SEPARATOR.'core');

    define('PERCH_RESFILEPATH', PERCH_PATH . DIRECTORY_SEPARATOR . 'resources');
    define('PERCH_RESPATH', PERCH_LOGINPATH . '/resources');
    
    define('PERCH_HTML5', true);