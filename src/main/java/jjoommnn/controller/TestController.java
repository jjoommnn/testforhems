package jjoommnn.controller;

import java.io.File;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.exec.CommandLine;
import org.apache.commons.exec.DefaultExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lowagie.text.Document;
import com.lowagie.text.Image;
import com.lowagie.text.pdf.PdfWriter;

@Controller
public class TestController
{
    @RequestMapping("/getCalendarData.do")
    @ResponseBody
    public List getCalendarData( @RequestParam String month )
    {
        List data = new ArrayList();
        
        //테스트 용으로 가짜 데이터 생성
        Random rnd = new Random();
        for( int i = 0; i <= 30; i++ )
        {
            int ii = i + 1;
            String is = ii < 10 ? "0" + ii : "" + ii;
            
            HashMap item = new HashMap();
            item.put( "start", month + "-" + is );
            item.put( "title", ( rnd.nextInt( 10 ) + 1 ) + "만원" );
            item.put( "fee", new Float( rnd.nextInt( 90000 ) + 1 ) );
            item.put( "feeAcc", new Float( rnd.nextInt( 90000 ) + 1 ) );
            item.put( "amount", new Float( rnd.nextInt( 90000 ) + 1 ) );
            item.put( "level", new Integer( i / 5 + 1 ) );
            
            data.add( item );
        }
        //테스트 용으로 가짜 데이터 생성
        
        return data;
    }
    
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
    
    private static final String PAGERES_PATH = "C:\\Users\\joomin\\AppData\\Roaming\\npm\\pageres.cmd";
    private static final String BASE_URL = "localhost:8080/testforhems/resources/jsp/";
    private static final String IMAGE_SIZE = "595x842";
    private static final String DIR_PATH = "C:\\Temp\\";
    
    private File makeScreenShot( String page ) throws Exception
    {
        String line = "cmd /C start" + " " +
                      PAGERES_PATH + " " + BASE_URL + page + " " + IMAGE_SIZE;
        
        System.out.println( "makeScreenShot : " + line );
        
        CommandLine cmdLine = CommandLine.parse(line);
        DefaultExecutor executor = new DefaultExecutor();
        executor.setWorkingDirectory( new File( DIR_PATH ) );
        
        int exitValue = executor.execute( cmdLine );
        
        System.out.println( "Done : " + exitValue );
        
        String file = BASE_URL + page + "-" + IMAGE_SIZE + ".png";
        file = file.replaceAll( "[/:]", "!" );
        
        return new File( DIR_PATH + file );
    }
}
