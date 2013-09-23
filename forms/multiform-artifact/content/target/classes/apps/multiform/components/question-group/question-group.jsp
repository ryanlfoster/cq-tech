<%@include file="/libs/foundation/global.jsp"%>
<%@page import="com.day.cq.wcm.api.WCMMode"%>
<%
    String numQuestions = properties.get("numquestions", "");
    int numQ = 0;
    if (numQuestions != null && !(numQuestions.trim().equals(""))) {
        numQ = Integer.parseInt(numQuestions);
    } else if (WCMMode.fromRequest(request) == WCMMode.EDIT) {
        out.println("Enter the number of questions that needs to be edited");
    }

    for (int i = 0; i < numQ; i++) {
        String cPath = "formqn"+i;
%>
<cq:include path="<%=cPath%>" resourceType="multiform/components/question" />
<%
    }
%>