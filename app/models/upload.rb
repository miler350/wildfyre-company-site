class Upload < ActiveRecord::Base
  belongs_to :project
  mount_uploader :attachment, UploadUploader
end
