package test.dao.shape.type;

public enum ShapeType {
	
	CIRCLE("0"),
	TRIANGLE("1"),
	SQUARE("2");
	
	private String value;
	
	private ShapeType(String value) {
		this.value = value;
	}
	
	public String getValue(){
		return value;
	}
}