
tetris:
	./halfvoid -g -C0 StandardHVLibrary -C1 Source --vk vk.xml -o /tmp/tetris.ll -cache /tmp/TetrisCache.zip
	clang -g /tmp/tetris.ll -lm -o tetris

.PHONY: tetris
