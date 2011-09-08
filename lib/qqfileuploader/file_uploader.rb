module Qqfileuploader
  
  class FileUploader
    
    def initialize (controller, *args)
      
      @controller = controller
      @params = controller.params
      @request = controller.request
      
      @options = args.extract_options!
      
      @allowed_extensions = @options[:allow_extensions] || []
      @size_limit = @options[:size_limit] || 999999

        #check server settings?

      if @params[:qqfile]
        @file = UploadedFileXhr.new(@params, @request)
      elsif @params[:file_upload] && @params[:file_upload][:qqfile]
        @file = UploadedFileForm.new(@params)
      else
        @file = nil
      end
            
    end
  
    # def initialize (allowed_extensions = [], size_limit = 10485760)
    #   @allowed_extensions = allowed_extensions
    #   @size_limit = size_limit
    #   
    #   #check server settings?
    #   
    #  if params[:qqfile]
    #     @file = UploadedFileXhr.new
    #   elsif params[:file_upload] && params[:file_upload][:qqfile]
    #     @file = UploadedFileForm.new
    #   else
    #     @file = nil
    #   end
    #   
    # end
    
    def handles_upload (upload_dir, replace = false)
      
      unless (File.writable?(upload_dir))
        return failure "Upload directory is not writable"
      end
      
      unless @file
        return failure "No file(s) were uploaded"
      end
      
      unless @file.size
        return failure "File is empty"
      end
      
      if @file.size.to_i > @size_limit
        return failure "File is too large"
      end
      
      filename = @file.name
      file_ext = File.extname(filename)
      file_base = File.basename(filename, file_ext)
      
      unless @allowed_extensions.empty? && !@allowed_extensions.include?(file_ext)
        return failure "Not an allowed extension, it should be one of #{@allowed_extensions.join(", ")}"
      end
      
      unless replace
        while (File.exist?(upload_dir + '/' + filename))
          filename = "#{file_base}#{Random.new.rand(10..99)}#{file_ext}"
        end
      end
      
      if @file.save(upload_dir + "/" + filename)
        return {:success => true, :file_name => filename}
      else 
        return failure "Could not save uploaded file. The upload was cancelled, or server error encountered"
      end
      
    end

    def self.add_before_filter(controller_class, method, *args)
      options = args.extract_options!
      
      controller_class.send(:before_filter, options) do |controller|
        controller.class.file_uploader_class.new(controller, options).send(method)
      end
    end
    
    def handles_uploads
    
      puts "handles_uploads_filter"
      puts @params
    
    end

    private
    
    def failure(msg)
      return {:success => false, :error => msg}
    end
  
  end
end