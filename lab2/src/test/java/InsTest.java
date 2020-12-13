import mirea.pois.kerzhentsev.Car;
import mirea.pois.kerzhentsev.CarInsurance;
import mirea.pois.kerzhentsev.Owner;
import org.junit.Test;
import org.kie.api.KieServices;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Optional;

import static org.junit.Assert.assertEquals;

public class InsTest {

    @Test
    public void pois_lab_2_test() {
        KieServices ks = KieServices.Factory.get();
        KieContainer kContainer = ks.getKieClasspathContainer();
        KieSession kSession = kContainer.newKieSession("ksession-rules");

        Car car = new Car(new Owner(99, 21, 2), 3);
        CarInsurance ci = new CarInsurance(15000.0, car);

        kSession.insert(ci);
        kSession.fireAllRules();

        ArrayList<Double> expectedMultipliers = new ArrayList<>(Arrays.asList(2.0, 1.8, 2.0, 2.3081594991762824));

        assertEquals(expectedMultipliers, ci.getMultipliers());
        assertEquals(575380, ci.getFinalPrice().intValue());
    }
}
