<?php

namespace think;

use think\admin\service\SystemService;

require __DIR__ . '/../vendor/autoload.php';

SystemService::instance()->doInit(new App());