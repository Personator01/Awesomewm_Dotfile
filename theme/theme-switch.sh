#swaps the contents of theme.lua and theme2.lua, then restarts awesome
DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
mv -f $DIR/theme.lua $DIR/themetemp.lua
mv -f $DIR/theme2.lua $DIR/theme.lua
mv -f $DIR/themetemp.lua $DIR/theme2.lua
awesome-client 'awesome.restart()'
