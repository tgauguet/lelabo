CKEDITOR.config.toolbar= [
	{ name: 'document', items: ["Bold", "Italic", "Underline", "Strike",'-'] },
	{ name: 'paragraph', items: ['JustifyLeft', 'JustifyCenter', 'JustifyRight'] },
	{ name: 'styles', items: ['Format', "Smiley"] }
];

CKEDITOR.editorConfig = function (config) {
	// ... other configuration ...

	config.toolbar_Full = [
		{ name: 'document', items: ["Bold", "Italic", "Underline", "Strike",'-'] },
    	{ name: 'paragraph', items: ['JustifyLeft', 'JustifyCenter', 'JustifyRight'] },
    	{ name: 'styles', items: ['Format', "Smiley"] }
	];

	config.toolbar_mini = [
		{ name: 'document', items: ["Bold", "Italic", "Underline", "Strike",'-'] },
    	{ name: 'paragraph', items: ['JustifyLeft', 'JustifyCenter', 'JustifyRight'] },
    	{ name: 'styles', items: ['Format', "Smiley"] }
	];
    config.removePlugins = 'elementspath';
    config.resize_enabled = false;
		config.resize_dir = 'vertical';
    config.smiley_columns = 12;
    config.font_defaultLabel = 'Helvetica';
    config.disableObjectResizing = true;

    config.smiley_images=[ 'EmojiSmiley-01.png', 'Emoji Smiley-02.png', 'Emoji Smiley-03.png', 'Emoji Smiley-04.png', 'Emoji Smiley-05.png', 'Emoji Smiley-06.png', 'Emoji Smiley-07.png', 'Emoji Smiley-08.png', 'Emoji Smiley-09.png', 'Emoji Smiley-10.png','Emoji Smiley-11.png', 'Emoji Smiley-12.png', 'Emoji Smiley-13.png', 'Emoji Smiley-14.png', 'Emoji Smiley-15.png', 'Emoji Smiley-16.png', 'Emoji Smiley-17.png', 'Emoji Smiley-18.png', 'Emoji Smiley-19.png', 'Emoji Smiley-20.png','Emoji Smiley-21.png', 'Emoji Smiley-22.png', 'Emoji Smiley-23.png', 'Emoji Smiley-24.png', 'Emoji Smiley-25.png', 'Emoji Smiley-26.png', 'Emoji Smiley-27.png', 'Emoji Smiley-28.png', 'Emoji Smiley-29.png', 'Emoji Smiley-30.png','Emoji Smiley-31.png', 'Emoji Smiley-32.png', 'Emoji Smiley-33.png', 'Emoji Smiley-34.png', 'Emoji Smiley-35.png', 'Emoji Smiley-36.png', 'Emoji Smiley-37.png', 'Emoji Smiley-38.png', 'Emoji Smiley-39.png', 'Emoji Smiley-40.png', 'Emoji Smiley-41.png', 'Emoji Smiley-42.png', 'Emoji Smiley-43.png', 'Emoji Smiley-44.png', 'Emoji Smiley-45.png', 'Emoji Smiley-46.png', 'Emoji Smiley-47.png', 'Emoji Smiley-48.png', 'Emoji Smiley-49.png', 'Emoji Smiley-50.png', 'Emoji Smiley-51.png', 'Emoji Smiley-52.png', 'Emoji Smiley-53.png', 'Emoji Smiley-54.png', 'Emoji Smiley-55.png', 'Emoji Smiley-56.png', 'Emoji Smiley-57.png', 'Emoji Smiley-58.png', 'Emoji Smiley-97.png', 'Emoji Smiley-98.png', 'Emoji Smiley-119.png', 'Emoji Smiley-120.png', 'Emoji Smiley-113.png', 'Emoji Smiley-114.png', 'Emoji Smiley-110.png', 'Emoji Smiley-106.png', 'Emoji Smiley-107.png', 'Emoji Smiley-108.png', 'Emoji Smiley-109.png', 'Emoji Smiley-123.png', 'Emoji Objects-175.png', 'Emoji Objects-176.png', 'Emoji Objects-177.png', 'Emoji Objects-180.png', 'Emoji Objects-199.png', 'Emoji Objects-201.png', 'Emoji Objects-43.png', 'Emoji Objects-51.png' ,'Emoji Objects-202.png', 'Emoji Objects-203.png', 'Emoji Objects-204.png', 'Emoji Objects-205.png', 'Emoji Objects-206.png', 'Emoji Objects-207.png', 'Emoji Objects-208.png', 'Emoji Objects-209.png', 'Emoji Objects-210.png', 'Emoji Objects-211.png', 'Emoji Objects-212.png', 'Emoji Objects-213.png' ,'Emoji Objects-214.png', 'Emoji Objects-215.png', 'Emoji Objects-216.png', 'Emoji Objects-217.png', 'Emoji Objects-218.png', 'Emoji Objects-219.png', 'Emoji Objects-220.png', 'Emoji Objects-221.png', 'Emoji Objects-222.png', 'Emoji Objects-223.png', 'Emoji Objects-224.png', 'Emoji Objects-225.png' ,'Emoji Objects-226.png', 'Emoji Objects-227.png', 'Emoji Objects-228.png', 'Emoji Objects-230.png', 'Emoji Objects-52.png', 'Emoji Objects-57.png', 'Emoji Objects-61.png', 'Emoji Objects-70.png', 'Emoji Natur-06.png', 'Emoji Natur-01.png', 'Emoji Natur-05.png', 'Emoji Natur-08.png' ,'Emoji Natur-30.png', 'Emoji Natur-70.png', 'Emoji Orte-92.png', 'Emoji Orte-93.png', 'Emoji Orte-94.png', 'Emoji Orte-95.png', 'Emoji Orte-96.png', 'Emoji Orte-97.png', 'Emoji Orte-98.png', 'Emoji Orte-99.png', 'Emoji Orte-100.png', 'Emoji Orte-101.png', 'Emoji Smiley-169.png', 'Emoji Smiley-170.png', 'Emoji Smiley-171.png', 'Emoji Smiley-172.png', 'Emoji Smiley-173.png'];

	// ... rest of the original config.js ...
}
