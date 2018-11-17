package test.dao.shape.type;

import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
public class Triangle extends ShapeSimilar{

	@Override
	public Integer getSurface() {
		// TODO Auto-generated method stub
		return surface;
	}

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
		return null;
	}

	@Override
	public String getType() {		
		return ShapeType.TRIANGLE.getValue();
	}

}
