module Qqfileuploader
  module Generators
    class AssetsGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def generate_assets
        copy_file "fileuploader.js", "app/assets/javascripts/fileuploader.js"
        copy_file "jquery.fileuploader.js", "app/assets/javascripts/fileuploader.js"
      end
    end
  end
end