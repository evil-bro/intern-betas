# encoding: utf-8

class CompanylogoUploader < CarrierWave::Uploader::Base
	storage :fog
	def cache_dir
		"#{Rails.root}/tmp/uploads/companylogos"
	end

	include CarrierWave::MiniMagick

	process :resize_to_fill => [200, 200]

	def store_dir
		"companylogos/#{model.id}"
	end

	def extension_white_list
    	%w(jpg jpeg png)
	end
end