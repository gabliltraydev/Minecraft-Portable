SET "DIR=%cd%"
SET "JAVA_HOME=runtime\jre-legacy\windows\jre-legacy"
SET "JAVA=%JAVA_HOME%\bin\javaw.exe"
SET MAX_MEM=4G
SET LIBRARIES=versions\1.16.5\natives
SET MAIN_CLASS=net.minecraft.client.main.Main
SET CLASSPATH=libraries\com\mojang\text2speech\1.11.3\text2speech-1.11.3-natives-windows.jar;libraries\org\ow2\asm\asm-commons\6.2\asm-commons-6.2.jar;libraries\net\minecraft\launchwrapper\1.12\launchwrapper-1.12.jar;libraries\commons-io\commons-io\2.5\commons-io-2.5.jar;libraries\org\lwjgl\lwjgl\3.2.2\lwjgl-3.2.2.jar;libraries\org\apache\httpcomponents\httpcore\4.3.2\httpcore-4.3.2.jar;libraries\net\java\dev\jna\jna\4.4.0\jna-4.4.0.jar;libraries\oshi-project\oshi-core\1.1\oshi-core-1.1.jar;libraries\net\java\jutils\jutils\1.0.0\jutils-1.0.0.jar;libraries\org\apache\commons\commons-compress\1.8.1\commons-compress-1.8.1.jar;libraries\net\sf\jopt-simple\jopt-simple\5.0.3\jopt-simple-5.0.3.jar;libraries\v1\objects\37fd3c903861eeff3bc24b71eed48f828b5269c8\client.jar;libraries\org\lwjgl\lwjgl-glfw\3.2.2\lwjgl-glfw-3.2.2-natives-windows.jar;libraries\com\mojang\patchy\1.3.9\patchy-1.3.9.jar;libraries\it\unimi\dsi\fastutil\8.2.1\fastutil-8.2.1.jar;libraries\com\mojang\text2speech\1.11.3\text2speech-1.11.3.jar;libraries\org\apache\logging\log4j\log4j-core\2.8.1\log4j-core-2.8.1.jar;libraries\org\lwjgl\lwjgl-jemalloc\3.2.2\lwjgl-jemalloc-3.2.2.jar;libraries\com\mojang\datafixerupper\4.0.26\datafixerupper-4.0.26.jar;libraries\org\apache\logging\log4j\log4j-api\2.8.1\log4j-api-2.8.1.jar;libraries\com\ibm\icu\icu4j\66.1\icu4j-66.1.jar;libraries\com\mojang\javabridge\1.0.22\javabridge-1.0.22.jar;libraries\org\lwjgl\lwjgl\3.2.2\lwjgl-3.2.2-natives-windows.jar;libraries\org\lwjgl\lwjgl-jemalloc\3.2.2\lwjgl-jemalloc-3.2.2-natives-windows.jar;libraries\org\ow2\asm\asm-tree\6.2\asm-tree-6.2.jar;libraries\org\lwjgl\lwjgl-openal\3.2.2\lwjgl-openal-3.2.2.jar;libraries\org\lwjgl\lwjgl-glfw\3.2.2\lwjgl-glfw-3.2.2.jar;libraries\org\lwjgl\lwjgl-opengl\3.2.2\lwjgl-opengl-3.2.2-natives-windows.jar;libraries\org\lwjgl\lwjgl-tinyfd\3.2.2\lwjgl-tinyfd-3.2.2-natives-windows.jar;libraries\org\apache\httpcomponents\httpclient\4.3.3\httpclient-4.3.3.jar;libraries\org\lwjgl\lwjgl-stb\3.2.2\lwjgl-stb-3.2.2-natives-windows.jar;libraries\net\java\jinput\jinput\2.0.5\jinput-2.0.5.jar;libraries\org\apache\commons\commons-lang3\3.5\commons-lang3-3.5.jar;libraries\com\google\guava\guava\21.0\guava-21.0.jar;libraries\net\java\dev\jna\platform\3.4.0\platform-3.4.0.jar;libraries\org\lwjgl\lwjgl-stb\3.2.2\lwjgl-stb-3.2.2.jar;libraries\com\mojang\authlib\2.1.28\authlib-2.1.28.jar;libraries\org\lwjgl\lwjgl-openal\3.2.2\lwjgl-openal-3.2.2-natives-windows.jar;libraries\com\mojang\brigadier\1.0.17\brigadier-1.0.17.jar;libraries\org\lwjgl\lwjgl-opengl\3.2.2\lwjgl-opengl-3.2.2.jar;libraries\commons-codec\commons-codec\1.10\commons-codec-1.10.jar;libraries\commons-logging\commons-logging\1.1.3\commons-logging-1.1.3.jar;libraries\io\netty\netty-all\4.1.25.Final\netty-all-4.1.25.Final.jar;libraries\org\ow2\asm\asm\6.2\asm-6.2.jar;libraries\org\lwjgl\lwjgl-tinyfd\3.2.2\lwjgl-tinyfd-3.2.2.jar;libraries\com\google\code\gson\gson\2.8.0\gson-2.8.0.jar
SET JAVA_OPTIONS=-Xmx%MAX_MEM% -Xmn128M -XX:HeapDumpPath=MojangTricksIntelDriversForPerformance_javaw.exe_minecraft.exe.heapdump -Djava.library.path=%LIBRARIES% -Dminecraft.launcher.brand=java-minecraft-launcher -Dminecraft.launcher.version=unknown -cp %CLASSPATH% %MAIN_CLASS%
setlocal enabledelayedexpansion

set /p NICK=<"nick.txt"
 @echo !NICK! >"nick.txt"

set /p UUID=<"uuid.txt"
if "%UUID%"=="" (
  set "string=abcdef0123456789"
  set "uuid="
  for /L %%i in (1,1,32) do call :add
  @echo !uuid! >"uuid.txt"
  goto :continue

  :add
  set /a x=%random% %% 16 
  set uuid=%uuid%!string:~%x%,1!
  goto :eof
)
:continue

start "" /D "%DIR%" /I /HIGH "%JAVA%" %JAVA_OPTIONS% --version 1.16.5 --gameDir . --assetsDir assets --assetIndex 1.16 --accessToken 1337535510N --userType legacy --uuid %uuid% --username %NICK% 

