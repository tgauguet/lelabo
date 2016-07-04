CKEDITOR.editorConfig = function (config) {
	// ... other configurations ...
	config.toolbar_mini = [
		{ name: "font-style", items: ["Bold", "Italic", "Underline", "Strike", "-", "RemoveFormat"] },
		{ name: "basic-tools", items: ["JustifyLeft","JustifyCenter","JustifyRight"]},
		{ name: "lists", items: ["NumberedList", "BulletedList"] },
		{ name: "styles", items: ["FontSize"] },
	];
	config.toolbar = "simple";
	
	// ... rest of the original config.js ...

    config.removePlugins = 'elementspath';
	config.resize_enabled = false;

}
