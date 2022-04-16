import com.twic.twic2_client.Beans.Ville;
import com.twic.twic2_client.Forms.VilleAPI;
import com.twic.twic2_client.Forms.WeatherAPI;
import org.junit.jupiter.api.Test;

import java.util.Arrays;

public class WeatherTest {

    @Test
    void name() throws Exception {
        WeatherAPI api = new WeatherAPI();
        System.out.println(api.getTemperature("46.1331","4.9986"));
        System.out.println(api.getWeatherIcon("46.1331","4.9986"));
    }
}
