docker run --rm -it -v "$(pwd):/workspace" -w /workspace \
  zmkfirmware/zmk-build-arm:stable /bin/bash -c \
  "git config --global --add safe.directory '*' && \
   west init -l config && \
   west update && \
   west zephyr-export && \
   export CMAKE_PREFIX_PATH=/workspace/zephyr:\$CMAKE_PREFIX_PATH && \
   west build -p -d build/left -s zmk/app -b xiao_ble -- -DSHIELD=forager_left -DZMK_CONFIG=/workspace/config && \
   cp build/left/zephyr/zmk.uf2 zmk_left.uf2 && \
   west build -p -d build/right -s zmk/app -b xiao_ble -- -DSHIELD=forager_right -DZMK_CONFIG=/workspace/config && \
   cp build/right/zephyr/zmk.uf2 zmk_right.uf2"
