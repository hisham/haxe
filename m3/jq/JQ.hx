package m3.jq;

import js.html.DOMWindow;
import js.html.Document;
import js.html.Element;

typedef JQEvent = {> js.JQuery.JqEvent,
	@:optional var originalEvent: Dynamic;
}

typedef JQXHR = {
	@:optional var status:Int;
	@:optional var statusCode:Int;
	@:optional var message: String;
	@:optional var name: String;
	@:optional var stack: String;
	@:optional var fail: JQXHR->String->Dynamic->JQXHR;
}

typedef AjaxOptions = {
	@:optional var url:String;
	@:optional var async:Bool;
	@:optional var type:String; //"GET", "POST", etc..
	/**
		function(data:Dynamic, textStatus:String, jqXHR:JQXHR)
	**/
	@:optional var success:Dynamic->Dynamic->JQXHR->Void;
	/**
		function(jqXHR:JQXHR, textStatus:String, errorThrown:String)
	**/
	@:optional var error:JQXHR->String->String->Void;
	/**
		function(jqXHR:JQXHR, textStatus:String)
	**/
	@:optional var complete:JQXHR->String->Void;
	@:optional var dataType:String;
	@:optional var cache:Bool;
	@:optional var contentType:Dynamic;
	@:optional var crossDomain:Bool;
	@:optional var data:Dynamic;
	@:optional var isLocal:Bool;
	@:optional var jsonp:Dynamic;
	@:optional var processData:Bool;
	@:optional var timeout:Dynamic;

}

// typedef PositionOpts = {
// 	@:optional my: String,
// 	@:optional at: String,
// 	@:optional of: Dynamic,
// 	@:optional "using": Dynamic,
// 	@:optional within: Dynamic,
// 	@:optional collision: String
// }

typedef UIPosition = {
	top: Int,
	left: Int
}

typedef UISize = {
	height: Int,
	width: Int
}

@:native("$.ui.keyCode")
extern class KeyCode {
	public static inline var BACKSPACE: Int = 8;
	public static inline var COMMA: Int = 188;
	public static inline var DELETE: Int = 46;
	public static inline var DOWN: Int = 40;
	public static inline var END: Int = 35;
	public static inline var ENTER: Int = 13;
	public static inline var ESCAPE: Int = 27;
	public static inline var HOME: Int = 36;
	public static inline var LEFT: Int = 37;
	public static inline var PAGE_DOWN: Int = 34;
	public static inline var PAGE_UP: Int = 33;
	public static inline var PERIOD: Int = 190;
	public static inline var RIGHT: Int = 39;
	public static inline var SPACE: Int = 32;
	public static inline var TAB: Int = 9;
	public static inline var UP: Int = 38;
	public static inline var NUMPAD_ENTER: Int = 108;
}

@:native("$")
extern class JQ extends js.JQuery {

	static var ui: {keyCode: KeyCode, dialog: Dynamic, contains: Dynamic, autocomplete: Dynamic};
	static var fn: Dynamic;
	static var browser: Dynamic;
	static var noop: Void->Void;

	@:overload(function(j:js.JQuery):Void{})
	@:overload(function(j:Document):Void{})
	@:overload(function(j:DOMWindow):Void{})
	@:overload(function(j:Element):Void{})
	@:overload(function(selector:String, content:JQ):Void{})
	function new( html : String ) : Void;

	// attributes
	@:overload(function(clazz: String,?duration: Int):JQ{})
	override function addClass( clazz: String ): JQ;
	@:overload(function(?clazz: String,?duration: Int):JQ{})
	override function removeClass( ?className : String ) : JQ;

	@:overload(function(name:String,value:String):JQ{})
	@:overload(function(map:{}):JQ{})
	override function attr( name: String ): String;

	@:overload(function(prop:String,value:Int):JQ{})
	@:overload(function(prop:String,value:String):JQ{})
	@:overload(function(map:{}):JQ{})
	override function css( prop : String ) : String;
	
	@:overload(function(value:String):JQ{})
	@:overload(function(values: Array<String>):JQ{})
	override function val() : String;


	// Size & Position
	@:overload(function(value:String):JQ{})
	@:overload(function(value:Int):JQ{})
	override function width() : Int;
	
	@:overload(function(value:String):JQ{})
	@:overload(function(value:Int):JQ{})
	override function height() : Int;

	@:overload(function(args: Dynamic): Void{})
	@:overload(function(value: { left : Int, top : Int }):js.JQuery{})
	override function position() : { left : Int, top : Int };


	// current group manipulation
	@:overload(function(value:js.JQuery):JQ{})
	@:overload(function(value:Element):JQ{})
	@:overload(function(value:Array<Element>):JQ{})
	override function add( selector : String, ?context : js.JQuery ) : JQ;
	
	@:overload(function(j:js.JQuery):JQ{})
	@:overload(function(j:DOMWindow):JQ{})
	@:overload(function(j:Element):JQ{})
	override function children( ?selector : String ) : JQ;
	override function clone( ?withDataAndEvents : Bool ) : JQ;

	@:overload(function( f : Int -> Element -> Void ):JQ{})
	override function each( f : Void -> Void ) : JQ;

	@:overload(function(fcn : Void->Bool):JQ{})
	override function filter( selector : String ) : JQ;

	@:overload(function(j:js.JQuery):JQ{})
	@:overload(function(j:DOMWindow):JQ{})
	@:overload(function(j:Element):JQ{})
	override function find( selector : String ) : JQ;

	@:overload(function(selector:js.JQuery):Int{})
	@:overload(function(selector:DOMWindow):Int{})
	@:overload(function(selector:Element):Int{})
	override function index( ?selector : String ) : Int;
	override function next( ?selector : String ) : JQ;

	@:overload(function(j:js.JQuery):JQ{})
	@:overload(function(j:DOMWindow):JQ{})
	@:overload(function(j:Element):JQ{})
	override function parent( ?selector : String ) : JQ;

	@:overload(function(j:js.JQuery):JQ{})
	@:overload(function(j:DOMWindow):JQ{})
	@:overload(function(j:Element):JQ{})
	override function prev( ?selector : String ) : JQ;

	@:overload(function(j:js.JQuery):JQ{})
	@:overload(function(j:DOMWindow):JQ{})
	@:overload(function(j:Element):JQ{})
	override function siblings( ?selector : String ) : JQ;


	// DOM changes
	@:overload(function(value: js.JQuery):JQ{})
	@:overload(function(value: Element):JQ{})
	override function before( html : String ) : JQ;

	@:overload(function(value: js.JQuery):JQ{})
	@:overload(function(value: Element):JQ{})
	override function after( html : String ) : JQ;

	@:overload(function(value:js.JQuery):JQ{})
	@:overload(function(value:Element):JQ{})
	override function append( html : String ) : JQ;

	@:overload(function( selector: js.JQuery ) : JQ{})
	@:overload(function( selector: Element ) : JQ{})
	override function appendTo( selector: String ): JQ;
	override function empty() : JQ;

	@:overload(function(value:js.JQuery):JQ{})
	@:overload(function(value:Element):JQ{})
	override function insertBefore( html : String ) : JQ;

	@:overload(function(value:js.JQuery):JQ{})
	@:overload(function(value:Element):JQ{})
	override function insertAfter( html : String ) : JQ;

	@:overload(function(value:js.JQuery):JQ{})
	@:overload(function(value:Element):JQ{})
	override function prepend( html : String ) : JQ;

	@:overload(function(value:js.JQuery):JQ{})
	@:overload(function(value:Element):JQ{})
	override function prependTo( html : String ) : JQ;


	// animation
	@:overload(function(?duration:Int,?easing:String,?call:Void->Void) : JQ{})
	override function hide( ?duration : Int, ?call : Void -> Void ) : JQ;

	@:overload(function(?duration:Int,?easing:String,?call:Void->Void) : JQ{})
	override function show( ?duration : Int, ?call : Void -> Void ) : JQ;

	@:overload(function(?duration:String, ?call:Void->Void) : JQ{})
	@:overload(function(?duration:Int,?easing:String,?call:Void->Void) : JQ{})
	override function slideToggle( ?duration : Int, ?call : Void -> Void ) : JQ;

	@:overload(function(effect: String,?duration:Int,?easing:String,?call:Void->Void) : JQ{})
	@:overload(function(?duration:Int,?easing:String,?call:Void->Void) : JQ{})
	override function toggle( ?duration : Int, ?call : Void -> Void ) : JQ;
	

	// Events
	override function blur( ?callb : JQEvent -> Void ) : JQ;
	override function change( ?callb : JQEvent -> Void ) : JQ;

	@:overload(function(callb: Void->Void):JQ { } )
	@:overload(function(callb: JQEvent->Void):JQ{})
	@:overload(function(callb: Void->Bool):JQ{})
	override function click( ?callb : JQEvent -> Void ) : JQ;
	override function dblclick( ?callb : JQEvent -> Void ) : JQ;
	override function error( ?callb : JQEvent -> Void ) : JQ;
	override function focus( ?callb : JQEvent -> Void ) : JQ;
	override function focusin( ?callb : JQEvent -> Void ) : JQ;
	override function focusout( ?callb : JQEvent -> Void ) : JQ;

	@:overload(function( onOver : Void -> Void, ?onOut : Void -> Void ) : JQ{})
	@:overload(function( onInOut:JQEvent->Void ) : JQ{})
	override function hover( onIn : JQEvent -> Void, ?onOut : JQEvent -> Void ) : JQ;

	@:overload(function( callb : JQEvent -> Bool ) : JQ {})
	override function keydown( ?callb : JQEvent -> Void ) : JQ;

	@:overload(function( callb : JQEvent -> Bool ) : JQ {})
	override function keypress( ?callb : JQEvent -> Void ) : JQ;

	@:overload(function( callb : JQEvent -> Bool ) : JQ {})
	override function keyup( ?callb : JQEvent -> Void ) : JQ;

	override function mousedown( ?callb : JQEvent -> Void ) : JQ;
	@:overload(function( ?callb : Void -> Void ) : JQ{})
	override function mouseout( ?callb : JQEvent -> Void ) : JQ;
	@:overload(function( ?callb : Void -> Void ) : JQ{})
	override function mouseover( ?callb : JQEvent -> Void ) : JQ;
	@:overload(function( ?callb : Void -> Void ) : JQ{})
	override function mousemove( ?callb : JQEvent -> Void ) : JQ;
	
	@:overload(function(events : String, callb : JQEvent -> Bool):JQ { } )
	@:overload(function(events : String, callb : Void -> Bool):JQ { } )
	override function bind( events : String, callb : JQEvent -> Void ) : JQ;

	override function one( events : String, callb : JQEvent -> Void ) : JQ;

	@:overload(function( events: String, ?callb: JQEvent->Dynamic -> Void ) : Void{})
	@:overload(function( events: String, ?selector: String, ?callb: JQEvent->Dynamic -> Void) : Void{})
	override function on( events : String, callb : JQEvent -> Void ) : JQ;


	// Other
	function destroy():Void;
	function fnDestroy():Void;
	function map(fcn: JQ->Int->Dynamic): Void;
	
	
	//my custom jQuery functions
	function exists(): Bool;
	function isVisible():Bool;
	function hasAttr(attrName: String):Bool;

	//my custom widgets
	function buttonsetv(i:Int, ?cmd: String):JQ;
	function helpToolTips(): JQ;
	
	//jQueryUI
	function accordion(options:Dynamic):JQ;

	@:overload(function(arg1:String, arg2:String):JQ{})
	function autocomplete(opts:Dynamic):JQ;
	function button(?opts:Dynamic):JQ;
	function menu(opts: Dynamic): JQ;
	function slider(options: Dynamic): JQ;

	// @:overload(function(cmd : String): Bool{})
	// @:overload(function(cmd: String, opt: String): Dynamic{})
	// @:overload(function(cmd: String, opt: String, newVal: Dynamic): JQ{})
	// function sortable(?opts: {connectWith: String, cancel: String, remove: Dynamic, receive: Dynamic}): JQ.JQSortable;

	@:overload(function(cmd : String):Bool{})
	@:overload(function(cmd : String, arg1 :Dynamic):Void{})
	@:overload(function(cmd:String, opt:String, newVal:Dynamic):JQ{})
	function tabs(?opts:Dynamic):JQ;
	function tooltip(?opts:Dynamic):JQ;

	@:overload(function(): Int{})
	function zIndex(zIndex: Int): JQ;


	//statically available functions
	public static function isNumeric(val:Dynamic):Bool;
	public static function isArray(val:Dynamic):Bool;
	public static function trim(str:String):String;

	public static function ajax(ajaxOptions:AjaxOptions): JQXHR;
	public static function getJSON(url:String, ?data:Dynamic, ?success:Dynamic->Dynamic->Dynamic->Void): JQXHR;
	public static function getScript(url:String, ?success:Dynamic->String->JQXHR->Void): JQXHR;

	@:overload(function(parent: js.JQuery, child: js.JQuery): Bool{})
	@:overload(function(parent: Element, child: js.JQuery): Bool{})
	public static function contains( parent : Element, child : Element ) : Bool;

	@:overload(function(qualifiedName: String, parent: Dynamic, definition: Dynamic):Void{})
	public static function widget(qualifiedName: String, definition: Dynamic): Void;

	@:overload(function<T>(deep: Bool, target: T, object1: T, ?object2: T, ?object3: T, ?object4: T):T{})
	public static function extend<T>(target: T, object1: T, ?object2: T, ?object3: T, ?object4: T): T;

	/**
		Return the current JQuery element (in a callback), similar to $(this) in JS.
	**/
	static var cur(get, null) : JQ;
	static var curNoWrap(get, null) : Dynamic;

	private static inline function get_cur() : JQ {
		return untyped __js__("$(this)");
	}
	private static inline function get_curNoWrap<T>() : T {
		return untyped __js__("this");
	}

	private static function __init__() : Void untyped {
		JQ.fn.exists = function(){
		    return JQ.cur.length>0;
		};
		JQ.fn.isVisible = function(){
		    return JQ.cur.css("display") != "none";
		};
		JQ.fn.hasAttr = function(name) {  
		   return JQ.cur.attr(name) != undefined;
		};
	}
}