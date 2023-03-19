SET "DIR=%cd%"
SET "JAVA_HOME=runtime\jre-legacy\windows\jre-legacy"
SET "JAVA=%JAVA_HOME%\bin\javaw.exe"
SET MAX_MEM=4G
SET LIBRARIES=
SET MAIN_CLASS=net.minecraft.client.main.Main
SET CLASSPATH=libs
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

start "" /D "%DIR%" /I /HIGH "%JAVA%" %JAVA_OPTIONS% --version version --gameDir . --assetsDir assets --assetIndex version --accessToken 1337535510N --userType legacy --uuid %uuid% --username %NICK% 

