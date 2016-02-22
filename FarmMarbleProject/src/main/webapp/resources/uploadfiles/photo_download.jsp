<%@ page contentType="image/png" trimDirectiveWhitespaces="true"%>
<%@ page import="java.io.*, java.net.*"%>
         
<%
String board_original_file_name = request.getParameter("fileName");
board_original_file_name = URLDecoder.decode(board_original_file_name, "UTF-8");
String realPath = application.getRealPath("/resources/uploadfiles/" + board_original_file_name);
FileInputStream fis = new FileInputStream(realPath);
out.clear();
ServletOutputStream soo = response.getOutputStream();
byte[] data = new byte[1024];
int byteNum = -1;
while((byteNum=fis.read(data)) != -1) {
	soo.write(data, 0, byteNum);
}
fis.close();
soo.flush();
soo.close();
%>