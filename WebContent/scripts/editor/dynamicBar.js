CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.toolbar = 'DynamicBar';
	
    config.toolbar_DynamicBar =
    	[
    	    ['Source','-','Save','NewPage','Preview','-','Templates'],
    	    ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
    	    ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
    	    '/',
    	    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
    	    ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv'],
    	    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
    	    ['Link','Unlink','Anchor'],
    	    ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
    	    '/', 
    	    ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
    	    ['Styles','Format','Font','FontSize'],
    	    ['TextColor','BGColor'],
    	    ['Maximize', 'ShowBlocks','-','About']
    	]; 
};
