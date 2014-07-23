package jjoommnn.controller;

import java.io.File;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.exec.CommandLine;
import org.apache.commons.exec.DefaultExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lowagie.text.Document;
import com.lowagie.text.Image;
import com.lowagie.text.pdf.PdfWriter;

@Controller
public class Download
{
    @RequestMapping("/pdfdownload.do")
    public void pdfDownload( HttpServletRequest request, HttpServletResponse response )
    {
    	String page = request.getParameter( "page" );
    	if( page == null || page.length() <= 0 )
    	{
    		try { response.sendError( 404 ); } catch( Exception ee ) {}
    		return;
    	}
    	
        try
        {
            File imgFile = makeScreenShot( page );
            response.setContentType( "application/pdf" );
            
            OutputStream rOut = null;
            Document document = new Document();
            try
            {
                rOut = response.getOutputStream();
                
                PdfWriter.getInstance( document, rOut );
                document.open();
                
                Image img = Image.getInstance( imgFile.toURI().toURL() );
                img.scaleToFit( document.getPageSize().getWidth() - document.leftMargin() - document.rightMargin(),
                                document.getPageSize().getHeight() - document.topMargin() - document.bottomMargin() );
                document.add( img );
                
                document.close();
            }
            finally
            {
                document.close();
                if( rOut != null ) try { rOut.close(); } catch( Exception e ) {}
            }
        }
        catch( Exception e )
        {
            try { response.sendError( 500 ); } catch( Exception ee ) {}
        }
    }
    
    private File makeScreenShot( String page ) throws Exception
    {
        String line = "cmd /C start C:\\Users\\joomin\\AppData\\Roaming\\npm\\pageres.cmd " +
                      "localhost:8080/testforhems/resources/jsp/" + page + " " +
                      "595x842";
        
        System.out.println( "makeScreenShot : " + line );
        
        CommandLine cmdLine = CommandLine.parse(line);
        DefaultExecutor executor = new DefaultExecutor();
        executor.setWorkingDirectory( new File( "C:\\Temp" ) );
        
        int exitValue = executor.execute( cmdLine );
        
        System.out.println( "Done : " + exitValue );
        
        return new File( "C:\\Temp\\localhost!8080!testforhems!resources!jsp!" + page + "-595x842.png" );
    }
}
