package m3.jq;

import m3.jq.JQ;

typedef JQTooltipOps = {
	@:optional var content: Dynamic; /*function() {
			// support: IE<9, Opera in jQuery <1.7
			// .text() can't accept undefined, so coerce to a string
			var title = $( this ).attr( "title" ) || "";
			// Escape title, since we're going from an attribute to raw HTML
			return $( "<a>" ).text( title ).html();
	},*/
	@:optional var hide: Dynamic; //true,
	// Disabled elements have inconsistent behavior across browsers (#8661)
	@:optional var items: Dynamic; //"[title]:not([disabled])",
	@:optional var position: Dynamic; /*{
		my: "left top+15",
		at: "left bottom",
		collision: "flipfit flip"
	},*/
	@:optional var show: Dynamic; //true,
	@:optional var tooltipClass: String; //null,
	@:optional var track: Bool;//false,

	// callbacks
	@:optional var close: JQEvent->{tooltip: JQ}->Void;//null,
	@:optional var open: JQEvent->Dynamic->Void; //null
}

class JQTooltipHelper {
	public static function updateContent(t: JQTooltip, newContent: String): Void {
		t.tooltip("option", "content", newContent);
	}

	public static function getContent(t: JQTooltip): String {
		return t.tooltip("option", "content");
	}

	public static function enable(t: JQTooltip): String {
		return t.tooltip("enable");
	}

	public static function disable(t: JQTooltip): String {
		return t.tooltip("disable");
	}

	public static function open(t: JQTooltip): String {
		return t.tooltip("open");
	}

	public static function close(t: JQTooltip): String {
		return t.tooltip("close");
	}
}

@:native("$")
extern class JQTooltip extends JQ {
	@:overload(function<T>(cmd : String):T{})
	@:overload(function<T>(cmd:String, opt:String):T{})
	@:overload(function<T>(cmd:String, opt:String, arg:Dynamic):Void{})
	function tooltip(?opts: JQTooltipOps): JQTooltip;
}