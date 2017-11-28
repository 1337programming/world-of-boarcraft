# Sample build from bash

# Globals
RED_BRIGHT='\033[1;31m'
RED='\033[0;31m'
GREEN='\033[0;32m'
GREEN_BRIGHT='\033[1;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Check if emscripten is activated
echo -e "${YELLOW}Checking if Emscripten is installed and active...${NC}"
if ! [ -x "$(command -v em++)" ]; then
  echo "Emscripten not installed, cannot find (em++, emconfigure, emmake). Is Emscripten not installed or not activate in your environment?"
  echo -e "${RED_BRIGHT}Emscripten is not activated!${RED}\nIf  http://webassembly.org/getting-started/developers-guide/ for instructions.${NC}" >&2
  exit 1
fi

echo -e "${GREEN_BRIGHT}Emscripten is active, proceeding...${NC}"

rm -rf build
mkdir build
cd build/
emconfigure cmake ../
emmake make
