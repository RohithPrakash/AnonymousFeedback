package bean;

public class Faculty {
	
	private String name;
	private String email;
	
	public Faculty() {
		this.email = new String();
		this.name = new String();
	}


	public Faculty(String name, String email) {
		this.email = email;
		this.name = name;
	}


	public String getName() {
		return name;
	}


	public String getEmail() {
		return email;
	}
}
