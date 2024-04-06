<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.OracleResultSetMetaData"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="oracle.jdbc.OraclePreparedStatement"%>
<%@page import="oracle.jdbc.OracleConnection"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Displayer</title>
        <style>
            table,tr,td
            {
                padding: 10px;
                border: 5px solid yellow;
                border-collapse: collapse;
            }
            th
            {
                padding: 10px;
                border: 5px solid greenyellow;
                border-collapse: collapse;
                color: chartreuse;
            }
        </style>
    </head>
    <%! 
//STEP 3: DECLARING ORACLE OBJECTS AND OTHE
      OracleConnection oconn;
      OraclePreparedStatement ops;
      OracleResultSet ors;
      OracleResultSetMetaData orsmd;
      int reccounter,colcounter,counter;
    %>
    
    <!--Step 4: REGISTERING ORACLE DRIVER-->
    <%
        DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
      //STEP 5: INSTANTIATING THE CONNECTION
        oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@LAPTOP-V1C5OV25:1521:student","subhranil", "system");
     //11 STEP 6: INSTANTING THE STATEMENT
        ops = (OraclePreparedStatement)oconn.prepareCall("select * from existing_user");
     //STEP 7: EXECUTING THE QUERY
        ors = (OracleResultSet)ops.executeQuery();
     // STEP 8: GETTING THE COLUMN INFORMATION
        orsmd = (OracleResultSetMetaData)ors.getMetaData();

%>

<body style="background-color: black ">
        <table>
            <thead>
                <tr>
                    <%
                      for(counter=1;counter<=orsmd.getColumnCount();counter++)
                      {
                    %>
                    <th><%=orsmd.getColumnName(counter)%></th>
                    <%
                        }
                    %>
                    <th>ACTION</th>
                </tr>
            </thead>
            <tbody>
                <%
                  while(ors.next() == true)  
                  {
                %>
                <tr>
                    <%
                      for(counter=1;counter<=orsmd.getColumnCount();counter++)
                      {   
                    %>
                    <th><%=ors.getString(counter)%></th>
                    <%
                      }    
                    %>
                    <td>
                        <button>Edit</button><button>Delete</button>
                    </td>
                </tr> 
                <%
                  }    
                %>
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="10">TECHNO &reg; INDIA &&copy; TECNOLOGIES &trade;</th>
                </tr>
            </tfoot>
        </table>
    </body>
</html>