import Toybox.Lang;
import Toybox.StringUtil;

module serialize {
    // Don't use enum {}; it obscures the numbers
    const TYPE_STRING = 0;
    // const TYPE_STRING_BACKREF = 7;
    const TYPE_NUMBER = 1;
    const TYPE_NULL = 2;
    const TYPE_BOOLEAN_TRUE = 3;
    const TYPE_BOOLEAN_FALSE = 8;
    const TYPE_DICTIONARY = 4;
    const TYPE_ARRAY = 5;
    const FINISH_OBJECT = 6;

    // function serialize(val) {
    //     var seralizer = new Serializer();
    //     // serializer.
    // }

    class Serializer {
        var object = new ByteArray();
    }

    function serializeValue(val) {

    }
}