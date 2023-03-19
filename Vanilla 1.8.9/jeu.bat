SET "DIR=%cd%"
SET "JAVA_HOME=runtime\jre-legacy\windows\jre-legacy"
SET "JAVA=%JAVA_HOME%\bin\javaw.exe"
SET MAX_MEM=4G
SET LIBRARIES=versions\1.8.9\natives
SET MAIN_CLASS=net.minecraft.client.main.Main
SET CLASSPATH=libraries\com\mojang\authlib\1.5.21\authlib-1.5.21.jar;libraries\org\tlauncher\authlib\1.5.21\authlib-1.5.21.jar;libraries\org\tlauncher\authlib\1.7.211\authlib-1.7.211.jar;libraries\com\paulscode\codecjorbis\20101023\codecjorbis-20101023.jar;libraries\commons-codec\commons-codec\1.9\commons-codec-1.9.jar;libraries\commons-io\commons-io\2.4\commons-io-2.4.jar;libraries\org\apache\commons\commons-lang3\3.3.2\commons-lang3-3.3.2.jar;libraries\net\java\dev\jna\jna\3.4.0\jna-3.4.0.jar;libraries\net\sf\jopt-simple\jopt-simple\4.6\jopt-simple-4.6.jar;libraries\net\minecraft\launchwrapper\1.7\launchwrapper-1.7.jar;libraries\com\paulscode\librarylwjglopenal\20100824\librarylwjglopenal-20100824.jar;libraries\oshi-project\oshi-core\1.1\oshi-core-1.1.jar;libraries\org\tlauncher\tl_skin_cape_1.8.9\1.16_opti\tl_skin_cape_1.8.9-1.16_opti.jar;libraries\tv\twitch\twitch\6.5\twitch-6.5.jar;libraries\tv\twitch\twitch-platform\6.5\twitch-platform-6.5-natives-windows-64.jar;libraries\v1\objects\3870888a6c3d349d3771a3e9d16c9bf5e076b908\client.jar;libraries\com\paulscode\codecwav\20101023\codecwav-20101023.jar;libraries\org\apache\commons\commons-compress\1.8.1\commons-compress-1.8.1.jar;libraries\commons-logging\commons-logging\1.1.3\commons-logging-1.1.3.jar;libraries\com\ibm\icu\icu4j-core-mojang\51.2\icu4j-core-mojang-51.2.jar;libraries\net\java\jinput\jinput\2.0.5\jinput-2.0.5.jar;libraries\net\java\jinput\jinput-platform\2.0.5\jinput-platform-2.0.5-natives-windows.jar;libraries\net\minecraft\launchwrapper\1.12\launchwrapper-1.12.jar;libraries\com\paulscode\libraryjavasound\20101123\libraryjavasound-20101123.jar;libraries\org\apache\logging\log4j\log4j-api\2.0-beta9\log4j-api-2.0-beta9.jar;libraries\org\lwjgl\lwjgl\lwjgl-platform\2.9.4-nightly-20150209\lwjgl-platform-2.9.4-nightly-20150209-natives-windows.jar;libraries\io\netty\netty-all\4.0.23.Final\netty-all-4.0.23.Final.jar;libraries\com\mojang\realms\1.7.59\realms-1.7.59.jar;libraries\com\paulscode\soundsystem\20120107\soundsystem-20120107.jar;libraries\com\google\code\gson\gson\2.2.4\gson-2.2.4.jar;libraries\com\google\guava\guava\17.0\guava-17.0.jar;libraries\org\apache\logging\log4j\log4j-core\2.0-beta9\log4j-core-2.0-beta9.jar;libraries\org\lwjgl\lwjgl\lwjgl_util\2.9.4-nightly-20150209\lwjgl_util-2.9.4-nightly-20150209.jar;libraries\org\lwjgl\lwjgl\lwjgl\2.9.4-nightly-20150209\lwjgl-2.9.4-nightly-20150209.jar;libraries\com\mojang\netty\1.8.8\netty-1.8.8.jar;libraries\tv\twitch\twitch-external-platform\4.5\twitch-external-platform-4.5-natives-windows-64.jar;libraries\org\ow2\asm\asm-tree\6.2\asm-tree-6.2.jar;libraries\org\apache\httpcomponents\httpclient\4.3.3\httpclient-4.3.3.jar;libraries\org\apache\httpcomponents\httpcore\4.3.2\httpcore-4.3.2.jar;libraries\net\java\jutils\jutils\1.0.0\jutils-1.0.0.jar;libraries\org\tlauncher\netty\1.8.8\netty-1.8.8.jar;libraries\net\java\dev\jna\platform\3.4.0\platform-3.4.0.jar;libraries\org\ow2\asm\asm\6.2\asm-6.2.jar;libraries\org\ow2\asm\asm-commons\6.2\asm-commons-6.2.jar
SET JAVA_OPTIONS=-Xmx%MAX_MEM% -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode -XX:-UseAdaptiveSizePolicy -Xmn128M -XX:HeapDumpPath=MojangTricksIntelDriversForPerformance_javaw.exe_minecraft.exe.heapdump -Djava.library.path=%LIBRARIES% -Dminecraft.launcher.brand=java-minecraft-launcher -Dminecraft.launcher.version=unknown -cp %CLASSPATH% %MAIN_CLASS%
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

start "" /D "%DIR%" /I /HIGH "%JAVA%" %JAVA_OPTIONS% --version 1.8.9 --gameDir . --assetsDir assets --assetIndex 1.8 --accessToken 1337535510N --userType legacy --uuid %uuid% --username %NICK% 

