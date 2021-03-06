package simplesite.assets
{
	
	import com.greensock.TweenMax;
	
	import flash.events.MouseEvent;
	
	import potato.modules.navigation.ViewLoader;
	import potato.modules.navigation.ViewMessenger;
		
	public class Menu extends MenuAsset
	{
		public var menuArray:Array;
		protected var _messenger:ViewMessenger;
	
		public function Menu(mainMessenger:ViewMessenger)
		{
			super();
			_messenger = mainMessenger;
			
			init();
		}
		
		public function init():void
		{
			menuArray = new Array();
			menuArray[0] = {bt:btOne, view:"home"};
			menuArray[1] = {bt:btTwo, view:"album"};
			menuArray[2] = {bt:btTree, view:"webcam"};
			
			menuAction();
		}
		
		public function menuAction():void
		{
			for(var i:Number = 0; i < menuArray.length; i++)
			{
				menuArray[i].bt.addEventListener(MouseEvent.ROLL_OVER, handleBt);
				menuArray[i].bt.addEventListener(MouseEvent.ROLL_OUT, handleBt);
				menuArray[i].bt.addEventListener(MouseEvent.CLICK, handleBt);
				menuArray[i].bt.mouseChildren = false;
				menuArray[i].bt.buttonMode = true;
				menuArray[i].bt.ind = i;
			}
		}
		
		public function handleBt(e:MouseEvent):void
		{
			//var bt:GenericButton = e.target;
			var ind:Number = e.target.ind;
			var view:String = menuArray[ind].view;
			
			switch(e.type)
			{
				case MouseEvent.ROLL_OVER:
				TweenMax.to(e.target, .3, {tint:0xff0000});
				break;
				
				case MouseEvent.ROLL_OUT:
				TweenMax.to(e.target, .3, {tint:null});
				break;
				
				case MouseEvent.CLICK:
				
					var vl:ViewLoader = _messenger.changeView(view);
					if (vl)
					{
						enabled = false;
						
						simplesite_loader.vigentView = view;
						simplesite_loader.showLoaderFor(vl);
					}
					
				break;
			}
		}
		
		override public function set enabled(value:Boolean):void
		{
			mouseChildren = value;
		}
	}
}