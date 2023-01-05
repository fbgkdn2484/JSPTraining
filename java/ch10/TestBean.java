package ch10;

public class TestBean {
	
	private String name; /* 프로퍼티, 필드, 멤버변수 */

	public String getName() {
		return name;
	}

	public void setName(String name) { 		/* 자로형 동일 */
		this.name = name; 					/* this.name은 자기자신을 가리킴 */
	}
	
	

}
