package ssn;
import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;


public class SwedishSocialSecurityNumberTest {

	SwedishSocialSecurityNumber sut;
	SwedishSocialSecurityNumber bornBefore2000;
	SwedishSocialSecurityNumber bornAfter2000;
	
	@Before
	public void setUp() throws Exception {
		sut 	 		= new SwedishSocialSecurityNumber("800603-2829");
		bornAfter2000 	= new SwedishSocialSecurityNumber("060101-3132");
		bornBefore2000 	= new SwedishSocialSecurityNumber("061231+1234");
	}
	
	@Test
	public void shouldReturnCorrectYear() {
		int actual;
	
		actual = sut.getYear();
		assertEquals(1980, actual);
		
		actual = bornAfter2000.getYear();
		assertEquals(2006, actual);
		
		actual = bornBefore2000.getYear();
		assertEquals(1906, actual);
	}
	
	@Test
	public void shouldReturnCorrectMonth() {
		String actual;
		
		actual = sut.getMonth();
		assertEquals("June", actual);
		
		actual = bornAfter2000.getMonth();
		assertEquals("January", actual);
		
		actual = bornBefore2000.getMonth();
		assertEquals("December", actual);
	}
	
	@Test
	public void shouldReturnCorrectDay() {
		int actual;
		
		actual = sut.getDay();
		assertEquals(3, actual);
		
		actual = bornAfter2000.getDay();
		assertEquals(1, actual);
		
		actual = bornBefore2000.getDay();
		assertEquals(31, actual);
	}
	
	@Test
	public void shouldReturnCorrectCode() {
		String actual;
		
		actual = sut.getCode();
		assertEquals("2829", actual);
		
		actual = bornAfter2000.getCode();
		assertEquals("3132", actual);
		
		actual = bornBefore2000.getCode();
		assertEquals("1234", actual);
	}
	
	

	@Test(expected=IllegalArgumentException.class)
	public void shouldThrowExceptionOnEmptyInput() {
		new SwedishSocialSecurityNumber("");
	}
	
	@Test(expected=IllegalArgumentException.class)
	public void shouldThrowExceptionIfNoSeparatorIsUsed() {
		new SwedishSocialSecurityNumber("8006032829");
	}
	
	@Test(expected=IllegalArgumentException.class)
	public void shouldThrowExceptionOnTooShort() {
		new SwedishSocialSecurityNumber("120103-256");
	}
	
	@Test(expected=IllegalArgumentException.class)
	public void shouldThrowExceptionOnWrongSeparator() {
		new SwedishSocialSecurityNumber("120103=2564");
	}
	
	@Test(expected=IllegalArgumentException.class)
	public void shouldThrowExceptionOnCharacterAsDay() {
		new SwedishSocialSecurityNumber("12010X-2564");
	}
	
	@Test(expected=IllegalArgumentException.class)
	public void shouldThrowExceptionOnMonth0() {
		new SwedishSocialSecurityNumber("120003-2564");
	}
	
	@Test(expected=IllegalArgumentException.class)
	public void shouldThrowExceptionOnMonth13() {
		new SwedishSocialSecurityNumber("121303-2564");
	}
	
	@Test(expected=IllegalArgumentException.class)
	public void shouldThrowExceptionOnDay0() {
		new SwedishSocialSecurityNumber("121200-2564");
	}
	
	@Test(expected=IllegalArgumentException.class)
	public void shouldThrowExceptionOnDay32() {
		new SwedishSocialSecurityNumber("121232-2564");
	}
}
