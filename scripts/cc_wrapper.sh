#!/bin/sh
# Wrapper around cc for linking Crystal shared libraries on Linux/Unix.
# Crystal hardcodes -rdynamic in its linker invocation, which on Linux translates
# to -export-dynamic. This causes the linker to add all internal symbols into the
# dynamic symbol table (.dynsym). Crystal's mangled generic method names contain
# '@', which ELF linkers (GNU ld and LLD) interpret as symbol version tags,
# triggering "version node not found for symbol" or "undefined version" errors.
# By filtering out -rdynamic when building shared libraries, only symbols
# explicitly exported (e.g. via version-script) are placed in .dynsym.

for arg in "$@"; do
    if [ "$arg" != "-rdynamic" ]; then
        set -- "$@" "$arg"
    fi
    shift
done

target_cc="${REAL_CC:-cc}"
exec "$target_cc" "$@"
