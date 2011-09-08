/**
 * Depends on Valums file uploader
 */

(function($) {
	
	
	$.fn.upload = function(options) {	
		
		this.each(function() {
			$(this).data('fileUploader', new qq.FileUploaderBasic(options))
		});
		
		return this;
	};
	
})(jQuery);