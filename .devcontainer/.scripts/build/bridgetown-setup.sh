#!/usr/bin/bash/env bash
# shellcheck disable=SC1090

declare -gx btstartups="./.devcontainer/.scripts/startup"
declare rubyversion="3.0.2"
declare nodeversion="20.1.0"

# if [[ -z "$btown" ]]; then
# 	for script in "${btstartups}"/*.sh; do
# 		source "$script"
# 	done
# fi

#- Check if ASDF is installed and being used for Ruby
if [[ $(asdf) != *"command not found"* ]]; then
	#- If ASDF is installed, check if Ruby is installed
	if [[ $(asdf current ruby) == *"not installed"* ]]; then
		#- If Ruby is not installed, install it
		asdf install ruby
	fi
	#- Check if Node.js is installed
	if [[ $(asdf current nodejs) == *"not installed"* ]]; then
		#- If Node.js is not installed, install it
		asdf install nodejs
	fi
fi

#- Verify the plugins are executed using ASDF
if [[ $(which ruby) != *"asdf"* ]]; then
	#- If Ruby is not being executed using ASDF, add it to the shell's environment
	echo -e "\nRuby is not being executed using ASDF. Make sure '. $HOME/.asdf/asdf.sh' is in your shell's environment (e.g., '~/.bashrc)."
	exit 1
else
	#- If Ruby is being executed using ASDF, check if the required version is installed
	if [[ $(ruby -v) != *"$rubyversion"* ]]; then
		#- If the required version is not installed, install it
		asdf install ruby $rubyversion
	elif [[ $(ruby -v) == *"$rubyversion"* ]]; then
		#- If the required version is installed, set it as the global version
		echo -e "\nRuby is configured correctly for this project."
	fi
fi

if [[ $(which node) != *"asdf"* ]]; then
	#- If Node.js is not being executed using ASDF, add it to the shell's environment
	echo -e "\nNode.js is not being executed using ASDF.\nMake sure you've added the 'nodejs' plugin and installed the required version (from the .tool-versions file).\nThen make sure '. $HOME/.asdf/asdf.sh' is in your shell's environment (e.g., '~/.bashrc)."
	exit 1
else
	#- If Node.js is being executed using ASDF, check if the required version is installed
	if [[ $(node -v) != *"$nodeversion"* ]]; then
		#- If the required version is not installed, install it
		asdf install nodejs "$nodeversion"
	elif [[ $(node -v) == *"$nodeversion"* ]]; then
		#- If the required version is installed, set it as the global version
		echo -e "\nNode.js is configured correctly for this project."
	fi
fi

#- Check if Yarn is installed
if [[ $(which yarn) != "$HOME/.asdf/shims/yarn" ]]; then
	#- If Yarn is not installed, install it
	npm install -g yarn
fi



#- Install the beta version of Bridgetown
gem install bridgetown -N -v 1.3.0.beta1