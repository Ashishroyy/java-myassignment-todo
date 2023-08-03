package myassignment.dto;


import com.fasterxml.jackson.annotation.JsonProperty;

public class logindto {
	
	@JsonProperty("login_id")
	private String login_id;
	@JsonProperty("password")
	private String password;
	
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String id) {
		this.login_id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}

