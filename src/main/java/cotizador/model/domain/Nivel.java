package cotizador.model.domain;

import javax.persistence.*;

@Entity
public class Nivel {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private String id;
	
	@Column
	private String nombre;
	
	@ManyToOne
	@PrimaryKeyJoinColumn(name="id_proyecto", referencedColumnName="id")
	private Proyecto proyecto;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Proyecto getProyecto() {
		return proyecto;
	}

	public void setProyecto(Proyecto proyecto) {
		this.proyecto = proyecto;
	}
	
}
