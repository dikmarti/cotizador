package cotizador.model.domain;

import java.util.Date;

import javax.persistence.*;

@NamedQueries({
	@NamedQuery(name = "Permiso.findByUser", query = "SELECT p FROM Permiso p WHERE p.usuario.login = :login")	
})

@Entity
@Table(name="permiso")
public class Permiso {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@ManyToOne
	@PrimaryKeyJoinColumn(name="id_usuario", referencedColumnName="id")
	private Usuario usuario;
	
	@ManyToOne
	@PrimaryKeyJoinColumn(name="id_modulo", referencedColumnName="id")
	private Modulo modulo;
	
	@Column(name="fecha_asignacion")
	private Date fechaAsignacion;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Modulo getModulo() {
		return modulo;
	}

	public void setModulo(Modulo modulo) {
		this.modulo = modulo;
	}

	public Date getFechaAsignacion() {
		return fechaAsignacion;
	}

	public void setFechaAsignacion(Date fechaAsignacion) {
		this.fechaAsignacion = fechaAsignacion;
	}
	
}
