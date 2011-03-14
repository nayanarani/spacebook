<%@include file="header.jsp" %>

  <hr />

    <div id="subheader" class="span-24 last">
      <h3>Need a space booked?</h3>
      <h2 class="loud">Sign Up</h2>
    </div>

  <hr />

      <div class="field">
	<label for="email">E-mail</label><br />
	<input id="email" placeholder="E-mail" name="email" size="30" type="text" />
      </div>

      <div class="field">
	<label for="username">Username</label><br />
	<input id="username" placeholder="Username" name="username" size="30" type="text" />
      </div>

      <div class="field">
	<label for="password">Password</label><br />
	<input id="password" name="password" size="30" type="password" />
      </div>

      <div class="field">
	<label for="confirmpassword">Confirm Password</label><br />
	<input id="confirmpassword" name="password" size="30" type="password" />
      </div>

      <div class="actions">
	<input id="user_submit" name="commit" type="submit" value="Sign up!" />
      </div>

  <hr />

  <%@include file="footer.jsp" %>
