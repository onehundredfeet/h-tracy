package ;

import tracy.Tracy;
import haxe.Timer;

class Test {

    public static function main() {
        trace('Testing');
        Tracy.activate();
        Tracy.setThreadName("Test Thread");
        Tracy.zoneScoped();
        var start = Timer.stamp();
        {
            Tracy.zoneScopedN("Test Loop");
            for (i in 0...100000) {
                Tracy.zoneScopedN("Inner Loop");
            }
        }
        Tracy.plot("Test Plot", 42.0);
        var end = Timer.stamp();
        trace('Test took: ${end - start} seconds');
    }
}
