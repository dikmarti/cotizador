package cotizador.app;

import cotizador.model.domain.enums.UnidadMedidaEnum;

public class Prueba {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		boolean unidad = UnidadMedidaEnum.LITROS.getValue().equals("1");
		
		System.out.println("unidad " + unidad);

	}

}
