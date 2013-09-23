<%@include file="/libs/foundation/global.jsp"%>
<%@page import="com.uhc.member.commonlib.ToolTipHelperService,
com.uhc.cq5.framework.pdf.PDFLinksHelperService"%>
<%@page import="com.day.cq.wcm.api.WCMMode" %>
<% 
String content = properties.get("description","");
String borderCheck = properties.get("requiredBorder","");
ToolTipHelperService toolTipHelper = sling.getService(ToolTipHelperService.class);
content = toolTipHelper.formatTooltip(slingRequest,content,"");
PDFLinksHelperService pdfLinkHelper = sling.getService(PDFLinksHelperService.class);
content = pdfLinkHelper.formatPDFLinks(slingRequest,content,"");
%>
<%
if(WCMMode.fromRequest(request) == WCMMode.EDIT) { %>
	<cq:includeClientLib categories="cq.foundation-main, uhcm.clientlib"/>
<%}%>
<script type="text/javascript" src="/etc/designs/uhcm/clientlibs/js/site.js"></script>
<script type="text/javascript">
    $CQ(document).ready(function(){
    	var notificationCookie = getCookie("NotificationCookie");
    	var selectedPlanId, borderVal;
    	try{
			selectedPlanId = notificationCookie.split("selectedPlanId=");
	        borderVal = "primarycarephysician";
    	
		   if(consumerDetails!="") {
		        if(borderVal == "<%=borderCheck%>" ){
		        	$CQ.each(consumerDetails.planProfiles, function(i, planProfile) {
		        		if(planProfile.providerInformation != null){
		        			if(planProfile.insuredPlanId == selectedPlanId[1]){
		        				$CQ("#primaryCarePhysicanName").append(planProfile.providerInformation);
		        			}
		        		}
		        				
		        	});
		        }
		    }
		} catch (e) {
    		
    	}
     });

</script>

<% if("primarycarephysician".equals(borderCheck)) { 
%>
<div class="fd_pcpDetails">    
    <h2 id="pcpNameHeading"><%=properties.get("title","")%></h2>
    <div id="footerpcpName">
        <h3 id="primaryCarePhysicanName" class="fd_pcp margin_top_10px"></h3>
        <p class="fd_pcpText margin_top_5px"><%=content%></p>
        <div class="clear"></div>
    </div>
</div>
<% } else if ("borderless".equals(borderCheck)) {
 %>
<div class="fd_pcpDetails">    
    <h2 id="pcpNameHeading"><%=properties.get("title","")%></h2>
    <div id="footerpcpName">
        <h3 id="myPcpDetail" class="fd_pcp margin_top_10px"></h3>
        <p class="fd_pcpText margin_top_5px"><%=content%></p>
        <div class="clear"></div>
    </div>
</div>
<% } else if ("bordered".equals(borderCheck)) {
%>
<%
  String pathCheck= (String)currentPage.getPath();
if(pathCheck.contains("plandocumentsfr") || pathCheck.contains("annualdirectory-formsresources") || pathCheck.contains("eob") || pathCheck.contains("FormsandresourcesFnR")){ %>
<div class="mailOrderMainCnt margin_bottom_10px margin_top_5px">
<%}else{ %>
<div class="mailOrderMainCnt margin_bottom_10px margin_top_5px">
<%} %>
    <div class="mailOrderTopBg"></div>
    <div class="mailOrderMidBg">
        <div class="mailOrderMidcont">
            <h2 class="padding_top_0px"><%=properties.get("title","")%></h2>
            <%if(properties.get("description","") != ""){%>
              <p class="padding_top_10px color:#333333"><%=content%></p>
            <%}%>
            <cq:include path="subContent" resourceType="foundation/components/parsys"/>
        </div>
        <div>
        </div>
    </div>
    <div class="mailOrderBtmBg"></div>
</div>
<div class="clear"></div>
<% } else if (properties.get("requiredBorder","").equals("terminatedplans")) {
%>
<div class="fd_pcpDetails">    
    <h2 id="pcpNameHeading"><%=properties.get("title","")%></h2>
    <div id="footerpcpName">        
        <p class="fd_pcpText margin_top_5px"><%=content%></p>
        <div class="clear"></div>
    </div>
</div>
<% } else if (!properties.get("linkOneName","").isEmpty()) { %>
        <div class="carousel-featured-headline" style="margin:0;padding:10px 0 0 10px">
            <h2 class="blue"><%= properties.get("title","") %></h2>
            <%= content %>
            <hr style="width:70%;float:left;color:#CECECE"/>
            <ul style="clear:left;margin-left:20px">
            <li class="uhc_mem_listDot">
                <a href="<%= properties.get("linkOneUrl","") %>"><%= properties.get("linkOneName","") %></a>
            </li>
            <li class="uhc_mem_listDot">
                <a href="<%= properties.get("linkTwoUrl","") %>"><%= properties.get("linkTwoName","") %></a>
           </li>
            </ul>
       </div>
<%   
    }else if((WCMMode.fromRequest(request) == WCMMode.EDIT) && (properties.get("title","").isEmpty())) { 
        out.println("Edit to add Title and Description");
    } %>