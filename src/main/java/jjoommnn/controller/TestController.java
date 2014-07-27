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
    public HashMap getCalendarData( @RequestParam String month )
    {
        //파라미터로 날짜와 사용자 정보를 받아 DB 쿼리 필요
        
        HashMap data = new HashMap();
        
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
            
            if( ii == 25 ) item.put( "isReadDay", new Boolean( true ) ); //검침일인 경우에 표시
            
            data.put( month + "-" + is, item );
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
    	
    	//page를 호출하기 위한 날짜와 사용자 정보도 파라미터로 받아서 처리해야 함
    	
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
    
    //아래 설정값들은 서버 환경에 따라 적절하게 조정해야 함
    private static final String PAGERES_PATH = "C:\\Users\\joomin\\AppData\\Roaming\\npm\\pageres.cmd";
    private static final String BASE_URL = "localhost:8080/testforhems/resources/jsp/";
    private static final String IMAGE_SIZE = "595x842";
    private static final String DIR_PATH = "C:\\Temp\\";
    
    private File makeScreenShot( String page ) throws Exception
    {
        //윈도우 환경에서 호출하는 것으로 가정
        String line = "cmd /C start" + " " +
                      PAGERES_PATH + " " + BASE_URL + page + " " + IMAGE_SIZE;
        
        System.out.println( "makeScreenShot : " + line );
        
        CommandLine cmdLine = CommandLine.parse(line);
        DefaultExecutor executor = new DefaultExecutor();
        executor.setWorkingDirectory( new File( DIR_PATH ) );
        
        int exitValue = executor.execute( cmdLine );
        
        System.out.println( "Done : " + exitValue );
        
        String file = BASE_URL + page + "-" + IMAGE_SIZE + ".png";
        file = file.replaceAll( "[/:]", "!" ); //생성되는 파일 이름은 / 대신에 ! 으로 교체되어 나타남
        
        return new File( DIR_PATH + file );
    }
}
