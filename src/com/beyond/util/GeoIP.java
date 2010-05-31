package com.beyond.util;
 
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class GeoIP {
	
	private static final String GEOIP_URL  = "http://api.geoio.com/q.php?key=LVLGKQjapauj5YpK&qt=geoip&d=comma&q=";
    
    public static GeoIPVO fetchCountry(String ip) {
    	GeoIPVO vo=null;
        try {
            URL url = new URL(GEOIP_URL + ip);
            URLConnection conn = url.openConnection(); 
            BufferedReader resp = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String geoStr= resp.readLine();
            vo=new GeoIPVO(geoStr);
            url=null;
		   } catch (Exception e) {
        	e.printStackTrace();
        } 
        return vo;
    }
    public static void main(String a[]) throws Exception{ 
        System.out.println(fetchCountry("188.222.201.58").toString());
    }
 
}