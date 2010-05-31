package com.beyond.constants;

public interface HtmlConstants {
	
 String THANKS_FOR_RESPONSE = "<html><body><h2>We Thank You for your time and patience</h2>.</body></html>";
 String RESPONSE_RECEIPT_ERROR = "<html><body><h2><font color='red'>Oops... Sorry.</font></h2><br/><h3>We did not receive any data.<br/>Can you please use the link at the top of the original e-mail page.<br/><br/>Many Thanks </h3><br/></body></html>";
  
 String TAG_UL_START ="<ul>";
 String TAG_UL_END	="</ul>";
 String TAG_OL_START ="<ol>";
 String TAG_OL_END	="</ol>";
 String TAG_LI_START="<li>";
 String TAG_LI_END	="</li>";
 String TAG_FONT_END = "</font>";
 String TAG_FONT_OK_START = "<font color='green'>";
 String TAG_FONT_ERROR_START = "<font color='red'>";
 String TAB_BR = "<br/>";
 
 String CONTENT_TEXT_HTML = "text/html";
 
 String BLOCK_START1="<div class=\"art-Block\"><div class=\"art-Block-tl\"></div><div class=\"art-Block-tr\"></div><div class=\"art-Block-bl\"></div>";
 String BLOCK_START2="<div class=\"art-Block-br\"></div><div class=\"art-Block-tc\"></div><div class=\"art-Block-bc\"></div><div class=\"art-Block-cl\"></div>"; 
 String BLOCK_START3="<div class=\"art-Block-cr\"></div><div class=\"art-Block-cc\"></div><div class=\"art-Block-body\"><div class=\"art-BlockHeader\"> ";
 String BLOCK_START4="<div class=\"l\"></div><div class=\"r\"></div><div class=\"art-header-tag-icon\"><div class=\"t\">";
 String BLOCK_BEGIN= BLOCK_START1 +BLOCK_START2 + BLOCK_START3 + BLOCK_START4;
 String BLOCK_END =  "</div></div></div>";
 String BLOCK_CONTENT_BEGIN = "<div class=\"art-BlockContent\"><div class=\"art-BlockContent-body\"><div>";
 String BLOCK_CONTENT_END = "</div></div></div></div></div>";
 
 String BUTTON_BEGIN = "<span class=\"art-button-wrapper\"><span class=\"l\"> </span><span class=\"r\"> </span><a class=\"art-button\" href=\"";
 String CLOSE_TAG_QUOTE = "\" >";
 String BUTTON_END = "</a></span>";
 String DIV_CLOSE = "</div>";
 String CONTENT_LAYOUT_BEGIN = "<div class=\"art-contentLayout\">";
 String DOC_TYPE_DEC = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">";
 String HTML_BEGIN = "<html xmlns=\"http://www.w3.org/1999/xhtml\" dir=\"ltr\" lang=\"en-US\" xml:lang=\"en\">";
 String HTML_END = "</html>";
 String HEAD_BEGIN = "<head>";
 String HEAD_END = "</head>";
 String BODY_BEGIN = "<body class=\" yui-skin-sam\">";
 String BODY_END = "</body>";
 String META_DECLARATIONS = "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' /><meta http-equiv='X-UA-Compatible' content='IE=EmulateIE7' />";
 String SCRIPT_TYPE_BEGIN = "<script type='text/javascript' src='";
 String LINK_REL_BEGIN = "<link rel='stylesheet' type='text/css' href='";
 String SCRIPT_END = "</script>";
 String MENU_BAR_BEGIN = "<div class=\"art-nav\"><div class=\"l\"></div><div class=\"r\"></div>";
 String NO_SCRIPT = "<noscript><div id=\"noscript\" style=\"display:none\"><b>JavaScript not enabled</b><p>Please enable JavaScript</p></div></noscript>";
 String SHEET_BEGIN = "<div id=\"art-main\"><div class=\"art-Sheet\"><div class=\"art-Sheet-cc\"></div><div class=\"art-Sheet-body\">";
 String SHEET_END = BLOCK_END;
 String SIDE_BAR_BEGIN = "<div class=\"art-sidebar1\">";
 String JWINDOW_BODY_BEGIN = "<div id='jWindowBody' style='padding:2px;background-color:rgb(255,255,255);'>";
 String JWINDOW_END = "</div></div>";
 String JWINDOW_HEADER = "<div id='jWindowHeader' style='padding:2px;font-weight:bold;background-color:rgb(213,234,246);height:23px'>";
 String ART_HEADER_BEGIN = "<div class=\"art-Header\">";
 String BEYOND_HEADER_BEGIN = "<div class=\"beyond-header\">";

 String HTML_FORM_HEADER = "<FORM action='http://87.194.102.154:8181/beyondcontact/response' method='POST'>";
  
 
}
