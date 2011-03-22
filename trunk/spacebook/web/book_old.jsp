<%--
    Document   : book
    Created on : 20-Mar-2011, 8:01:21 PM
    Author     : Jamie Hush
--%>

<head>
    <script type="text/javascript" src="jquery-1.5.1.min.js"></script>
    <script type="text/javascript">
function loadXMLDoc(url)
{
    var xmlhttp;
    var txt, roomtxt, showRoom, buildingName, room, i, j;

    //showRoom="<b><div id='showRoom'>" +  "Show Rooms </div></b>";
    
    if (window.XMLHttpRequest)
      {// code for IE7+, Firefox, Chrome, Opera, Safari
      xmlhttp=new XMLHttpRequest();
      }
    else
      {// code for IE6, IE5
      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
      }

     xmlhttp.onreadystatechange=function()
      {
      if (xmlhttp.readyState==4 && xmlhttp.status==200)
        {
        xmlDoc=xmlhttp.responseXML;
        txt="";
        buildingName=xmlDoc.getElementsByTagName("name");
        

        for (i=0;i<buildingName.length;i++)
          {
           //roomtxt = ""; //Blank the value of room numbers before each iteration
           //roomNumber=buildingName[i].getElementsByTagName("number");
           //alert("foo");
           //for (j=0; j < roomNumber.length; j++)
           //{
              // roomtxt = roomtxt + " " + roomNumber[i].childNodes[0].nodeValue; + " ";
               
               //}
               
          //txt=txt + x[i].childNodes[0].nodeValue + "<br />";
          //<div class="itemContainer">
            //<div class="hideLink"><p>hide</p></div>
            //<div class="item">
            //</div>
           //</div>


          txt="<div class='building'>" + txt + buildingName[i].childNodes[0].nodeValue + "<div class='showRooms'><a href='#'>Show Rooms</a><div class='rooms'>" + roomtxt + "</div></div></div>";
          }


        $("div#showSpaces").hide(); //Make sure spaces and rooms are hidden first
        document.getElementById("showSpaces").innerHTML=txt; //Load text into the div
        $("div.rooms").hide();
        $("div#getSpaces").hide();
        $("div#showSpaces").show("slow");

           $(".building .showRooms").click(function() {
                $(this).find(".rooms").toggle();

            });

        }
      }
    xmlhttp.open("GET","buildings.xml",true);
    xmlhttp.send();
}

    </script>
    
<%@include file="WEB-INF/jspf/header.jspf" %>



  Work in progress.

  <hr />

  <%@include file="WEB-INF/jspf/footer.jspf" %>

<!-- 
then you can do something like

 -->