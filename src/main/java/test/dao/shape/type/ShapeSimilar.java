package test.dao.shape.type;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import test.dao.shape.Shape;

@Entity
@Table(name="shape_similar")
public class ShapeSimilar extends Shape {

	@Column
	protected int base;
	
	@Column
	protected int height;

	@Override
	public Integer getBase() {
		// TODO Auto-generated method stub
		return base;
	}

	
	@Override
	public Integer getHeight() {
		// TODO Auto-generated method stub
		return height;
	}

	@Override
	public Integer getDiameter() {
		// TODO Auto-generated method stub
		return null;
	}

	public void setBase(int base) {
		this.base = base;
	}


	public void setHeight(int height) {
		this.height = height;
	}
}
