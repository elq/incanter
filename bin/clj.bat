# clj.bat -- script to start Clojure REPL with libraries necessary for Incanter

 @echo off
    set INCANTER_HOME=.
    set CLOJURE_JAR=%INCANTER_HOME%\clojure.jar
    set INCANTER_LIB_DIR=%INCANTER_HOME%\lib
    set INCANTER_SRC=%INCANTER_HOME%\src
    set CLASSES_DIR=%INCANTER_HOME%\classes
    set INCANTER_JAR=%INCANTER_HOME%\incanter.jar

    set CLOJURE_JARS=%INCANTER_LIB_DIR%\clojure.jar;%INCANTER_LIB_DIR%\clojure-contrib.jar

    set JLINE_JARS=%INCANTER_LIB_DIR%\jline-0.9.94.jar
    set COLT_JARS=%INCANTER_LIB_DIR%\parallelcolt-0.7.2.jar;%INCANTER_LIB_DIR%\netlib-java-0.9.1.jar;%INCANTER_LIB_DIR%\arpack-combo-0.1.jar
    set JFREECHART_JARS=%INCANTER_LIB_DIR%\jfreechart-1.0.13.jar;%INCANTER_LIB_DIR%\jcommon-1.0.16.jar;%INCANTER_LIB_DIR%\gnujaxp.jar
    set OPENCSV_JARS=%INCANTER_LIB_DIR%\opencsv-1.8.jar
    set JGRAPH_JARS=%INCANTER_LIB_DIR%\jgraph.jar

    IF (%1)==() (
        java -server -cp .;..;%INCANTER_JAR%;%COLT_JARS%;%JLINE_JARS%;%CLOJURE_JARS%;%JFREECHART_JARS%;%OPENCSV_JARS%;%JUNG_JARS%;%JGRAPH_JARS -Dclojure.compile.path=%CLASSES_DIR -Dincanter.home=%INCANTER_HOME% jline.ConsoleRunner clojure.main
    ) ELSE (
        java -cp %CLOJURE_JAR% clojure.lang.Script %1 -- %*
        java -server -cp .;..;%INCANTER_JAR%;%COLT_JARS%;%JLINE_JARS%;%CLOJURE_JARS%;%JFREECHART_JARS%;%OPENCSV_JARS%;%JUNG_JARS%;%JGRAPH_JARS -Dclojure.compile.path=%CLASSES_DIR -Dincanter.home=%INCANTER_HOME% clojure.lang.Script %1 -- %*
    )

