package eteeap.bean;

public class LoginBean
{
	private String user;
	private String pass;
	private String name;
	private String role;
	private String email;
	private String action;
	private String age;
	
///USERNAME	
	public String getUserName()
	{
		return user;
	}
	
	public void setUserName(String userName)
	{
		this.user = userName;
	}
	
///PASSWORD
	public String getPassword()
	{
		return pass;
	}
	
	public void setPassword(String passWord)
	{
		this.pass = passWord;
	}
	
///NAME
	public String getName()
	{
		return name;
	}
	
	public void setName(String fullname)
	{
		this.name = fullname;
	}
	
///ROLE
	public String getRole()
	{
		return role;
	}
	
	public void setRole(String urole)
	{
		this.role = urole;
	}

///EMAIL
	public String getEmail()
	{
		return email;
	}
	
	public void setEmail(String eadd)
	{
		this.email = eadd;
	}
	
///ACTION - LOGIN	
	public String getAction()
	{
		return action;
	}
	
	public void setAction(String loginact)
	{
		this.action = loginact;
	}
	
///AGE
	public String getAge()
	{
		return age;
	}
	
	public void setAge(String e_age)
	{
		this.age = e_age;
	}
}