#!/usr/bin/bash/env bash
# shellcheck disable=SC1090

declare -gx btstartups="./.devcontainer/.scripts/startup"

if [[ -z "$btown" ]]; then
	for script in "${btstartups}"/*.sh; do
		source "$script"
	done
fi