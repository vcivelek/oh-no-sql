<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
 <div class="navbar navbar-inverse navbar-fixed-top" >
        <div class="container" style="margin: 0; padding-left: 0; padding-right: 0;position: relative; left: 6%; right: 6%; top: 0;">
            <div class="navbar-header" >
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="${pageContext.request.contextPath}/home" class="navbar-brand"> Contoso Jobs </a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/home">Search Jobs</a></li>


              <security:authorize access="isAuthenticated()">
                       <security:authorize access="hasRole('ROLE_ADMINISTRATOR')">
                            <li><a href="${pageContext.request.contextPath}/AddCompanyUser">Add User</a></li>
                       </security:authorize>

                       <security:authorize access="hasAnyRole('ROLE_ADMINISTRATOR','ROLE_JOBPOSTER')">
                            <li><a href="${pageContext.request.contextPath}/PostJob">Post Jobs</a></li>
                       </security:authorize>

                       <security:authorize access="hasAnyRole('ROLE_ADMINISTRATOR','ROLE_JOBPOSTER','ROLE_JOBVIEWER')">
                             <li><a href="${pageContext.request.contextPath}/admin">View Job Postings</a></li>
                        </security:authorize>
              </security:authorize>
              
              <security:authorize access="!isAuthenticated()">
                        <li><a href="${pageContext.request.contextPath}/member/registerUser">Job Seeker</a></li>
                        <li><a href="${pageContext.request.contextPath}/member/registerCompany">Employer</a></li>
               </security:authorize>

                </ul>
                
                <ul class="nav navbar-nav" style="position:fixed; right: 6%;">
                        <li><img src="${pageContext.request.contextPath}/css/User.png" 
                        style="margin-top:5px; height: 40px; padding: 3px; border: 1px solid gray; border-radius: 50%;"/></li>
                          
                           <security:authorize access="isAuthenticated()">
                             <security:authorize access="hasAnyRole('ROLE_ADMINISTRATOR','ROLE_JOBPOSTER','ROLE_JOBVIEWER')">
						          <li><a href="${pageContext.request.contextPath}/admin"> <security:authentication property="principal.username" /> </a> </li>
						      </security:authorize> 
						      
						      <security:authorize access="hasRole('ROLE_MEMBER')">
						       <li><a href="${pageContext.request.contextPath}/member/profile"> <security:authentication property="principal.username" /> </a> </li>
						      </security:authorize> 
						     </security:authorize>
                        
	    				<security:authorize access="!isAuthenticated()">
	    					<li><a href="showLogin">Login</a></li>
	    				 </security:authorize>
    					
    					<security:authorize access="isAuthenticated()">
    					<li>
    					<form:form action="${pageContext.request.contextPath}/logout" method="POST">
                      	<input type="submit" class="plain-text-btn" value="Logout">
                      	</form:form>
                      	</li>
                      </security:authorize>

                </ul>
            </div>
        </div>
    </div>