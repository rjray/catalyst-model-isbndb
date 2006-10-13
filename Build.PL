#!/usr/bin/perl

# $Id: Build.PL 34 2006-10-11 09:07:36Z  $

use Module::Build;

my $build = Module::Build->new(
    module_name    => 'Catalyst::Model::ISBNDB',
    license        => 'artistic',
    requires       => { perl => '5.6.0',
                        WebService::ISBNDB => '0.31' },
    build_requires => { Test::More => 0 },
    dist_author    => 'Randy J. Ray <rjray@blackperl.com>',
    dist_abstract  =>
    'Catalyst model for accessing the isbndb.com REST interface',
    dist_version   => '0.10',
    sign           => 'here, please',
);

$build->add_to_cleanup(qw(META.yml Catalyst-Model-ISBNDB-* *.html *.log
                          t/*.log));
$build->create_build_script;
