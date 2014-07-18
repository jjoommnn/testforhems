package jjoommnn.controller;

import org.apache.commons.exec.CommandLine;
import org.apache.commons.exec.DefaultExecutor;

public class TestProcess
{
    public static void main( String[] args ) throws Exception
    {
        String line = "cmd /c start C:\\Users\\joomin\\AppData\\Roaming\\npm\\pageres.cmd www.naver.com 1600x900";
        CommandLine cmdLine = CommandLine.parse(line);
        DefaultExecutor executor = new DefaultExecutor();
        int exitValue = executor.execute(cmdLine);
        System.out.println( "Done : " + exitValue );
    }
}
