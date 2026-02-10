package runner;

import com.intuit.karate.junit5.Karate;
public class TestRunner {
@Karate.Test
    public Karate testAll() {
        return Karate.run("classpath:features").tags("@smoke");
    }
}
