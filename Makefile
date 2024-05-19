
ifeq ($(tui),yes)
	gdb_tui := gdb --tui --args 
endif

tetris:
	./halfvoid -g -C0 StandardHVLibrary -C1 Source --vk vk.xml -o /tmp/tetris.ll -cache /tmp/TetrisCache.zip
	clang -g /tmp/tetris.ll -lm -o tetris

run_nonstop:
	./halfvoid -run main -nonstop -g -C0 StandardHVLibrary -C1 Source --vk vk.xml -cache /tmp/TetrisCache.zip 
run_nonstop.exe:
	$(gdb_tui) ./halfvoid.exe -run main -nonstop -g -C0 StandardHVLibrary -C1 Source --vk vk.xml 
.PHONY: tetris run_nonstop run_nonstop.exe
