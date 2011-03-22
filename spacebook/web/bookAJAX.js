  function loadXMLDoc(filename){
 	 $.ajax({
 	   type: "GET",
   	   url: filename,
    	   dataType: "xml",
    	   success: manipulateXml
  	});
    }

    function  manipulateXml(data){

      $(data).find("building").each(function() {

            var name = $(this).find("name").text();
            var rooms = " ";
            rooms += $(this).find("number").append(' ').text();
            

            var output = "<ul class='building'>";
            output += "<li class='name'>" + name + "</li>";
            output += "<a href='#' class='showRooms'>Show Rooms</a>"
            output += "<li class='rooms'>" +  rooms + "</li>";
            output += "</ul>"

            $("div#showSpaces").hide();
            $(".rooms").hide();
            $("div#showSpaces").append(output);
            $("div#showSpaces").show("slow");
      });

      $(".building").click(function() {
            $(this).find(".showRooms").toggle();
            $(this).find(".rooms").toggle();

       });
    }



    <div class="content">
      <h2 class="loud">Book a Space</h2>

      <div id ="showSpaces"></div>

      <div id="getSpaces">
        <button onclick="loadXMLDoc('buildings.xml')">View spaces</button>
      </div>

    </div>