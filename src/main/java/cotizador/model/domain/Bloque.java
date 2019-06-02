package cotizador.model.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@NamedQueries({
	@NamedQuery(name = "Bloque.findById", query = "SELECT b FROM Bloque b WHERE b.id = :id"),
	@NamedQuery(name = "Bloque.findByIdProject", query = "SELECT b FROM Bloque b WHERE b.proyecto.id = :id"),
	@NamedQuery(name = "Bloque.findAll", query = "SELECT b FROM Bloque b")
})

@Entity
@Table(name="bloque")
public class Bloque {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column
	private String nombre;
	
	@Column
	private String descripcion;

	@ManyToOne
	@PrimaryKeyJoinColumn(name="proyecto_id", referencedColumnName="id")
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

	public Proyecto getProyecto() {
		return proyecto;
	}

	public void setProyecto(Proyecto proyecto) {
		this.proyecto = proyecto;
	}
		
}
