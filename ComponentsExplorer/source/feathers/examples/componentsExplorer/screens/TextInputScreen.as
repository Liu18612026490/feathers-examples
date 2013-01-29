package feathers.examples.componentsExplorer.screens
{
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.PanelScreen;
	import feathers.controls.Screen;
	import feathers.controls.TextInput;
	import feathers.events.FeathersEventType;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.system.DeviceCapabilities;

	import starling.core.Starling;

	import starling.display.DisplayObject;
	import starling.events.Event;

	[Event(name="complete",type="starling.events.Event")]

	public class TextInputScreen extends PanelScreen
	{
		public function TextInputScreen()
		{
			this.addEventListener(FeathersEventType.INITIALIZE, initializeHandler);
		}

		private var _backButton:Button;
		private var _input:TextInput;

		protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();

			this._input = new TextInput();
			const inputLayoutData:AnchorLayoutData = new AnchorLayoutData();
			inputLayoutData.horizontalCenter = 0;
			inputLayoutData.verticalCenter = 0;
			this._input.layoutData = inputLayoutData;
			this.addChild(this._input);

			this.headerProperties.title = "Text Input";

			if(!DeviceCapabilities.isTablet(Starling.current.nativeStage))
			{
				this._backButton = new Button();
				this._backButton.label = "Back";
				this._backButton.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);

				this.headerProperties.leftItems = new <DisplayObject>
				[
					this._backButton
				];
			}

			// handles the back hardware key on android
			this.backButtonHandler = this.onBackButton;
		}

		private function onBackButton():void
		{
			this.dispatchEventWith(Event.COMPLETE);
		}

		private function backButton_triggeredHandler(event:Event):void
		{
			this.onBackButton();
		}
	}
}
