#!/usr/bin/env bash

npm run build -- ttf::Brosevka

pushd font-patcher/
for font in ../dist/Brosevka/TTF/*.ttf; do
	echo "font: $font"
	if [ -z "$CI" ]; then
		fontforge -script font-patcher --quiet --no-progressbars --complete \
			$font -out ../dist/Brosevka/NF
	else
		fontforge -script font-patcher --quiet --complete \
			$font -out ../dist/Brosevka/NF
	fi
done
popd

./tools/make-release.sh
