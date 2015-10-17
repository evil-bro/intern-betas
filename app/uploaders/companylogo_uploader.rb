# encoding: utf-8

class CompanylogoUploader < CarrierWave::Uploader::Base
	include CarrierWave::MiniMagick

	storage :file

	def store_dir
		"uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
	end

	def extension_white_list
    	%w(jpg jpeg png)
	end

	process :resize_to_fill => [200, 200]
end