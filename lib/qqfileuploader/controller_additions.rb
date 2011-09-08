module Qqfileuploader
  module ControllerAdditions
    module ClassMethods
      
      def handles_uploads(*args)
        
        FileUploader.add_before_filter(self, :handles_uploads, *args)
        
      end
      
      def file_uploader_class
        FileUploader
      end
      
    end
    
    def self.included(base)
      base.extend ClassMethods
      # line below adds some helper methods, if needed
     base.helper_method :handle_upload
    end
    
    def handle_upload(upload_dir, replace = false, *args)
      @file_uploader ||= FileUploader.new(self, args)
      @file_uploader.handles_upload(upload_dir, replace)
    end
    
  end
end

if defined? ActionController
#  binding.pry
  ActionController::Base.class_eval do
#    binding.pry
    include Qqfileuploader::ControllerAdditions
#    binding.pry
  end
end