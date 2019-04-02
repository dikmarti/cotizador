package cotizador.model.domain.enums;

public enum UnidadMedidaEnum {
	LITROS("1"),
	PULGADAS("2"),
	PIES("3"),
	METROS("4"),
	KILOMETROS("5"),
	YARDAS("6"),
	METROS_CUADRADOS("7"),
	METROS_CUBICOS("8"),
	ROLLOS("9"),
	UNIDAD("10")
	;

	
	private String value;
	
	private UnidadMedidaEnum(String value) {
		this.value = value;
	}
	
	public String getValue(){
		return value;
	}
	
}
