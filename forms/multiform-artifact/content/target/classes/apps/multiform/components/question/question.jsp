<%@include file="/libs/foundation/global.jsp"%>
<%@page import="com.day.cq.wcm.api.WCMMode"%>
<%
    String qCopy = properties.get("questioncopy", "");
    int qType = Integer.parseInt(properties.get("qtype", "0"));

    String resType;

    switch (qType) {
    case 1:
        resType = "foundation/components/text";
        break;
    case 2:
        resType = "foundation/components/form/checkbox";
        break;
    case 3:
        resType = "foundation/components/form/radio";
        break;
    case 4:
        resType = "foundation/components/form/dropdown";
        break;
    default:
        resType = "foundation/components/text";
        break;
    }

    if (resType != null && !(resType.trim().equals(""))) {
%>
<cq:include path="qn" resourceType="<%=resType%>" />
<%
    } 
    
    if (WCMMode.fromRequest(request) == WCMMode.EDIT) {
        out.println("Create or update the query details here >>>");
    }
%>