class ProjectUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  def default_url(*args)
      ActionController::Base.helpers.asset_path([version_name, "form-background.jpg"].compact.join('_'))
    end
    # Remove everything else
end
