#!/usr/bin/env bash

npm run build -- ttf::Brosevka

if [ -z "$CI" ]; then
	parallel fontforge -script font-patcher/font-patcher \
		--quiet --no-progressbars --complete -out dist/Brosevka/NF ::: dist/Brosevka/TTF/*.ttf
else
	parallel --progress fontforge -script font-patcher/font-patcher \
		--quiet --complete -out dist/Brosevka/NF ::: dist/Brosevka/TTF/*.ttf
fi

./tools/make-release.sh
