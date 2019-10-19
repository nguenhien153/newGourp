<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="ctxRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<jsp:include page="../fragments/header.jsp"/>
<jsp:include page="shared/msg_show.jsp"/>
<c:if test="${not empty msgError}">
    <span style="color: red">${msgError}</span>
</c:if>
<div class="container">
    
<form method="post" action="${ctxRoot}/discountForm">
    <c:if test="${not empty param.id}">
        <div class="form-group">
            <lable>Discount ID</label> 
        
                <input class="form-control" type="text" name="id" readonly="true" value="${form.id}"/>
          
        </div>
        
    </c:if>
    <div class="form-group">
        <lable>Product Name</label>  
            <select name="productName" class="form-control">
                <option value="">--Select one--</option>
                <c:forEach items="${listProduct}" var="c">
                    <option value="${c.id}"
                            ${c.id == form.productID.id?'selected':''}>${c.productName}</option>
                </c:forEach>
            </select> 
            
    </div>
    <div class="form-group">
        <lable>Discount Value</label>
 
            <input class="form-control" type="number" name="discountValue"  value="${form.discountValue}"/>
 
    </div>
    
    <div class="form-group">
        <lable>Discount Start Date</label> 
            <input class="form-control" type="date" name="discountStartDate" value="${form.discountStartDate}"/>
         
    </div>
    <div class="form-group">
        <lable>Discount End Date</label>  
            <input class="form-control" type="date" name="discountEndDate" value="${form.discountEndDate}"/>
     
    </div>
    

    <button type="submit" class="btn btn-primary" value="Save">Submit</button>
</form>
  
</div>
<jsp:include page="../fragments/footer.jsp"/>
