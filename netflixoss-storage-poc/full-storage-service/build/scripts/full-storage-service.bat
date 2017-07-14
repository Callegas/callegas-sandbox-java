@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  full-storage-service startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

@rem Add default JVM options here. You can also use JAVA_OPTS and FULL_STORAGE_SERVICE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-Djava.net.preferIPv4Stack=true" "-Djava.net.preferIPv6Addresses=false" "-server" "-Xmx2048m" "-Xms128m"

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windowz variants

if not "%OS%" == "Windows_NT" goto win9xME_args
if "%@eval[2+2]" == "4" goto 4NT_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*
goto execute

:4NT_args
@rem Get arguments from the 4NT Shell from JP Software
set CMD_LINE_ARGS=%$

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\full-storage-service-1.0.jar;%APP_HOME%\lib\logback-classic-1.0.13.jar;%APP_HOME%\lib\slf4j-log4j12-1.7.12.jar;%APP_HOME%\lib\slf4j-jdk14-1.7.12.jar;%APP_HOME%\lib\karyon2-core-2.7.2.jar;%APP_HOME%\lib\karyon2-jersey-blocking-2.7.2.jar;%APP_HOME%\lib\karyon2-archaius-2.7.2.jar;%APP_HOME%\lib\karyon2-servo-2.7.2.jar;%APP_HOME%\lib\karyon2-admin-web-2.7.2.jar;%APP_HOME%\lib\karyon2-eureka-2.7.2.jar;%APP_HOME%\lib\jersey-client-1.18.4.jar;%APP_HOME%\lib\feign-jaxrs-8.18.0.jar;%APP_HOME%\lib\feign-jackson-8.18.0.jar;%APP_HOME%\lib\logback-core-1.0.13.jar;%APP_HOME%\lib\log4j-1.2.17.jar;%APP_HOME%\lib\rxnetty-contexts-0.4.7.jar;%APP_HOME%\lib\karyon2-governator-2.7.2.jar;%APP_HOME%\lib\guava-16.0.1.jar;%APP_HOME%\lib\jersey-guice-1.18.1.jar;%APP_HOME%\lib\jersey-servlet-1.18.1.jar;%APP_HOME%\lib\jersey-server-1.18.1.jar;%APP_HOME%\lib\governator-archaius-1.9.3.jar;%APP_HOME%\lib\rxnetty-servo-0.4.7.jar;%APP_HOME%\lib\freemarker-2.3.15.jar;%APP_HOME%\lib\jackson-mapper-asl-1.9.11.jar;%APP_HOME%\lib\karyon2-admin-2.7.2.jar;%APP_HOME%\lib\httpclient-4.2.1.jar;%APP_HOME%\lib\gson-2.1.jar;%APP_HOME%\lib\eureka-client-1.1.151.jar;%APP_HOME%\lib\feign-core-8.18.0.jar;%APP_HOME%\lib\jsr311-api-1.1.1.jar;%APP_HOME%\lib\jackson-databind-2.6.4.jar;%APP_HOME%\lib\rxjava-1.0.8.jar;%APP_HOME%\lib\rxnetty-0.4.7.jar;%APP_HOME%\lib\governator-1.9.3.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\guice-servlet-3.0.jar;%APP_HOME%\lib\jackson-core-asl-1.9.11.jar;%APP_HOME%\lib\servlet-api-2.5.jar;%APP_HOME%\lib\jetty-6.1.26.jar;%APP_HOME%\lib\pytheas-core-1.25.jar;%APP_HOME%\lib\httpcore-4.2.1.jar;%APP_HOME%\lib\commons-logging-1.1.1.jar;%APP_HOME%\lib\commons-codec-1.6.jar;%APP_HOME%\lib\jettison-1.2.jar;%APP_HOME%\lib\netflix-eventbus-0.1.2.jar;%APP_HOME%\lib\xstream-1.4.2.jar;%APP_HOME%\lib\jersey-apache-client4-1.11.jar;%APP_HOME%\lib\ribbon-httpclient-2.0.0.jar;%APP_HOME%\lib\animal-sniffer-annotation-1.0.jar;%APP_HOME%\lib\netty-codec-http-4.0.25.Final.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.0.25.Final.jar;%APP_HOME%\lib\jetty-util-6.1.26.jar;%APP_HOME%\lib\servlet-api-2.5-20081211.jar;%APP_HOME%\lib\commons-collections-3.2.1.jar;%APP_HOME%\lib\jersey-json-1.11.jar;%APP_HOME%\lib\commons-beanutils-1.8.2.jar;%APP_HOME%\lib\commons-configuration-1.8.jar;%APP_HOME%\lib\high-scale-lib-1.1.2.jar;%APP_HOME%\lib\annotations-2.0.0.jar;%APP_HOME%\lib\commons-io-1.4.jar;%APP_HOME%\lib\commons-math-2.2.jar;%APP_HOME%\lib\netflix-infix-0.1.2.jar;%APP_HOME%\lib\xmlpull-1.1.3.1.jar;%APP_HOME%\lib\xpp3_min-1.1.4c.jar;%APP_HOME%\lib\ribbon-core-2.0.0.jar;%APP_HOME%\lib\ribbon-loadbalancer-2.0.0.jar;%APP_HOME%\lib\netflix-commons-util-0.1.1.jar;%APP_HOME%\lib\netty-codec-4.0.25.Final.jar;%APP_HOME%\lib\netty-handler-4.0.25.Final.jar;%APP_HOME%\lib\netty-common-4.0.25.Final.jar;%APP_HOME%\lib\netty-buffer-4.0.25.Final.jar;%APP_HOME%\lib\netty-transport-4.0.25.Final.jar;%APP_HOME%\lib\jaxb-impl-2.2.3-1.jar;%APP_HOME%\lib\jackson-jaxrs-1.9.2.jar;%APP_HOME%\lib\jackson-xc-1.9.2.jar;%APP_HOME%\lib\commons-lang-2.6.jar;%APP_HOME%\lib\joda-time-2.3.jar;%APP_HOME%\lib\commons-jxpath-1.3.jar;%APP_HOME%\lib\antlr-runtime-3.4.jar;%APP_HOME%\lib\netflix-statistics-0.1.1.jar;%APP_HOME%\lib\jaxb-api-2.2.2.jar;%APP_HOME%\lib\aopalliance-1.0.jar;%APP_HOME%\lib\stringtemplate-3.2.1.jar;%APP_HOME%\lib\antlr-2.7.7.jar;%APP_HOME%\lib\stax-api-1.0-2.jar;%APP_HOME%\lib\activation-1.1.jar;%APP_HOME%\lib\slf4j-api-1.7.12.jar;%APP_HOME%\lib\archaius-core-0.7.2.jar;%APP_HOME%\lib\jersey-core-1.18.4.jar;%APP_HOME%\lib\servo-core-0.8.3.jar;%APP_HOME%\lib\servo-internal-0.8.3.jar;%APP_HOME%\lib\governator-annotations-1.9.3.jar;%APP_HOME%\lib\governator-core-1.9.3.jar;%APP_HOME%\lib\hibernate-validator-4.1.0.Final.jar;%APP_HOME%\lib\asm-5.0.4.jar;%APP_HOME%\lib\guice-multibindings-4.0.jar;%APP_HOME%\lib\guice-grapher-4.0.jar;%APP_HOME%\lib\validation-api-1.0.0.GA.jar;%APP_HOME%\lib\guice-assistedinject-4.0.jar;%APP_HOME%\lib\stax-api-1.0.1.jar;%APP_HOME%\lib\jackson-annotations-2.6.0.jar;%APP_HOME%\lib\jackson-core-2.6.4.jar;%APP_HOME%\lib\guice-4.0.jar

@rem Execute full-storage-service
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %FULL_STORAGE_SERVICE_OPTS%  -classpath "%CLASSPATH%" com.callegasdev.ServerRunner %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable FULL_STORAGE_SERVICE_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%FULL_STORAGE_SERVICE_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega