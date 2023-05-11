#!/usr/bin/bash/env bash

declare -gx btstartups="../startups"

if [[ -z "$btown" ]]; then
	. "../startups/aliases.sh"
	
	for script in ""