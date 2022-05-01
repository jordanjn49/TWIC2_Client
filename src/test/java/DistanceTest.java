import com.twic.twic2_client.Beans.Ville;
import com.twic.twic2_client.Forms.VilleAPI;
import org.junit.jupiter.api.Test;

public class DistanceTest {

    @Test
    void name() throws Exception {
        VilleAPI api = new VilleAPI();
        Ville ville1 = new Ville();
        Ville ville2 = new Ville();
        ville1 = api.getAllVilles().get(3);
        ville2 = api.getAllVilles().get(5);
        System.out.println(ville1.getDistance(ville2));
        System.out.println(api.getVilleById("01002"));
        api.deleteVilleById("01026");
        System.out.println("Done!");
    }

}
