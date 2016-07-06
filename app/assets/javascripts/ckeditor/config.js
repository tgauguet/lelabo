

CKEDITOR.editorConfig = function (config) {
	// ... other configuration ...

	config.toolbar_Full = [
		{ name: 'document', items: ["Bold", "Italic", "Underline", "Strike",'-', 'RemoveFormat'] },
    	{ name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight'] }, 
    	{ name: 'styles', items: ['Format', "Smiley"] }, 
	];

	config.toolbar_mini = [
		{ name: 'document', items: ["Bold", "Italic", "Underline", "Strike",'-', 'RemoveFormat'] },
    	{ name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight'] }, 
    	{ name: 'styles', items: ['Format', "Smiley"] }, 
	];
    config.removePlugins = 'elementspath';
    config.resize_enabled = false;


	// ... rest of the original config.js ...
}
