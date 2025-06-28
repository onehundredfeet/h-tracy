package;

import idl.Options;


class TracyCustomCode extends idl.CustomCode {
    public override function getHLInclude() {
		return "
        #ifdef _WIN32
#pragma warning(disable:4305)
#pragma warning(disable:4244)
#pragma warning(disable:4316)
#endif
#include <tracy/Tracy.hpp>
        ";
	}

	public override function getJVMInclude() {
		return "";
	}

	public override function getEmscriptenInclude() {
		return "";
	}

	public override function getJSInclude() {
		return "";
	}

	public override function getHXCPPInclude() {
		return "
		";
	}

}
class Generator {
	// Put any necessary includes in this string and they will be added to the generated files
	
	public static function main() {
        trace('Building...');
        var sampleCode : idl.CustomCode = new TracyCustomCode();
        var options = {
            idlFile: "hx/tracy.idl",
            target: null,
            packageName: "tracy",
            nativeLib: "TracyProxy",
            glueDir: null,
            autoGC: true,
            defaultConfig: "Release",
            architecture: ArchAll,
			hxDir:"hx",
            customCode: sampleCode,
			includes: ["tracy/Tracy.hpp"], 
			libs:[]
        };

		new idl.Cmd(options).run();
	}
}
