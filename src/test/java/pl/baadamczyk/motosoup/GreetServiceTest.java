package pl.baadamczyk.motosoup;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.AssertionsForInterfaceTypes.assertThat;

public  class GreetServiceTest {

    @Test
    public void testNonNul() {
        GreetService service = new GreetService();
        String name =  service.greet("TEST");
        assertThat(name).matches("Hello TEST");
    }

    @Test
    public void testNull() {
        GreetService service = new GreetService();
        String name = service.greet(null);
        assertThat(name).matches("Hello anonymous user");
    }

}