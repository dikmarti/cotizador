package cotizador.model.domain;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name="validacion")
public class Validacion {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@ManyToOne
	@PrimaryKeyJoinColumn(name="id_producto", referencedColumnName="id")
	private Proyecto proyecto;
	
	@Column(name="nombre_manager")
	private String nombreManager;
	
	@Column(name="fecha_recepcion")
	private Date fechaRecepcion;
	
	@Column(name="fecha_revision")
	private Date fechaRevision;
	
	@Column(name="fecha_entrega")
	private Date fechaEntrega;
	
	@Column(name="recurso_preventa")
	private String recursoPreventa;
	
	@Column
	private boolean conforme;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Proyecto getProyecto() {
		return proyecto;
	}

	public void setProyecto(Proyecto proyecto) {
		this.proyecto = proyecto;
	}

	public String getNombreManager() {
		return nombreManager;
	}

	public void setNombreManager(String nombreManager) {
		this.nombreManager = nombreManager;
	}

	public Date getFechaRecepcion() {
		return fechaRecepcion;
	}

	public void setFechaRecepcion(Date fechaRecepcion) {
		this.fechaRecepcion = fechaRecepcion;
	}

	public Date getFechaRevision() {
		return fechaRevision;
	}

	public void setFechaRevision(Date fechaRevision) {
		this.fechaRevision = fechaRevision;
	}

	public Date getFechaEntrega() {
		return fechaEntrega;
	}

	public void setFechaEntrega(Date fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}

	public String getRecursoPreventa() {
		return recursoPreventa;
	}

	public void setRecursoPreventa(String recursoPreventa) {
		this.recursoPreventa = recursoPreventa;
	}

	public boolean isConforme() {
		return conforme;
	}

	public void setConforme(boolean conforme) {
		this.conforme = conforme;
	}
	
}
