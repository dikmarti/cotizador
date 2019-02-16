package cotizador.model.domain;

import javax.persistence.*;

@NamedQueries({
	@NamedQuery(name = "Nivel.findById", query = "SELECT n FROM Nivel n WHERE n.id = :id"),
	@NamedQuery(name = "Nivel.findAll", query = "SELECT n FROM Nivel n")	
})

@Entity
@Table(name="nivel")
public class Nivel {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column
	private String nombre;
	
	@Column
	private String descripcion;
	
	@Column
	private int orden;
	
	@ManyToOne
	@PrimaryKeyJoinColumn(name="id_proyecto", referencedColumnName="id")
	private Proyecto proyecto;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getOrden() {
		return orden;
	}

	public void setOrden(int orden) {
		this.orden = orden;
	}

	public Proyecto getProyecto() {
		return proyecto;
	}

	public void setProyecto(Proyecto proyecto) {
		this.proyecto = proyecto;
	}
	
}
