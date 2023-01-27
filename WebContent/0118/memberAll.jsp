<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ibatis.config.SqlMapClientFactory"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//-db처리 - SqlMapClient객체가 필요
SqlMapClient client = SqlMapClientFactory.getSqlMapClient();

//mapper수행 - sql실행문을 가지고 있는 xml문서.
List<MemberVO> list = client.queryForList("member.selectAll");


%>
[

   <%
      int cnt = 0;
      for(MemberVO vo : list){
         if(cnt > 0) out.print(",");
   %>
   
      {
         
      "id" : "<%= vo.getMem_id() %>",
      "name" : "<%= vo.getMem_name() %>",
      "hp" : "<%= vo.getMem_hp() %>"
      
      
      }   
   
   
   <%   
      cnt ++;
      }
   %>


]