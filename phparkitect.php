<?php

declare(strict_types=1);

use Arkitect\ClassSet;
use Arkitect\CLI\Config;
use Arkitect\Expression\ForClasses\HaveNameMatching;
use Arkitect\Expression\ForClasses\ResideInOneOfTheseNamespaces;
use Arkitect\Rules\Rule;

return static function (Config $config): void {
    $config->add(
        ClassSet::fromDir(__DIR__.'/src'), ...[
            Rule::allClasses()
                ->that(new ResideInOneOfTheseNamespaces('App\Controller'))
                ->should(new HaveNameMatching('*Controller'))
                ->because('Controller classes must contain Controller suffix'),
        ])
    ;

    $config->add(
        ClassSet::fromDir(__DIR__.'/tests'), ...[
            Rule::allClasses()
                ->that(new ResideInOneOfTheseNamespaces('App\Tests'))
                ->should(new HaveNameMatching('*Test'))
                ->because('Tests classes must contain Test suffix'),
        ])
    ;
};
