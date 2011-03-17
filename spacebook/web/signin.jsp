<%@include file="header.jsp" %>
<script>
function validateForm()
{
    if(document.frm.username.value=="")
    {
      alert("User Name should not be left blank");
      document.frm.username.focus();
      return false;
    }

    if(document.frm.password.value=="")
    {
      alert("Password should not be left blank");
      document.frm.password.focus();
      return false;
    }
    
}
</script>

    <h2>Sign In</h2>

    <div class="formbox">
        <form name="frm" action="" method="get" onSubmit="validateForm()">
            <table>
		<tr>
                    <td>Username</td>
                    <td><input id="username" name="username" size="30" type="text" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input id="password" name="password" size="30" type="password" /></td>
                </tr>
                <tr>
                    <td><input id="user_submit" name="commit" type="submit" value="Sign up!" /></td>
                </tr>
            </table>
        </form>
    </div><!-- end:formbox -->

<%@include file="footer.jsp" %>
