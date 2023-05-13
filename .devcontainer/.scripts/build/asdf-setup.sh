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


#★ ASDF Setup

#- Check for existing ASDF installation
if [[ -e "$HOME/.asdf" ]]; then
	#- If ASDF is already installed, update it
	. "$HOME/.asdf/asdf.sh"
	asdf update
else
	#- If ASDF is not installed, install it with Git
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
fi

#- Add ASDF to the shell's environment
echo -e "\n. $HOME/.asdf/asdf.sh" >> "$HOME/.bashrc"
echo -e "\n. $HOME/.asdf/completions/asdf.bash" >> "$HOME/.bashrc"

#- Setup plugins
asdf plugin add ruby
asdf plugin add nodejs



#★ Installing Plugins
if [[ $(pwd) == *".devcontainer/.scripts/build"* ]]; then
	#- If the current directory is in the .devcontainer/.scripts/build folder, navigate to project root
	cd ../../.. || exit 1
fi

if [[ -e .tool-versions ]]; then
	#- If the project has a .tool-versions file, install the plugins
	asdf install
fi