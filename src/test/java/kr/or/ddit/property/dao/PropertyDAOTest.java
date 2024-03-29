package kr.or.ddit.property.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;

import kr.or.ddit.vo.PropertyVO;

class PropertyDAOTest {
	PropertyDAO dao = new PropertyDAOImpl();
	@Test
	void testSelectProperties() {
		List<PropertyVO> propList = dao.selectProperties();
//		assertion
		assert propList != null;
		assertNotNull(propList);
		assertNotEquals(0, propList.size());
	}
	
	//TDE 테스트 주도형 개발
	//EDD 이벤트 주도형 개발
	@Test
	void testInsertProperty() {
		PropertyVO newProp= new PropertyVO();
		newProp.setPropertyName("dummyName");
		newProp.setPropertyName("dummyValue");
		newProp.setDescription("dummyDesc");
		int rowcnt = dao.insertProperty(newProp);
		assertEquals(1, rowcnt);
	}

	@Test
	void testSelectProperty() {
		for(int i=1;i<=20000;i++) {
			PropertyVO vo = dao.selectProperty("DST_PRIMARY_TT_VERSION");
			assertNotNull(vo);
		}
	}

	@Test
	void testUpdateProperty() {
		PropertyVO modifyProp = new PropertyVO();
		modifyProp.setPropertyName("cop.password.msg");
		modifyProp.setPropertyValue("modified value");
		int rowcnt=dao.updateProperty(modifyProp);
		assertEquals(1, rowcnt);
		
		modifyProp.setPropertyName("qweqr");
		modifyProp.setPropertyValue("modified value");
		rowcnt=dao.updateProperty(modifyProp);
		assertEquals(0, rowcnt);
	}

	@Test
	void testDeleteProperty() {
		String propertyName="NLS_COMP1";
		int rowcnt=dao.deleteProperty(propertyName);
		assertEquals(1, rowcnt);
	}

}
