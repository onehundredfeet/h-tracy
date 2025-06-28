package tracy;

import haxe.macro.Expr;
import haxe.macro.ExprTools;

#if !macro
@:build(idl.macros.MacroTools.buildHXCPPIDLType("${TRACY_IDL_DIR}/tracy.idl"))
#end
@:headerInclude("tracy/Tracy.hpp")
class Tracy {
	static function touch() :Void{

	}


	// stupid macro to force the Tracy header to be included
	public static macro function activate() :Expr{
		return macro @:privateAccess Tracy.touch();
	}

	public static inline function zoneScoped() : Tracy{
		#if cpp
		untyped __cpp__("ZoneScoped");
		#end
		return null;
	}

	public static inline function frameMark() : Tracy{
		#if cpp
		untyped __cpp__("FrameMark");
		#end
		return null;
	}

	public static macro function zoneScopedN(name:String):Expr {
		var str = 'ZoneScopedN("${name}")';
		return macro untyped __cpp__($v{str});
	}

	public static macro function zoneValue(value:Int):Expr {
		var str = 'ZoneValue("${value}")';
		return macro untyped __cpp__($v{str});
	}


	public static macro function plot(name:String, value:Expr)	:Expr {
		var str = 'TracyPlot("${name}", {0})';
		var m1 = macro untyped __cpp__($v{str}, $value);
		return m1;
	}

//	ZoneScopedNC
	public static macro function setThreadName(name:String):Expr {
		var str = 'tracy::SetThreadName("${name}")';
		return macro untyped __cpp__($v{str});
	}
	
}
