#!/usr/bin/env bash

mkdir -p releases/
pushd releases/
zip --junk-paths -r TTF-Brosevka.zip ../dist/Brosevka/TTF/ -x "*.DS_Store" -x "__MACOSX"
zip --junk-paths -r NerdFont-Brosevka.zip ../dist/Brosevka/NF/ -x "*.DS_Store" -x "__MACOSX"
popd
