module FooModule {
    var FooModuleMemberVariable = 456;
    module BarModule {
        var BarModuleMemberVariable = 123;
        function BazFunction() {
            var a = FooModuleMemberVariable;
            a = a + BarModuleMemberVariable;
            return a;
        }
        function EmptyFunction() {
            return 0;
        }
        function SwitchCaseTest() {
            var a = 1;
            var b;
            if(a == 1) {
                b = 8;
            } else if(a == 2) {
                b = 9;
            } else {
                b = 10;
            }
            b = 11;
            switch(a) {
                case 1:
                    b = 4;
                    break;
                case 2:
                    b = 5;
                    break;
                case 3:
                    b = 6;
                    break;
                default:
                    b = 7;
                    break;
            }
        }
    }
}