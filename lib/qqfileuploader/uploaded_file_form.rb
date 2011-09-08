module Qqfileuploader
  
  class UploadedFileForm

    def initialize(params)
      @params = params
    end

    def name
      @params[:file_upload][:my_file].original_filename
    end
    
    def size
      File.size @params[:file_upload][:qqfile].tempfile
    end
    
    def save(file_path)
      FileUtils.cp @params[:file_upload][:qqfile].tempfile, file_path
      
      File.exists?(file_path)
    end
  end
end