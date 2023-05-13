#!/usr/bin/env bash
# shellcheck disable=SC1091

#★ Ruby's development requirements

#- Set current directory to this script's directory
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
	#? '|| exit 1' is to prevent the script from continuing if the directory change fails

#- Update the APT cache and install dependencies
if [[ -e ./deps/ruby-deps.sh ]]; then
	. "./deps/ruby-deps.sh"
fi