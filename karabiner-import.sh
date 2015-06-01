#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set remap.uk_section2backquote_ex_vm 1
/bin/echo -n .
$cli set remap.uk_section2backquote 1
/bin/echo -n .
$cli set remap.jis_command2eisuukana_prefer_command_notvirtualmachine 1
/bin/echo -n .
$cli set remap.jis_command2eisuukana_prefer_command_virtualmachine 1
/bin/echo -n .
/bin/echo
