
sourceFiles = ./Source/*.swift
defaultOptions = -o ./build/forrit $(sourceFiles)
windowsOptions = -o ./build/Windows/forrit.exe $(sourceFiles)

debug: $(sourceFiles)
	swiftc $(defaultOptions)
	
run: $(sourceFiles)
	swiftc $(defaultOptions)
	./build/forrit

prod: $(sourceFiles)
	swiftc -O $(defaultOptions)

windows: $(sourceFiles)
	swiftc -O $(windowsOptions)

superopt: $(sourceFiles)
	swiftc -Ounchecked $(defaultOptions)

