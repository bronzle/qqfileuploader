module Qqfileuploader
  
  class UploadedFileXhr
    
    def initialize(params, request)
      @params = params
      @request = request
    end
    
    def name
      @params[:qqfile]
    end
    
    def size
      if @request.env.include?("CONTENT_LENGTH")
        return @request.env["CONTENT_LENGTH"]
      else
        raise "Getting content length is not supported."
      end
    end
    
    def save(file_path)
      file = File.new(file_path, "wb")
      str =  @request.body.read
      file.write(str)
      file.close
      
      true
    end
    
  end
  
end