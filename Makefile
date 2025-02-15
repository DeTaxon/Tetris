
ifeq ($(tui),yes)
	gdb_tui := gdb --tui --args 
endif

tetris:
	./halfvoid -g -C0 ExperimentalLibrary -C0 StandardHVLibrary -C1 Source -o /tmp/tetris.ll -cache /tmp/TetrisCache.zip
	clang -g /tmp/tetris.ll -lm -o tetris

tetris_nonstop:
	./halfvoid -nonstop -g -C0 StandardHVLibrary -C1 Source --vk vk.xml -o /tmp/tetris.ll -cache /tmp/TetrisCache.zip
	clang -g /tmp/tetris.ll -lm -o tetris

win:
	./halfvoid  -emulate-tls -win32 -extra -g -C0 StandardHVLibrary -C1 Source --vk vk.xml -o /tmp/tetris.ll
	clang -mwindows --target=x86_64-w64-mingw32-gnu -g /tmp/tetris.ll -o tetris.exe
run:
	./halfvoid -run main -g -C0 ExperimentalLibrary -C0 StandardHVLibrary -C1 Source --vk vk.xml -cache /tmp/TetrisCache.zip 
run_nonstop:
	GALLIUM_HUD=fps+cpu $(gdb_tui) ./halfvoid -run main -nonstop -g  -C0 ExperimentalLibrary -C0 StandardHVLibrary -C1 Source -cache /tmp/TetrisCache.zip 
.PHONY: tetris run_nonstop run_nonstop.exe
