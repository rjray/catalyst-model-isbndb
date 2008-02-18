#!/usr/bin/perl
# $Id$

use Module::Build;

my $build = Module::Build->new(
    module_name    => 'Catalyst::Model::ISBNDB',
    license        => 'perl',
    requires       => { perl               => '5.006',
                        NEXT               => '0.6',
                        Catalyst::Runtime  => '5.7',
                        WebService::ISBNDB => '0.31' },
    build_requires => { Test::More => 0 },
    # This *should* be "build_recommends", since it is only for the tests
    recommends        => { Test::Pod => 0, Test::Pod::Coverage => 0 },
    dist_author    => 'Randy J. Ray <rjray@blackperl.com>',
    dist_version   => '0.21',
    dist_abstract  =>
    'Catalyst model for accessing the isbndb.com REST interface',
    sign           => 'here, please',
);

$build->add_to_cleanup(qw(META.yml Catalyst-Model-ISBNDB-* *.html *.log
                          t/*.log));
$build->create_build_script;
