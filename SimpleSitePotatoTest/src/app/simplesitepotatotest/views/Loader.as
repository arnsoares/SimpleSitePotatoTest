package app.simplesitepotatotest.views
{
	//import potato.modules.navigation.presets.YAMLSiteView;
	import potato.modules.navigation.presets.YAMLLoaderView;
	import flash.events.ProgressEvent;
	import potato.modules.navigation.ViewLoader;
	import flash.events.Event;
	import com.greensock.TweenMax;
	import app.simplesitepotatotest.assets.LoaderView;

	[SWF(width='760', height='400', backgroundColor='#FFFFFF', frameRate='30')]
	public class Loader extends YAMLLoaderView
	{
		public static var loaderView:LoaderView;
		public static var vigentView:String;
		
		public function Loader()
		{
			super();
		}
		
		override public function init():void
		{
			super.init();
			
			loaderView = new LoaderView();
			loaderView.y = 42;
			addChild(loaderView);
			
			var vl:ViewLoader = loaderFor("main");
			vl.addEventListener(Event.COMPLETE, onLoadComplete);
			vl.start();
		}
		
		public static function showLoaderFor(vl:ViewLoader):void
		{
			loaderView.show(vl);
		}
		
		public function onLoadComplete(e:Event):void
		{
			var id:String = e.target.view.id; 
			changeView(id);
		}
		
		override public function resize():void
		{
			trace("Loader::resize()");
		}
		
		override public function dispose():void
		{
			trace("Loader::dispose()");
		}
	
	}

}